//
//  CalculatorPresenterTests.swift
//  CalculatorPresenterTests
//
//  Created by juan harrington on 4/02/22.
//

import XCTest
@testable import IOSCalculator

class CalculatorPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let calculateResult = MockCalculateResult()
        let presenter =  CalculatorPresenter(calculateResult: calculateResult)
        let mockView = MockView()
        presenter.view =  mockView

        presenter.handleNumberSelection(number: 1)
        presenter.handleSumatoryButton()
        presenter.handleNumberSelection(number: 1)
        
        
        if mockView.receivedResult == "2"{
            print("si")
        }else{
            print("error")
        }
        
    }

}
