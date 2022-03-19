//
//  CalculatorPresenterTests.swift
//  CalculatorPresenterTests
//
//  Created by juan harrington on 4/02/22.
//

import XCTest
@testable import IOSCalculator

class CalculatorPresenterTests: XCTestCase {

    var presenter: CalculatorPresenter!
    var mockView: MockView!
    
    override func setUpWithError() throws {
        presenter = CalculatorPresenter()
        mockView = MockView()
        presenter.view = mockView
    }

    func testsumatory() throws {
        presenter.handleNumberSelection(number: 1)
        presenter.handleSumatoryButton()
        presenter.handleNumberSelection(number: 1)
        presenter.handleEqualsButton()
        
        XCTAssertEqual(mockView.receivedResult, "2")
    }
    
    func testsubstraction() throws {
        presenter.handleNumberSelection(number: 3)
        presenter.handleSubtractionButton()
        presenter.handleNumberSelection(number: 1)
        presenter.handleEqualsButton()
        
        XCTAssertEqual(mockView.receivedResult, "2")
    }
    
    func testmultiplication() throws {
        presenter.handleNumberSelection(number: 2)
        presenter.handleMultiplicationButton()
        presenter.handleNumberSelection(number: 2)
        presenter.handleEqualsButton()
        
        XCTAssertEqual(mockView.receivedResult, "4")
    }
    
    func testDivision() throws {
        presenter.handleNumberSelection(number: 6)
        presenter.handleDivisionButton()
        presenter.handleNumberSelection(number: 3)
        presenter.handleEqualsButton()
        
        XCTAssertEqual(mockView.receivedResult, "2")
    }
    
    func testRepeatingSumatory() throws {
        presenter.handleNumberSelection(number: 2)
        presenter.handleSumatoryButton()
        presenter.handleNumberSelection(number: 1)
        presenter.handleEqualsButton()
        presenter.handleSumatoryButton()
        
        XCTAssertEqual(mockView.receivedResult, "3")
    }
    
    func testPercentage() throws {
        presenter.handleNumberSelection(number: 1)
        presenter.handleNumberSelection(number: 0)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handleMultiplicationButton()
        
        presenter.handleNumberSelection(number: 5)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handlePercentageButton()
        
        XCTAssertEqual(mockView.receivedResult, "0.5")
    }
    
    func testPercentageAndEquals() throws {
        presenter.handleNumberSelection(number: 1)
        presenter.handleNumberSelection(number: 0)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handleMultiplicationButton()
        
        presenter.handleNumberSelection(number: 5)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handlePercentageButton()
        presenter.handleEqualsButton()
        
        XCTAssertEqual(mockView.receivedResult, "50")
    }
    
    func testPercentageAndEqualsAndSumatory() throws {
        presenter.handleNumberSelection(number: 1)
        presenter.handleNumberSelection(number: 0)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handleMultiplicationButton()
        
        presenter.handleNumberSelection(number: 5)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handlePercentageButton()
        presenter.handleEqualsButton()
        
        presenter.handleSumatoryButton()
        presenter.handleNumberSelection(number: 5)
        presenter.handleEqualsButton()

        
        XCTAssertEqual(mockView.receivedResult, "55")
    }
    
    func testPercentageAndEqualsAndSumatoryAndPercentage() throws {
        presenter.handleNumberSelection(number: 1)
        presenter.handleNumberSelection(number: 0)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handleMultiplicationButton()
        
        presenter.handleNumberSelection(number: 5)
        presenter.handleNumberSelection(number: 0)
        
        presenter.handlePercentageButton()
        presenter.handleEqualsButton()
        
        presenter.handleSumatoryButton()
        presenter.handleNumberSelection(number: 5)
        presenter.handleEqualsButton()
        presenter.handlePercentageButton()
        
        XCTAssertEqual(mockView.receivedResult, "0.5")
    }
    
    
}
