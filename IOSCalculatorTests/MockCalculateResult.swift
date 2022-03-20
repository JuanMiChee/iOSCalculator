//
//  MockCalculateResult.swift
//  IOSCalculatorTests
//
//  Created by juan harrington on 17/03/22.
//

import Foundation
@testable import IOSCalculator

class MockCalculateResult: CalculateResultProtocol {
    func execute(operationType: OperationType, temp: Double) -> Double {
        0
    }
}
