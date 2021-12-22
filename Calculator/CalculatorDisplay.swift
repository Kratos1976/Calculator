//
//  CalculatorDisplay.swift
//  Calculator
//
//  Created by skynet on 21/12/21.
//

import Foundation
import SwiftUI
import MathKit

class CalculatorDisplay: ObservableObject {
    @Published var result = "0"

    let system = System()

    func inputAction(calculatorButton: CalculatorButton) {
        switch calculatorButton {
        case .AC:
            result = "0"
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .minus, .plus, .multiply, .divide:
            if  result != "0" {
                self.result += calculatorButton.tittle
            } else {
                self.result = calculatorButton.tittle
            }
        case .decimal:
            self.result += calculatorButton.tittle
        case .plusminus:
            let plusMinus = "-(\(self.result))"
            let resultMathkit = try! Expression(string: plusMinus, system: system).evaluate()
            self.result = String(describing: resultMathkit)
        case .percent:
            let percent = "(\(self.result))/100"
            let percentMathkit = try! Expression(string: percent, system: system).evaluate()
            self.result = String(describing: percentMathkit)
        case .equals:
            let equals = try! Expression(string: result, system: system).evaluate()
            self.result = String(describing: equals)
        }
    }

}
