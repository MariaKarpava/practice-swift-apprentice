/*
Challenge 1: Make it compile
Modify the following subscript implementation so that it compiles in a playground:
*/


extension Array {
    subscript(index index: Int) -> (String, String)? {

        guard let value = self[index] as? Int else {return nil}
      
        switch (value >= 0, abs(value) % 2) {
            case (true, 0): return ("positive", "even")
            case (true, 1): return ("positive", "odd")
            case (false, 0): return ("negative", "even")
            case (false, 1): return ("negative", "odd")
            default: return nil
    }
  }
}

let numbers = [-2, -1, 0, 1, 2]
numbers[0]
numbers[index: 0]
//numbers[index: 1]
//numbers[index: 2]
//numbers[index: 3]
//numbers[index: 4]


/*
 Challenge 2: Random access string
 Write a subscript that computes the character at a specific index in a string. Why is this considered harmful?
 */

extension String {
  subscript(index: Int) -> Character? {
//    guard 0..<count ~= index else {return nil}
//    return self[self.index(startIndex, offsetBy: index)]
      
      let arr = Array(self)
      
      guard index < arr.count && index >= 0 else {
          return nil
      }
      return arr[index]
      
      
  }
}

let me = "Cosmin"
me[2]
me[-6]



/*
 Challenge 3: Generic exponentiation
 Implement the exponentiation generic operator for float types so that the following code works:

 let exponent = 2
 let baseDouble = 2.0
 var resultDouble = baseDouble ** exponent
 let baseFloat: Float = 2.0
 var resultFloat = baseFloat ** exponent
 let baseCG: CGFloat = 2.0
 var resultCG = baseCG ** exponent

 Hint: Import the CoreGraphics framework to work with CGFloat.
 */
import CoreGraphics

infix operator **


func **<T: FloatingPoint>(base: T, power: Int) -> T {
  precondition(power >= 2)
  var result = base
  for _ in 2...power {
    result *= base
  }
  return result
}

let exponent = 2
let baseDouble = 2.0
var resultDouble = baseDouble ** exponent
let baseFloat: Float = 2.0
var resultFloat = baseFloat ** exponent
let baseCG: CGFloat = 2.0
var resultCG = baseCG ** exponent


/*
 Challenge 4: Generic exponentiation assignment
 Implement the exponentiation assignment generic operator for float types so that the following code works:
 resultDouble **= exponent
 resultFloat **= exponent
 resultCG **= exponent
 */


 // lhs = left hand side parameter
// rhs = right hand side parameter


infix operator **=
func **=<T: FloatingPoint>(lhs: inout T, rhs: Int) {
  lhs = lhs ** rhs
}

resultDouble **= exponent
resultFloat **= exponent
resultCG **= exponent
