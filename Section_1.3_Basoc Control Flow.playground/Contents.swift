import UIKit

var greeting = "Hello, playground"


let a = 5
let b = 10

let min = a < b ? a : b
let max = a > b ? a : b




/*
1. Create a constant named myAge and initialize it with your age. Write an if statement to print out Teenager if your age is between 13 and 19 and Not a teenager if your age is not between 13 and 19.
 
2. Create a constant named answer and use a ternary condition to set it equal to the result you print out for the same cases in the above exercise. Then print out answer.
*/

let myAge = 29

if myAge > 13 && myAge < 19 {
    print("teenager")
} else {
    print("not a teenager")
}

let teenagerOrNot = myAge > 13 && myAge < 19 ? "teenager" : "not a teenager"
print(teenagerOrNot)



/*
 Create a variable named counter and set it equal to 0. Create another variable named roll and set it equal to 0. Create a repeat-while loop. Inside the loop, set roll equal to Int.random(in: 0...5) which means to pick a random number between 0 and 5. Then increment counter by 1. Finally, print After X rolls, roll is Y where X is the value of counter and Y is the value of roll. Set the loop condition such that the loop finishes when the first 0 is rolled.
 */


var counter = 0
var roll = 0

repeat {
    roll = Int.random(in: 0...5)
    counter += 1
    print("\(counter) is the value of counter and \(roll) is the value of roll.")
} while roll != 0


/*
Challenge 4: Number of days in a month
Given a month (represented with a String in all lowercase) and the current year (represented with an Int), calculate the number of days in the month. Remember that because of leap years, “february” has 29 days when the year is a multiple of 4 but not a multiple of 100. February also has 29 days when the year is a multiple of 400.
*/

var month = "february"
var currentYear = 2001
var numberOfDays: Int

if (month == "february") && ((currentYear % 4 == 0) && (currentYear % 100 != 0)) {
    numberOfDays = 29
} else if (month == "february") && (currentYear % 400 == 0) {
    numberOfDays = 29
} else if month == "february"{
    numberOfDays = 28
} else if ["april", "june", "september", "novermber"].contains(month) {
    numberOfDays = 30
} else {
    numberOfDays = 31
}



print("number of days = \(numberOfDays).")


/*
 Challenge 5: Next power of two
 Given a number, determine the next power of two above or equal to that number.
 */


func challenge5 (n: Int) {
    var powerOf2 = 1
    var power = 0

    while powerOf2 < n {
        powerOf2 = 2 * powerOf2
        power += 1
    }
    print(power)
}

/*
challenge5(n: 1)
challenge5(n: 9)
challenge5(n: 7)
*/




/*
Challenge 6: Triangular number
Given a number, print the triangular number of that depth. You can get a refresher of triangular numbers here: https://en.wikipedia.org/wiki/Triangular_number
*/

func triangularNumber(of n: Int) {
    var counter = 0
    var result = 0
    
    while counter <= n {
        if n == 0 {
            result = 0
        } else if n > 0 {
            result = result + counter
            counter += 1
        }
    }
    
    print("triangularNumber of \(n): \(result).")
}

/*
triangularNumber(of: 3)
triangularNumber(of: 4)
triangularNumber(of: 5)
triangularNumber(of: 6)
*/

 

/*
 Challenge 7: Fibonacci
 Calculate the nth Fibonacci number. Remember that Fibonacci numbers start their sequence with 1 and 1, and then subsequent numbers in the sequence are equal to the previous two values added together. You can get a refresher here:
 https://en.wikipedia.org/wiki/Fibonacci_number
 */


func findFibonacci (n: Int) {
    var fibonacci = 0

    if n == 0 {
        fibonacci = 0
    } else if n == 1 {
        fibonacci = 1
    } else if n == 2 {
        fibonacci = 1
        
    } else if n > 2 {
        
        var twicePreviousFibonacciNumber = 1
        var previousFibonacciNumber = 1
        
        var counter = 2
        
        while counter < n {
            print()
            
            fibonacci = (twicePreviousFibonacciNumber + previousFibonacciNumber)
            print("fibonacci", fibonacci)
            
            twicePreviousFibonacciNumber = previousFibonacciNumber
            print("twicePreviousFibonacciNumber", twicePreviousFibonacciNumber)
            
            previousFibonacciNumber = fibonacci
            print("previousFibonacciNumber", previousFibonacciNumber)
            
            counter += 1
            print()
        }
    }
    print("fibonacci \(n)th = \(fibonacci)")
}

/*
findFibonacci(n: 0) // 0
findFibonacci(n: 4) // 3
findFibonacci(n: 5) // 5
findFibonacci(n: 6) // 8
findFibonacci(n: 7) // 13
*/



/*
Challenge 8: Make a loop
Use a loop to print out the times table up to 12 of a given factor.
*/


func timeTable(of n: Int) {
    var counter = 0
    var result = 0
    
    while counter <= 12 {
        
        result = n * counter
        print("\(n) * \(counter) = \(result).")
        
        counter += 1
    }
}

//timeTable(of: 3)
//timeTable(of: 5)




/*
Challenge 9: Dice roll table
Print a table showing the number of combinations to create each number from 2 to 12, given two six-sided dice rolls. You should not use a formula but rather compute the number of combinations exhaustively by considering each possible dice roll.
*/



func diceRollCombinations() {
    
    var numberToCreate = 2
    
    while numberToCreate <= 12 {
        var numberOfCombinations = 0
        
        // traverse all combinations
        for numberOnFirstDice in 1...6 {
            for numberOnSecondDice in 1...6 {
                
                // check
                if numberOnFirstDice + numberOnSecondDice == numberToCreate {
                    numberOfCombinations += 1
                }
                
            }
        }
        
        print("Number of combinations for \(numberToCreate) = \(numberOfCombinations)")
        numberToCreate += 1
    }
    
}

diceRollCombinations()



print()
print()


func diceRollCombinationsWithWhile() {
    
    var numberToCreate = 2
    while numberToCreate <= 12 {
        
        var numberOfCombinations = 0
        
        var numberOnFirstDice = 1
        while numberOnFirstDice <= 6 {
            
            var numberOnSecondDice = 1
            while numberOnSecondDice <= 6 {
              
                if numberOnFirstDice + numberOnSecondDice == numberToCreate {
                    numberOfCombinations += 1
                }
                
                numberOnSecondDice += 1
            }
            
            numberOnFirstDice += 1
        }
        
        print("Number of combinations for \(numberToCreate) = \(numberOfCombinations)")
        numberToCreate += 1
    }
    
}

diceRollCombinationsWithWhile()
