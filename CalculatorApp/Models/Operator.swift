import Foundation

class Operator{
    
    //MARK: - Properties
    var op: (Double, Double) -> Double
    var isDivision = false
    
    
    //MARK: - Initializers
    init(_ string: String){
        if string == "+"{
            self.op = (+)
        }else if string == "-"{
            self.op = (-)
        }else if string == String("\u{00d7}"){
            self.op = (*)
        }else{
            self.op = (/)
            self.isDivision = true
        }
    }
}
