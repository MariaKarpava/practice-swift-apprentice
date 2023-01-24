/*
 Challenge 1: Grow a Circle
 Given the Circle structure below:

 struct Circle {
   
   var radius = 0.0

   var area: Double {
     .pi * radius * radius
   }

 }

 Write a method that can change an instance’s area by a growth factor. For example, if you call circle.grow(byFactor: 3), the area of the instance will triple.

 Hint: Add a setter to area.
 */

struct Circle {
    var radius = 0.0

    var area: Double {
        get {
            return .pi * radius * radius
        }
        set(newArea) {
            radius = (newArea / .pi).squareRoot()
        }
    }

    mutating func grow(byFactor: Double) {
        area = area * byFactor
    }

}

var circle1 = Circle(radius: 1)
print(circle1.area)

circle1.grow(byFactor: 3)
print(circle1.area)




/*
 Challenge 2: A more advanced advance()
 Here is a naïve way of writing advance() for the SimpleDate structure you saw earlier in the chapter:

 let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

 struct SimpleDate {
  var month: String
  var day: Int

  mutating func advance() {
    day += 1
  }
 }

 var date = SimpleDate(month: "December", day: 31)
 date.advance()
 date.month // December; should be January!
 date.day // 32; should be 1!

 What happens when the function should go from the end of one month to the start of the next? Rewrite advance() to account for advancing from December 31st to January 1st.
 */

let months = ["January", "February", "March",
             "April", "May", "June",
             "July", "August", "September",
             "October", "November", "December"]

let daysInMonth = ["January": 31, "February": 28, "March": 31,
                                           "April": 30, "May": 31, "June": 30,
                                           "July": 31, "August": 31, "September": 30,
                                           "October": 31, "November": 30, "December": 31]

struct SimpleDate {
    var month: String
    var day: Int
    lazy var numberOfDaysInMonth = { daysInMonth[month] } ()

    mutating func advance() {
        if day == numberOfDaysInMonth && month == "December" {
            day = 1
            month = "January"
        } else if day == numberOfDaysInMonth && month != "December" {
            day = 1
        
            for i in 0..<months.count {
                if month == months[i] {
                    month = months[i+1]
                    break
                }
            }
        
        } else {
            day += 1
        }
    }
    
 
}
/*
 Check the total number of days in a month.
 
 - if it is the last day of the month and not Dec 31:
 -- increment month and set day to 1
 
 - if it is NOT the last day of the month:
 -- just increment the day
 
 - if it is Dec 31:
 -- set month to January and Day to 1
 */


var date = SimpleDate(month: "December", day: 31)
date.advance()
date.month // December; should be January!
date.day // 32; should be 1!

var date1 = SimpleDate(month: "March", day: 31)
date1.advance()
date1.month
date1.day

var date2 = SimpleDate(month: "March", day: 13)
date2.advance()
date2.month
date2.day



/*
 Challenge 3: Odd and Even Math
 Add type methods named isEven and isOdd to your Math namespace that return true if a number is even or odd, respectively.
 */

struct Math {
    static func isEven(_ value: Int) -> Bool {
        value % 2 == 0
      }
    static func isOdd(_ value: Int) -> Bool {
        value % 2 != 0
    }
}

Math.isEven(4)
Math.isEven(7)
Math.isOdd(6)
Math.isOdd(7)



/*
 Challenge 4: Odd and Even Int
 It turns out that Int is simply a struct. Add the computed properties isEven and isOdd to Int using an extension.

 Note: Generally, you want to be careful about what functionality you add to standard library types as it can confuse readers.
 */

extension Int {
    var isEven: Bool {
        self % 2 == 0
      }
    var isOdd: Bool {
        self % 2 != 0
    }
}

22.isEven
23.isOdd


/*
 Challenge 5: Prime Factors
 Add the method primeFactors() to Int. Since this is an expensive operation, this is best left as an actual method and not a computed property.
 */

extension Int {
    func primeFactors() -> [Int] {
        // 1
        var remainingValue = self
        // 2
        var testFactor = 2
        var primes: [Int] = []
        // 3
        while testFactor * testFactor <= remainingValue {
          if remainingValue % testFactor == 0 {
            primes.append(testFactor)
            remainingValue /= testFactor
          }
          else {
            testFactor += 1
          }
        }
        if remainingValue > 1 {
          primes.append(remainingValue)
        }
        return primes
      }
}

81.primeFactors()
