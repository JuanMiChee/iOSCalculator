//
//  PresenterProtocol.swift
//  IOSCalculator
//
//  Created by juan harrington on 17/03/22.
//

import Foundation

protocol Presenter {
    var view: View? { get set }
    
    func handleNumberSelection(number: Int)
    func handleDecimalSelection(mainLabelText: String?)
    func handleACButton()
    func handleMoreOrLessButton()
    func handlePercentageButton()
    func handleEqualsButton()
    func handleDivisionButton()
    func handleMultiplicationButton()
    func handleSubtractionButton()
    func handleSumatoryButton()
}
