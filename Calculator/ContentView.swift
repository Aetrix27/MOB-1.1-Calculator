
import SwiftUI

struct CalculationState{
    var currentNumber: Double = 0
    var storedNumber: Double?
    var storedAction: CalculatorButton?
    
    mutating func appendNumber(_ number: Double){
        if number.truncatingRemainder(dividingBy: 1) == 0 && currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
            print("Current number: \(currentNumber)")
        }
        else {
            currentNumber = number
        }
    }
}

struct ContentView: View {
    
    @State var state = CalculationState()
    var displayText: String{
        return String(format: "%.2f", state.currentNumber)
    }

    let buttonOptions: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals]
    ]
    var body: some View {
        VStack(spacing:10){
            HStack{
                Spacer()
                Text(displayText)
                    .font(.largeTitle)
            }
            ForEach(buttonOptions, id: \.self){ row in
                HStack{
                    ForEach(row, id:\.self){ button in
                        ActionView(button: button, state: $state)
                    }
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom).padding(10)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
