import Foundation

class CalculatorModel: ObservableObject{
    
    //MARK: - Properties
    @Published var displayValue = "0" //Default value of the calculator
    var currentOp: Operator? //Storing the current operator
    var currentNumber: Double? = 0 //Current selected number - it have to be equal to displayValue
    var previousNumber: Double?
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
            operatorPressed(op: Operator(label))
        }
    }
    
    func setDisplayValue(number: Double){
        if number == floor(number){
            displayValue = "\(Int(number))"
        }else{
            let decimalPlaces = 10
            displayValue = "\(round(number * pow(10, decimalPlaces)) / pow(10, decimalPlaces))"
        }
    }
    
    //Resets the state of the calculator
    func reset(){
        currentOp = nil
        currentNumber = 0
        previousNumber = nil
        equaled = false
        decimalPlace = 0
    }
    
    func equalsClicked(){
        
    }
    
    func decimalClicked(){
        
    }
    
    func numberPressed(value: Double){
        
        //If equals was pressed, clear the current number
        if equaled{
            currentNumber = nil
            previousNumber = nil
            equaled = false
        }
       
        //If there is no current number, set it to the value
        if currentNumber == nil{
            currentNumber = value / pow(10, decimalPlace)
        }else{ //Otherwise, add the value to the current number
            if decimalPlace == 0{
                currentNumber = currentNumber! * 10 + value
            }else{
                currentNumber = currentNumber! + value / pow(10, decimalPlace)
                decimalPlace += 1
            }
        }
        
        //Updating the UI
        setDisplayValue(number: currentNumber!)
    }
    
    func operatorPressed(op: Operator){
        decimalPlace = 0
        
        if equaled {
            currentNumber = nil
            equaled = false
        }
        
        if currentNumber != nil && previousNumber != nil{
            let total = currentOp!.op(previousNumber!, currentNumber!)
            previousNumber = total
            currentNumber = nil
            
            //Update the UI
            setDisplayValue(number: total)
        }else if previousNumber == nil{
            previousNumber = currentNumber
            currentNumber = nil
        }
        
        currentOp = op
    }
}


func pow(_ base: Int, _ exp: Int) -> Double{
    pow(Double(base), Double(exp))
}
