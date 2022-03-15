



import Foundation
protocol View: AnyObject {
    func display(result: String)
    func selectVisualOperator()
    func displayACTittle(title: String)

}

protocol Presenter {
    var view: View? { get set }
    
    func handleNumberSelection(number: Int)
    func handleDecimalSelection(mainLabelText: String?)
    func handleACButton(number: Int)
    func handleMoreOrLessButton(number: Int)
    func handlePercentageButton(number: Int)
    func handleEqualsButton(number: Int)
    func handleDivisionButton(number: Int)
    func handleMultiplicationButton(number: Int)
    func handleSubtractionButton(number: Int)
    func handleSumatoryButton(number: Int)
}

class CalculatorPresenter: Presenter {
    
    
    
    
    
    
    
    
    
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores auxiliares totales
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    //formateo de los valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Formateo de valores por pantalla en formato científico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    weak var view: View?
    
    private enum operationType{
        case none, sumatory, substraction, multiplication, division, percent
    }
    
    private var temp: Double = 0
    private var isAnOperationSelecter: Bool = false
    private let maxLabelLenght = 9
    private var total: Double = 0
    private var thereAreSelectedDecimals: Bool = false
    private let whatsYourDecimalSeparator = Locale.current.decimalSeparator!
    private var operation: operationType = .none
    
    private func result(){
        
        switch operation {
        
        case .none:
            //no hacer nada
            break
        case .sumatory:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > maxLabelLenght{
            view?.display(result: printScientificFormatter.string(from: NSNumber(value: total))!)
        }else{
            view?.display(result:printFormatter.string(from: NSNumber(value: total))!)

        }
    }
    
    private func clear(){
        operation = .none
        //ACButton.setTitle("AC", for: .normal)
        //if temp != 0{
            temp = 0
        view?.display(result: "0")
       // }else{
            total = 0
            result()
        //}
    }
    
    
    
    func handleNumberSelection(number: Int) {
        
        view?.display(result: String(number))
        view?.displayACTittle(title: "C")
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        
        if !isAnOperationSelecter && currentTemp.count >= maxLabelLenght{
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // ya se selecciono una operacion
        if isAnOperationSelecter{
            total = total == 0 ? temp : total
            view?.display(result: "")
            currentTemp = ""
            isAnOperationSelecter = false
        }
        
        if thereAreSelectedDecimals {
            currentTemp = "\(currentTemp)\(whatsYourDecimalSeparator)"
            thereAreSelectedDecimals = false
        }
        
        let TouchedNumber = number
        temp = Double(currentTemp + String(TouchedNumber))!
        let formatedResult = printFormatter.string(for: NSNumber(value: temp)) ?? ""
        view?.display(result: formatedResult)
        
        view?.selectVisualOperator()
        
        
        print(number)
        
    }
    
   func handleDecimalSelection(mainLabelText: String?) {
   
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !isAnOperationSelecter && currentTemp.count >= maxLabelLenght{
            return
        }

        let lastLabelCaracter = mainLabelText!.last
        let lastLabelCaracterAsString = String(lastLabelCaracter!)
        
        if lastLabelCaracterAsString == whatsYourDecimalSeparator{

        }else{
            view?.display(result: mainLabelText! + whatsYourDecimalSeparator)
        }
        thereAreSelectedDecimals = true

        view?.selectVisualOperator()

    }
    
    func handleACButton(number: Int) {
        clear()
    }
    
    func handleMoreOrLessButton(number: Int) {
        temp = temp * (-1)
        view?.display(result: printFormatter.string(from: NSNumber(value: temp))!)
    }
    
    func handlePercentageButton(number: Int) {
        if operation != .percent{
            result()
        }
        isAnOperationSelecter = true
        operation = .percent
            result()
    }
    
    func handleEqualsButton(number: Int) {
        result()
    }
    
    func handleDivisionButton(number: Int) {
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .division
        
    }
    
    func handleMultiplicationButton(number: Int) {
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .multiplication
    }
    
    func handleSubtractionButton(number: Int) {
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .substraction
    }
    
    func handleSumatoryButton(number: Int) {
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .sumatory
    }
  
}

