//
//  CalculatorDisplay.swift
//  Calculator
//
//  Created by skynet on 21/12/21.
//

import Foundation
import SwiftUI
import MathKit
import XCTest

class CalculatorDisplay: ObservableObject {
    @Published var result = "0"

    func inputAction(calculatorButton: CaaaaaaaalculatorButton) {
        switch calculatorButton {
        case .AC:
            result = "0"

        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return
        case .equals:
            return
        case .plus:
            return
        case .minus:
            return
        case .multiply:
            return
        case .divide:
            return
        case .decimal:
            return
        case .plusminus:
            return
        case .percent:
            return
        }
    }

}
