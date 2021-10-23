import Foundation

class CalculatorModel: ObservableObject{
    
    //MARK: - Properties
    @Published var displayValue = "9" //Default value of the calculator
    var currentOp: Operator? //Storing the current operator
    var currentNumber: Double? = 0 //Current selected number - it have to be equal to displayValue
    var previusNumber: Double?
    var equaled = false //Flag for equal press
    var decimalPlace = 0 //How many decimal places have been tapped
    
    
    //MARK: - Methods
    
    //Selects appropiate function based on the label of the button pressed
    func buttonPressed(label: String){
        if label == "CE"{
            displayValue = "0"
            reset()
        }else if label == "="{
            equalsClicked()
        }else if label == "."{
            decimalClicked()
        }else if let value = Double(label){
            numberPressed(value: value)
        }else{
            operatorPressed(op: Operator())
        }
    }
    
    //Resets the state of the calculator
    func reset(){
        currentOp = nil
        currentNumber = 0
        previusNumber = nil
        equaled = false
        decimalPlace = 0
    }
    
    func equalsClicked(){
        
    }
    
    func decimalClicked(){
        
    }
    
    func numberPressed(value: Double){
        
    }
    
    func operatorPressed(op: Operator){
        
    }
}
