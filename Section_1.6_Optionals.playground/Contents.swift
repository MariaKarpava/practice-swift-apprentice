/*
Challenge 2: Divide and conquer
 
First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function divideIfWhole.
 
 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".

 Finally, test your function:

 Divide 10 by 2. This should print "Yep, it divides 5 times."
 Divide 10 by 3. This should print "Not divisible :[."
*/

func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
    if value % divisor == 0 {
        return value / divisor
    } else {
        return nil
    }
}


func printResult() {
    
    guard let result = divideIfWhole(10, by: 3) else {
        print("Not divisible :[.")
        return
    }
    
    print("Yep, it divides \(result) times.")
}

printResult()



if let result = divideIfWhole(10, by: 2) {
    print("Yep, it divides \(result) times.")
} else {
    print("Not divisible :[.")
}

if let result = divideIfWhole(10, by: 3) {
    print("Yep, it divides \(result) times.")
} else {
    print("Not divisible :[.")
}




/*
 Challenge 3: Refactor and reduce
 The code you wrote in the last challenge used if statements. In this challenge, refactor that code to use nil coalescing instead. This time, make it print "It divides X times" in all cases, but if the division doesn’t result in a whole number, then X should be 0.
 */


let result1 = divideIfWhole(10, by: 2) ?? 0
print("It divides \(result1) times.")


let result2 = divideIfWhole(10, by: 3) ?? 0
print("It divides \(result2) times.")



/*
 Challenge 4: Nested optionals
 Consider the following nested optional — it corresponds to a number inside a box inside a box inside a box.

 let number: Int??? = 10

 If you print number you get the following:

 print(number)
 // Optional(Optional(Optional(10)))

 print(number!)
 // Optional(Optional(10))

 Do the following:

 1. Fully force unwrap and print number.
 2. Optionally bind and print number with if let.
 3. Write a function printNumber(_ number: Int???) that uses guard to print the number only if it is bound.

 */

let number: Int??? = 11

// 1
print(number!!!)

// 2
if let number = number {
    if let number = number {
        if let number = number {
            print(number)
        }
    }
}

// 3 Doesn work!!!(((

func printNumber(_ number: Int???) {
    guard let number = number else {
        return
    }
    guard let number = number else {
        return
    }
    guard let number = number else {
        return
    }
    print("number:", number)
}
    

printNumber(8)


//let anotherNumber: Int???????????? = 111111
//let unwrappedNumber: Int? = number as? Int
//print(anotherNumber)

let a: Int???????????? = 9
let b: Int? = a as? Int

if let b {
    print(b)
}
 



