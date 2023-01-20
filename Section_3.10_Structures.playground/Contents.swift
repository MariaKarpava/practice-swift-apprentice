/*
 Challenge 1: Fruit tree farm
Imagine you’re at a fruit tree farm, and you grow different kinds of fruits: pears, apples, and oranges. After the fruits are picked, a truck brings them in to be processed at the central facility. Since the fruits are all mixed together on the truck, the workers in the central facility have to sort them into the correct inventory container one by one.

Implement an algorithm that receives a truck full of different kinds of fruits and places each fruit into the correct inventory container.

Keep track of the total weight of fruit processed by the facility and print out how many of each fruit is in the inventory.
*/


let truck = ["apple", "banana", "orange", "apple", "apple", "orange"]

struct Facility {
    var appleContainer: Int
    var bananaContainer: Int
    var orangeContainer: Int
}

var farmFacility = Facility(appleContainer: 0, bananaContainer: 0, orangeContainer: 0)

func sortFruits (fruirsToProcess: [String], facility: Facility) -> Facility {
    var facility = facility
    
    for fruit in fruirsToProcess {
        
        switch fruit {
        case "apple":
            facility.appleContainer += 1
        case "banana":
            facility.bananaContainer += 1
        case "orange":
            facility.orangeContainer += 1
        default:
            print("arror")
        }
        
    }
    return facility
}

//var readyFacility = sortFruits(fruirsToProcess: truck, facility: farmFacility)
//farmFacility = readyFacility
//
//print(farmFacility.orangeContainer)
//print(farmFacility.bananaContainer)
//print(farmFacility.appleContainer)





/*
 Challenge 2: A T-shirt model
 Create a T-shirt structure that has size, color and material options. Provide a method to calculate the cost of a shirt based on its attributes.
 */


typealias Size = String
let small: Size = "Small"
let medium: Size = "Medium"
let large: Size = "Large"

typealias Material = String
let cotton: Material = "Cotton"
let polyester: Material = "Polyester"
let wool: Material = "Wool"

typealias Color = String
let white: Color = "White"
let black: Color = "Black"
let blue: Color = "Blue"


struct Tshirt {
    let size: Size
    let material: Material
    let color: Color
    
    func cost() -> Int {
        var totalCost: Int
        
        
        let sizePrice: Int
        switch size {
        case small:
            sizePrice = 5
        case medium:
            sizePrice = 6
        case large:
            sizePrice = 7
        default:
            sizePrice = 10
        }
        
        
        let materialPrice: Int
        switch material {
        case cotton, polyester:
            materialPrice = 5
        case wool:
            materialPrice = 20
        default:
            materialPrice = 10
        }
        
        
        let colorPrice: Int
        switch color {
        case white, black, blue:
            colorPrice = 5
        default:
            colorPrice = 10
        }
        
        totalCost = sizePrice + materialPrice + colorPrice
        
        return totalCost
    }
}

//let tshirt1 = Tshirt(size: "Small", material: "Wool", color: "White").cost() // 30
//print(tshirt1)
//let tshirt2 = Tshirt(size: "XL", material: "Cotton", color: "Orange").cost() // 25
//print(tshirt2)


/*
 Challenge 3: Battleship
 Write the engine for a Battleship-like game. If you aren’t familiar with Battleship, you can brush up on the details at this webpage: http://bit.ly/2nT3JBU

 Use an (x, y) coordinate system for your locations modeled using a structure.
 Ships should also be modeled with structures. Record an origin, direction and length.
 Each ship should be able to report if a “shot” has resulted in a “hit”.
 */

struct Coordinate {
  let x: Int
  let y: Int
}

typealias Direction = String
let vertical: Direction = "Vertical"
let horizontal: Direction = "Horizontal"



struct Ship {
    let origin: Coordinate
    let direction: Direction
    let length: Int

    
    func hit(hitCoordinate: Coordinate) -> Bool {

        var newCoordinate: Coordinate = origin
        
        var currentXCoordinate = newCoordinate.x
        var currentYCoordinate = newCoordinate.y
        
        for _ in 1...length {

            if hitCoordinate.x == currentXCoordinate && hitCoordinate.y == currentYCoordinate {
                return true
            }
            
            if direction == "Horizontal" {
                currentXCoordinate += 1
            } else if direction == "Vertical" {
                currentYCoordinate -= 1
            }
        }

        return false
    }

}


let ship1 = Ship(origin: Coordinate(x: 0, y: 0), direction: "Horizontal", length: 3)
let ship2 = Ship(origin: Coordinate(x: 6, y: 6), direction: "Vertical", length: 4)



struct Board {
    var ships: [Ship] = []
    
    func shoot(coordinate: Coordinate) -> Bool {
        for ship in ships {
              if ship.hit(hitCoordinate: coordinate) {
                print("Hit!")
                return true
              }
            }
            print("Missed.")
            return false
          }
}

var board = Board(ships: [ship1, ship2])



//board.shoot(coordinate: Coordinate(x: 0, y: 0)) // Hit!
//board.shoot(coordinate: Coordinate(x: 1, y: 0)) // Hit!
//board.shoot(coordinate: Coordinate(x: 2, y: 0)) // Hit!
//board.shoot(coordinate: Coordinate(x: 3, y: 0)) // Missed
//board.shoot(coordinate: Coordinate(x: 0, y: 1)) // Missed
//print()
//board.shoot(coordinate: Coordinate(x: 6, y: 6)) // Hit!
//board.shoot(coordinate: Coordinate(x: 6, y: 5)) // Hit!
//board.shoot(coordinate: Coordinate(x: 6, y: 3)) // Hit!
//board.shoot(coordinate: Coordinate(x: 7, y: 6)) // Missed
