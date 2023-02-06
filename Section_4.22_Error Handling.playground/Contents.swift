/*
 Challenge 1: Even strings
 Write a throwing function that converts a String to an even number, rounding down if necessary.
 */

enum evenStringsError: Error {
    case notANumber
}



func stringToNumberOld(_ str: String) throws -> Int {
    guard let number = Int(str) else {
        throw evenStringsError.notANumber
    }
    return number
}


do {
    let number = try stringToNumberOld("hello")
    print(number)
    let number2 = try stringToNumberOld("123")
    print(number2)
} catch {
    print("ERROR WAS THROWN")
}

do {
    let number = try stringToNumberOld("hello")
    print(number)
} catch {
    print("ERROR WAS THROWN")
}

do {
    let number = try stringToNumberOld("123")
    print(number)
} catch {
    print("ERROR WAS THROWN")
}

print()
print()
print()
print()
print()


func stringToNumber(_ str: String) throws -> Int {
    guard let number = Int(str) else {
        throw evenStringsError.notANumber
    }
    return number - number % 2
}

do {
    try stringToNumber("bh")
} catch evenStringsError.notANumber {
    print("not a number")
}


do {
    try stringToNumber("21")
} catch evenStringsError.notANumber {
    print("not a number")
}



/*
 Challenge 2: Safe division
 Write a throwing function that divides type Int types.
 */

enum divisionError: Error {
    case divideByNull
}

func safeDivision(divident: Int, divisor: Int) throws -> Int {
    guard divisor != 0 else {
        throw divisionError.divideByNull
    }
    return divident / divisor
}

do {
    try safeDivision(divident: 10, divisor: 2)
} catch divisionError.divideByNull {
    print("cant divide by 0")
}

do {
    try safeDivision(divident: 10, divisor: 0)
} catch divisionError.divideByNull {
    print("cant divide by 0")
}












// Example 1 from the book
class Pastry {
  let flavor: String
  var numberOnHand: Int

  init(flavor: String, numberOnHand: Int) {
    self.flavor = flavor
    self.numberOnHand = numberOnHand
  }
}

enum BakeryError: Error {
  case tooFew(numberOnHand: Int), doNotSell, wrongFlavor
  case inventory, noPower
}


class Bakery {
  var itemsForSale = [
    "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
    "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
    "Donut" : Pastry(flavor: "Sprinkles", numberOnHand: 24),
    "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
  ]
  
  func open(_ now: Bool = Bool.random()) throws -> Bool {
    guard now else {
      throw Bool.random() ? BakeryError.inventory
                          : BakeryError.noPower
    }
    return now
  }

  func orderPastry(item: String,
                   amountRequested: Int,
                   flavor: String)  throws  -> Int {
    guard let pastry = itemsForSale[item] else {
      throw BakeryError.doNotSell
    }
    guard flavor == pastry.flavor else {
      throw BakeryError.wrongFlavor
    }
    guard amountRequested <= pastry.numberOnHand else {
      throw BakeryError.tooFew(numberOnHand:
                               pastry.numberOnHand)
    }
    pastry.numberOnHand -= amountRequested

    return pastry.numberOnHand
  }
}


let bakery = Bakery()


do {
  try bakery.open()
  try bakery.orderPastry(item: "Albatross",
                          amountRequested: 1,
                          flavor: "AlbatrossFlavor")
} catch BakeryError.inventory, BakeryError.noPower {
  print("Sorry, the bakery is now closed.")
} catch BakeryError.doNotSell {
  print("Sorry, but we don’t sell this item.")
} catch BakeryError.wrongFlavor {
  print("Sorry, but we don’t carry this flavor.")
} catch BakeryError.tooFew {
  print("Sorry, we don’t have enough items to fulfill your order.")
}


// Example 2 from the book
enum Direction {
  case left, right, forward
}

enum PugBotError: Error {
  case invalidMove(found: Direction, expected: Direction)
  case endOfPath
}

class PugBot {
  let name: String
  let correctPath: [Direction]
  private var currentStepInPath = 0

  init(name: String, correctPath: [Direction]) {
    self.correctPath = correctPath
    self.name = name
  }

  func move(_ direction: Direction) throws {
    guard currentStepInPath < correctPath.count else {
      throw PugBotError.endOfPath
    }
    let nextDirection = correctPath[currentStepInPath]
    guard nextDirection == direction else {
      throw PugBotError.invalidMove(found: direction,
                                    expected: nextDirection)
    }
    currentStepInPath += 1
  }
  
  func reset() {
    currentStepInPath = 0
  }
}



let pug = PugBot(name: "Pug",
                 correctPath: [.forward, .left, .forward, .right])

func goHome() throws {
  try pug.move(.forward)
  try pug.move(.left)
  try pug.move(.forward)
  try pug.move(.right)
}

do {
  try goHome()
} catch {
  print("PugBot failed to get home.")
}


func moveSafely(_ movement: () throws -> ()) -> String {
  do {
    try movement()
    return "Completed operation successfully."
  } catch PugBotError.invalidMove(let found, let expected) {
    return "The PugBot was supposed to move \(expected), but moved \(found) instead."
  } catch PugBotError.endOfPath {
    return "The PugBot tried to move past the end of the path."
  } catch {
    return "An unknown error occurred."
  }
}


pug.reset()
moveSafely(goHome)

pug.reset()
moveSafely {
  try pug.move(.forward)
  try pug.move(.left)
  try pug.move(.forward)
  try pug.move(.right)
}

// Example 3

// 1
class Person {
  var name: String
  var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

// 2
enum PersonError: Error {
  case noName, noAge, noData
}

// 3
extension Person {
  var data: String {
    get throws {
      guard !name.isEmpty else {throw PersonError.noName}
      guard age > 0 else {throw PersonError.noAge}
      return "\(name) is \(age) years old."
    }
  }
}


let me = Person(name: "Cosmin", age: 36)

me.name = ""
do {
  try me.data
} catch {
  print(error) // "noName"
}

me.age = -36
do {
  try me.data
} catch {
  print(error) // "noName"
}

me.name = "Cosmin"
do {
  try me.data
} catch {
  print(error) // "noAge"
}

me.age = 36
do {
  try me.data // "Cosmin is 36 years old."
} catch {
  print(error)
}





extension Person {
  subscript(key: String) -> String {
    get throws {
      switch key {
        case "name": return name
        case "age": return "\(age)"
        default: throw PersonError.noData
      }
    }
  }
}


do {
  try me["name"] // "Cosmin"
} catch {
  print(error)
}

do {
  try me["age"] // "36"
} catch {
  print(error)
}

do {
  try me["gender"]
} catch {
  print(error) // "noData"
}


// -- -- -- -- -- -- --
// throws vs rethrows

print()
print()

func performRethrowing(times: Int, movement: () throws -> ()) rethrows {
  for _ in 1...times {
    try movement()
  }
}

performRethrowing(times: 5, movement: {
    print("HELLO A")
})

do {
    try performRethrowing(times: 5, movement: {
        print("HELLO B")
        throw BakeryError.doNotSell
    })
} catch {}


func performThrowing(times: Int, movement: () throws -> ()) throws {
  for _ in 1...times {
    try movement()
  }
}

try! performThrowing(times: 5, movement: {
    print("HELLO X")
})

do {
    try performThrowing(times: 5, movement: {
        print("HELLO Y")
        throw BakeryError.doNotSell
    })
} catch {}
