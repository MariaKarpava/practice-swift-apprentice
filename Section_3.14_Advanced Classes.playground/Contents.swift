/*
Challenge 1: Initialization order
Create three simple classes called A, B, and C where C inherits from B and B inherits from A. In each class initializer, call print("I’m <X>!") both before and after super.init(). Create an instance of C called c. What order do you see each print() called in?
*/

//class A {
//
//    init() {
//        print("I’m A!")
//    }
//}
//
//class B: A {
//    override init() {
//        print("I'm B!(1)")
//        super.init()
//        print("I'm B!(2)")
//      }
//}
//
//class C: B {
//    override init() {
//        print("I'm C!(1)")
//        super.init()
//        print("I'm C!(2)")
//      }
//}
//
//var c = C()
//I'm C!(1)
//I'm B!(1)
//I’m A!
//I'm B!(2)
//I'm C!(2)



/*
 Challenge 2: Deinitialization order
 Implement deinit for each class. Create your instance c inside of a do { } scope, causing the reference count to go to zero when it exits the scope. Which order do the classes deinitialize?
 */

class A {
    
    init() {
        print("I’m A!")
    }
    
    deinit {
        print("Destroy A")
      }
}

class B: A {
    override init() {
        print("I'm B!(1)")
        super.init()
        print("I'm B!(2)")
      }
    
    deinit {
        print("Destroy B")
      }
}

class C: B {
    override init() {
        print("I'm C!(1)")
        super.init()
        print("I'm C!(2)")
      }
    
    deinit {
        print("Destroy C")
      }
}

//do {
//  let c = C()
//}

//I'm C!(1)
//I'm B!(1)
//I’m A!
//I'm B!(2)
//I'm C!(2)
//Destroy C
//Destroy B
//Destroy A


/*
 Challenge 3: Type casting
 Cast the instance of type C to an instance of type A. Which casting operation do you use and why?
 */

do {
  let c = C()
  c as A
  c as B
}



/*
 Challenge 4: To subclass or not
 Create a subclass of StudentAthlete called StudentBaseballPlayer and include properties for position, number, and battingAverage. What are the benefits and drawbacks of subclassing StudentAthlete in this scenario?
 */
class Person {
  var firstName: String
  var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Student: Person {
  var grades: [Grade] = []
}

class StudentAthlete: Student {
  var sports: [String] = []
}

class StudentBaseballPlayer: StudentAthlete {
    var battingAverage: Int
    var number: Int
    var position: String

      init(firstName: String, lastName: String, battingAverage: Int, number: Int, position: String) {
        self.battingAverage = battingAverage
        self.number = number
        self.position = position
        super.init(firstName: firstName, lastName: lastName)
      }
}







