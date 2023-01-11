let coordinatesMixed = (2.1, 3)
// Inferred to be of type (Double, Int)

let coordinates = (2, 3)
let x1 = coordinates.0
let y1 = coordinates.1

let coordinatesNamed = (x: 2, y: 3)
// Inferred to be of type (x: Int, y: Int)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3) = coordinates3D

let (x4, y4, _) = coordinates3D


/*
 1. Declare a constant tuple that contains three Int values followed by a Double.
 Use this to represent a date (month, day, year) followed by an average
 temperature for that date.
 
 2. Change the tuple to name the constituent components. Give them names related to the data they contain: month, day, year and averageTemperature.
 
 3. In one line, read the day and average temperature values into two constants. You’ll need to employ the underscore to ignore the month and year.
 
 4. Up until now, you’ve only seen constant tuples. But you can create variable tuples, too. Change the tuple you created in the exercises above to a variable by using var instead of let. Now change the average temperature to a new value.
 */

var dataAndTempetature = (day: 01, month: 10, year: 2022, averageTemperature: 19.0)

let (day, _, _, averageTemperature) = dataAndTempetature

dataAndTempetature.averageTemperature = 20.0


/*
 A useful feature of Swift is being able to create your own type which is an alias of another type. What this means you can do is give a more useful name to your type that describes what it is, but underneath, it’s just another type. This is known as a type alias.
 */
typealias Animal = String

let myPet: Animal = "Dog"

typealias Coordinates = (Int, Int)
let xy: Coordinates = (2, 4)



let a = 4
let b: Int32 = 100
let c: UInt8 = 12

let x = Int(a) + Int(b) - Int(c)
print(x)


print(Double.pi)
print(Float.pi)
