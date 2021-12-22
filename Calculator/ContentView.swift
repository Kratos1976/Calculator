//
//  ContentView.swift
//  Calculator
//
//  Created by admin on 16/12/21.
//

import SwiftUI

// MARK: CalculatorButton
enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case decimal
    case AC, plusminus, percent

    var tittle: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        case .decimal: return "."
        case .plusminus: return "+/-"
        case .percent: return "%"
        default:
            return "AC"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .zero, .decimal, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            return Color(.gray)
        case .AC, .plusminus, .percent:
            return Color(.black)
        default:
            return .blue
        }
    }
}


// MARK: ContentView
struct ContentView: View {

    @EnvironmentObject var env: CalculatorDisplay

    let buttons: [String: [CalculatorButton]] = [
        "1": [.AC, .plusminus, .percent, .divide],
        "2": [.seven, .eight, .nine, .multiply],
        "3": [.four, .five, .six, .minus],
        "4": [.one, .two, .three, .plus],
        "5": [.zero, .decimal, .equals]
    ]

    var body: some View {
        ZStack(alignment: .bottom) {

            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                HStack {
                    Spacer()
                    Text(env.result)
                        .font(.system(size: 150))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(height: 250.0)
                }.padding()
                ForEach(buttons.keys.sorted(by: <), id: \.self) { key in

                    HStack(spacing: 15) {
                        ForEach(buttons[key]!, id: \.self) { button in

                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }
        }
    }
}

// MARK: ContentView_Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CalculatorDisplay())

    }
}

struct CalculatorButtonView: View {

    var button: CalculatorButton

    @EnvironmentObject var env: CalculatorDisplay

    var body: some View {
        Button(action: {
            self.env.inputAction(calculatorButton: self.button)
        }, label: {
                Text(button.tittle)
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .bold().padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: self.buttonWidth(button: button), height: /*@START_MENU_TOKEN@*/94.0/*@END_MENU_TOKEN@*/).background(button.backgroundColor).cornerRadius(/*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
        }) 
    }

    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }

        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}
