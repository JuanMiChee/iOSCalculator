//
//  View.swift
//  IOSCalculator
//
//  Created by Angel Betancourt on 14/03/22.
//

import Foundation

protocol View: AnyObject {
    func display(result: String)
    func selectVisualOperator()
    func displayACTittle(title: String)
}
