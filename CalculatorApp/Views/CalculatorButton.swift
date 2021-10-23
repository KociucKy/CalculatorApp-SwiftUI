import SwiftUI

struct CalculatorButton: View {
    
    @EnvironmentObject var calculator: CalculatorModel
    var label: String
    var color: Color
    
    var body: some View {
        Button {
            calculator.buttonPressed(label: label) //Model will figure out what to do with this click
        } label: {
            ZStack{
                Circle()
                    .fill(color)
                Text(label)
                    .font(.title)
            }
            .accentColor(.white)
        }

    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(label: "1", color: .gray)
            .previewLayout(.fixed(width: 100, height: 100))
            .environmentObject(CalculatorModel())
    }
}
