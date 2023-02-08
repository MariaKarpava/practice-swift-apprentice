import UIKit

/*
Challenge 1: Break the cycle
Break the strong reference cycle in the following code:
*/


class Person {
  let name: String
  let email: String
    /*
     Weak references are references that don’t play any role in the ownership of an object. The great thing about using them is that they automatically detect when the underlying object has gone away. This automatic detection is why you always declare them with an optional type. They become nil once the reference count reaches zero.
     */
  weak var car: Car?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
  var owner: Person?

 init(id: Int, type: String) {
   self.id = id
   self.type = type
 }

 deinit {
   print("Goodbye \(type)!")
 }
}


var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil


/*
 Challenge 2: Break another cycle
 Break the strong reference cycle in the following code:
 */

class Customer {
  let name: String
  let email: String
  var account: Account?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Account {
  let number: Int
  let type: String
    /*
     Unowned references behave much like weak ones in that they don’t change the object’s reference count.

    However, unlike weak references, they always expect to have a value — you can’t declare them as optionals. Think of it this way: A tutorial cannot exist without an author. Somebody has to write words for the editor to redline. :] At the same time, a tutorial does not “own” the author, so the reference should be unowned.
     */
  unowned let customer: Customer

  init(number: Int, type: String, customer: Customer) {
    self.number = number
    self.type = type
    self.customer = customer
  }

  deinit {
    print("Goodbye \(type) account number \(number)!")
  }
}

var customer: Customer? = Customer(name: "George",
                                   email: "george@whatever.com")
var account: Account? = Account(number: 10, type: "PayPal",
                                customer: customer!)

customer?.account = account

account = nil
customer = nil


