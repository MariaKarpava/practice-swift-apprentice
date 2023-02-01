/*
Challenge 1: Singleton pattern
A singleton is a design pattern that restricts the instantiation of a class to one object.

Use access modifiers to create a singleton class Logger. This Logger should:

Provide shared, public, global access to the single Logger object.
Not be able to be instantiated by consuming code.
Have a method log() that will print a string to the console.
*/

public class Logger {
    
    // private init is required so that only class Logger can instantiate new objects
    private init() {}
    
    // the single, shared instance
    // Both the static and class keywords allow us to attach variables to a class rather than to instances of a class.
    static let sharedInstance = Logger()
    
    func log(string: String) {
        print(string)
    }
}

//Logger.sharedInstance.log(string: "Hi!")
// Logger.log("Hello") // Cannot convert value of type 'String' to expected argument type 'Logger'



/*
 Challenge 2: Stack
 Declare a generic type Stack. A stack is a LIFO (last-in-first-out) data structure that supports the following operations:

 peek: returns the top element on the stack without removing it. Returns nil if the stack is empty.
 push: adds an element on top of the stack.
 pop: returns and removes the top element on the stack. Returns nil if the stack is empty.
 count: returns the size of the stack.
 Ensure that these operations are the only exposed interface. In other words, additional properties or methods needed to implement the type should not be visible.
 */

 struct Stack<Element> {
    
    private var elements: [Element] = []
    
    func peek() -> Element? {
        guard let element = elements.last else {
            return nil
        }
        return element
    }
    
    mutating func push(element: Element) {
        elements.append(element)
    }

    mutating func pop() -> Element? {
        guard let element = elements.last else {
            return nil
        }
        var last = element
        
        elements.removeLast()
        return last
    }

    func count() -> Int {
        return elements.count
    }
    
}

var stack1 = Stack<Int>()
//print(stack1.push(element: 1))
//print(stack1.count())
//print(stack1.peek() ?? "no elements")
//print(stack1.pop() ?? "no elements")


/*
 Challenge 3: Character battle
 Utilize something called a static factory method to create a game of Wizards vs. Elves vs. Giants.

 Add a file Characters.swift in the Sources folder of your playground.

 To begin:

 Create an enum GameCharacterType that defines values for elf, giant and wizard.
 Create a protocol GameCharacter that inherits from AnyObject and has properties name, hitPoints and attackPoints. Implement this protocol for every character type.
 Create a struct GameCharacterFactory with a single static method make(ofType: GameCharacterType) -> GameCharacter.
 Create a global function battle that pits two characters against each other — with the first character striking first! If a character reaches 0 hit points, they have lost.
 Hints:

 The playground should not be able to see the concrete types that implement GameCharacter.
 Elves have 3 hit points and 10 attack points. Wizards have 5 hit points and 5 attack points. Giants have 10 hit points and 3 attack points.
 The playground should know none of the above!
 In your playground, you should use the following scenario as a test case:
 */



let elf = GameCharacterFactory.make(ofType: .elf)
let giant = GameCharacterFactory.make(ofType: .giant)
let wizard = GameCharacterFactory.make(ofType: .wizard)

battle(elf, vs: giant) // Giant defeated!
battle(wizard, vs: giant) // Giant defeated!
battle(wizard, vs: elf) // Elf defeated!




struct XXX {
    var p1: String?
}


struct User {
    var firstName: String?
    var lastName: String?
    var country: String?
}

let u = User(firstName: "Igor", lastName: nil, country: "UK")

let properties = [
    \User.firstName,
    \User.lastName,
    \User.country,
    \XXX.p1,
]

properties.forEach {
    if let propertyValue = u[keyPath: $0] {
        print("Value is: \(propertyValue)")
    } else {
        print("Property is not present")
    }
}

//
//if let value = u.firstName {
//    print("Value is: \(value)")
//} else {
//    print("Value is missing")
//}
//
//if let value = u.lastName {
//    print("Value is: \(value)")
//} else {
//    print("Value is missing")
//}
//
//if let value = u.country {
//    print("Value is: \(value)")
//} else {
//    print("Value is missing")
//}

