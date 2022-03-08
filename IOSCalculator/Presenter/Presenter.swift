



import Foundation
protocol View: AnyObject {
    func display(result: String)
}

protocol Presenter {
    var view: View? { get set }
    
    func handleNumberSelection(number: Int)
}

class CalculatorPresenter: Presenter {
    func handleNumberSelection(number: Int) {
        view?.display(result: String(number))
    }
    
    var view: View?
}

class NicerCalculatorPresenter: Presenter {
    func handleNumberSelection(number: Int) {
        
    }
    
    weak var view: View?
}
