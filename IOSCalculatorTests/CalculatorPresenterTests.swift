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
    
    func testRepeatingSumatory() throws {
        presenter.handleNumberSelection(number: 2)
        presenter.handleSumatoryButton()
        presenter.handleNumberSelection(number: 1)
        presenter.handleEqualsButton()
        presenter.handleSumatoryButton()
        
        XCTAssertEqual(mockView.receivedResult, "3")
    }
}
