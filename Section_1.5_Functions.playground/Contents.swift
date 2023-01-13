// highlight the function and press “Option-Command-/” in Xcode.

/// My description
/// - Parameter value: my value
func incrementAndPrint(_ value: inout Int) {
  value += 1
  print(value)
}



var value = 5
incrementAndPrint(&value)
print(value)


/*
Challenge 1: Looping with stride functions
Write a loop that goes from 10.0 to (and including) 9.0, decrementing by 0.1.
*/

print()

for index in stride(from: 10.0, through: 9.0, by: -0.1) {
  print("index = \(index)")
}




/*
 Challenge 2: It’s prime time
 Determine whether or not a number is prime.
 */

print()

func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool {
    if number % divisor == 0 {
        return true
    } else {
        return false
    }
}





func isPrime(_ number: Int) -> Bool {
    if number < 0 {
        return false
    }
    
    for i in 2...number-1 {
        if isNumberDivisible(number, by: i) == true {
            print("false")
            return false
        }
    }
    print("true")
    return true
   
}

isPrime(6) // false
isPrime(13) // true
isPrime(8893) // true



/*
 Challenge 3: Recursive functions
 You’re going to write a function that computes a value from the Fibonacci sequence.
 */

print()

func fibonacci(_ number: Int) -> Int {
    if number <= 0 {
        return 0
    } else if number == 1 || number == 2 {
        return 1
    } else {
        return fibonacci(number-1) + fibonacci(number-2)
    }
}


fibonacci(1)  // = 1
fibonacci(2)  // = 1
fibonacci(3)  // = 2
fibonacci(4)  // = 3
fibonacci(5)  // = 5
fibonacci(10) // = 55


var answer: [String] = []


