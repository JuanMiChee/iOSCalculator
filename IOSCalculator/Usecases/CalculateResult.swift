//
//  CalculateResult.swift
//  IOSCalculator
//
//  Created by Angel Betancourt on 14/03/22.
//

import Foundation

protocol CalculateResultProtocol {
    func execute(operationType: OperationType, temp: Double) -> Double
}

struct CalculateResult: CalculateResultProtocol {
    
    func execute(operationType: OperationType, temp: Double) -> Double {

        var total: Double = 0

        switch operationType {

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
            total = temp / 100
            break
        }

        return total
    }
}
