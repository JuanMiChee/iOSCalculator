//
//  HomeViewController.swift
//  IOSCalculator
//
//  Created by juan harrington on 4/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Number Button Declaration
    
    
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    //MARK: OperatorButtonDeclaration
    @IBOutlet weak var sumatoryButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    @IBOutlet weak var moreOrLessButton: UIButton!
    @IBOutlet weak var ACButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    
    
    private var total: Double = 0
    private var temp: Double = 0
    private var isAnOperationSelecter: Bool = false
    private var thereAreSelectedDecimals: Bool = false
    private var operation: operationType = .none
    
    private let whatsYourDecimalSeparator = Locale.current.decimalSeparator!
    private let maxLabelLenght = 9
    private let kTotal = "total"
    //private let maxNumberOfDecimalAllowed : Double = 999999999
    //private let minNumberOFDecimalAllowed : Double = 0.00000001
    
    private enum operationType{
        case none, sumatory, substraction, multiplication, division, percent
    }

    // Formateo de valores auxiliares
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
    
    
    //MARK: inicialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("didLayoutSubView\(number0.bounds.height)")
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        number0.round()
        
        sumatoryButton.round()
        equalsButton.round()
        multiplicationButton.round()
        divisionButton.round()
        subtractionButton.round()
        percentageButton.round()
        moreOrLessButton.round()
        ACButton.round()
        decimalButton.round()
    }
    
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad\(number0.bounds.height)")
        
        

        decimalButton.setTitle(whatsYourDecimalSeparator, for: .normal)
        total = UserDefaults.standard.double(forKey: kTotal)
        
        result()
    }
    
    
        //MARK: buttonActions
    @IBAction func sumatoryButtonAction(_ sender: UIButton) {
        
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .sumatory
        sender.selectOperation(_selected: true)
        
        sender.shine()
    }
    
    @IBAction func subtractionButtonAction(_ sender: UIButton) {
        
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .substraction
        sender.selectOperation(_selected: true)
        
        sender.shine()
    }
    
    @IBAction func multiplicationButtonAction(_ sender: UIButton) {
        
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .multiplication
        sender.selectOperation(_selected: true)
        
        sender.shine()
    }
    
    @IBAction func divisionButtonAction(_ sender: UIButton) {
        
        if operation != .none{
            result()
        }
        
        isAnOperationSelecter = true
        operation = .division
        sender.selectOperation(_selected: true)
        
        sender.shine()
    }
    
    @IBAction func equalsButtonAction(_ sender: UIButton) {
       // if operation != .none{
            result()
        //}
        
        sender.shine()
    }
    
    @IBAction func perecentageButtonAction(_ sender: UIButton) {
        
        if operation != .percent{
            result()
        }
        isAnOperationSelecter = true
        operation = .percent
            result()
        
        sender.shine()
    }
    @IBAction func moreOrLessButtonAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    @IBAction func ACButtonAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func decimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !isAnOperationSelecter && currentTemp.count >= maxLabelLenght{
            return
        }
        
        let lastLabelCaracter = resultLabel.text?.last
        let lastLabelCaracterAsString = String(lastLabelCaracter!)
        
        if lastLabelCaracterAsString == whatsYourDecimalSeparator{
            
        }else{
            resultLabel.text = resultLabel.text! + whatsYourDecimalSeparator
        }
        thereAreSelectedDecimals = true
        
        selectVisualOperator()
        
        sender.shine()
    }
    
    @IBAction func numbreAction(_ sender: UIButton) {
        
        ACButton.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !isAnOperationSelecter && currentTemp.count >= maxLabelLenght{
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // ya se selecciono una operacion
        if isAnOperationSelecter{
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            isAnOperationSelecter = false
        }
        
        if thereAreSelectedDecimals {
            currentTemp = "\(currentTemp)\(whatsYourDecimalSeparator)"
            thereAreSelectedDecimals = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text =  printFormatter.string(for: NSNumber(value: temp))
        
        selectVisualOperator()
        
        sender.shine()
        print(sender.tag)
    }
    
    
    
    
    private func clear(){
        operation = .none
        //ACButton.setTitle("AC", for: .normal)
        //if temp != 0{
            temp = 0
            resultLabel.text = "0"
       // }else{
            total = 0
            result()
        //}
    }
    
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
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        }else{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))

        }
        
        operation = .none
        
        selectVisualOperator()
        
        print("TOTAL:\(total)")
    }
    
    private func selectVisualOperator(){
        if !isAnOperationSelecter{
            //no estamos operando
            sumatoryButton.selectOperation(_selected: false)
            subtractionButton.selectOperation(_selected: false)
            multiplicationButton.selectOperation(_selected: false)
            divisionButton.selectOperation(_selected: false)
            
        }else{
            switch operation {
            
            case .none, .percent:
                sumatoryButton.selectOperation(_selected: false)
                subtractionButton.selectOperation(_selected: false)
                multiplicationButton.selectOperation(_selected: false)
                divisionButton.selectOperation(_selected: false)
                break
            case .sumatory:
                sumatoryButton.selectOperation(_selected: true)
                subtractionButton.selectOperation(_selected: false)
                multiplicationButton.selectOperation(_selected: false)
                divisionButton.selectOperation(_selected: false)
                break
            case .substraction:
                sumatoryButton.selectOperation(_selected: false)
                subtractionButton.selectOperation(_selected: true)
                multiplicationButton.selectOperation(_selected: false)
                divisionButton.selectOperation(_selected: false)
                break
            case .multiplication:
                sumatoryButton.selectOperation(_selected: false)
                subtractionButton.selectOperation(_selected: false)
                multiplicationButton.selectOperation(_selected: true)
                divisionButton.selectOperation(_selected: false)
                break
            case .division:
                sumatoryButton.selectOperation(_selected: false)
                subtractionButton.selectOperation(_selected: false)
                multiplicationButton.selectOperation(_selected: false)
                divisionButton.selectOperation(_selected: true)
                break
            }
        }
    }
}
