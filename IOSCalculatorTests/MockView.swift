//
//  MockView.swift
//  IOSCalculatorTests
//
//  Created by juan harrington on 17/03/22.
//

import Foundation
@testable import IOSCalculator

class MockView: View {
    
    var receivedResult: String?
    
    func display(result: String) {
        receivedResult = result
    }
    
    func selectVisualOperator() {
        
    }
    
    func displayACTittle(title: String) {
        
    }
}
