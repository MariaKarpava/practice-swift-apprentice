/*
 Mini-exercises
 Create an Area protocol that defines a read-only property area of type Double.
 Implement Area with structs representing Square, Triangle and Circle.
 Add a circle, a square and a triangle to an array. Convert the array of shapes to an array of areas using map.
 */

protocol Area {
    var area: Double { get }
}


struct Square: Area {
    let side: Double
    
    var area: Double  {
        side * side
    }
}

struct Triangle: Area {
    var base: Double
    var height: Double

    
    var area: Double  {
        (base * height) / 2
    }
}

struct Circle: Area {
    var radius: Double
    
    var area: Double  {
        .pi * radius * radius
    }
}

let square = Square(side: 2.0)
let triangle = Triangle(base: 5.0, height: 4.0)
let circle = Circle(radius: 3.0)

let shapes: [Area] = [square, triangle, circle]

var areas = shapes.map { $0.area }
print(areas)


/*
 Challenge 1: Pet shop tasks
 Create a collection of protocols for tasks at a pet shop with dogs, cats, fish and birds.

 The pet shop duties include these tasks:

 All pets need to be fed.
 Pets that can fly need to be caged.
 Pets that can swim need to be put in a tank.
 Pets that walk need exercise.
 Tanks and cages need to be cleaned occasionally.
 Create classes or structs for each animal and adopt the appropriate protocols. Feel free to simply use a print() statement for the method implementations.

 Create homogeneous arrays for animals that need to be fed, caged, cleaned, walked, and tanked. Add the appropriate animals to these arrays. The arrays should be declared using the protocol as the element type, for example, var caged: [Cageable]

 Write a loop that will perform the proper tasks (such as feed, cage, walk) on each element of each array.
 */

protocol Feedable {
    func feed()
}

protocol Walkable {
    func exercised()
}

protocol Cleanable {
    func clean()
}

protocol Tankable {
    func putInTank()
}

protocol Cageable {
    func cage()
}




class Dogs: Feedable, Walkable {
    func feed() { print("Dog was fed.") }
    func exercised() { print("Dog returned from a walk.") }
}

class Cats: Feedable, Walkable {
    func feed() { print("Cat was fed.") }
    func exercised() { print("Cat returned from a walk.") }
}

class Fishes: Feedable, Tankable, Cleanable {
    func feed() { print("Fish was fed.") }
    func putInTank() { print("Fish is in a tank.") }
    func clean() { print("Fish Tank was cleaned.") }
}

class Birds: Feedable, Cageable, Cleanable {
    func feed() { print("Bird was fed.") }
    func cage() { print("Bird is in a cage.") }
    func clean() { print("Bird cage was cleaned.") }
}

let dog = Dogs()
let cat = Cats()
let fish = Fishes()
let bird = Birds()

let feedableAnimals: [Feedable] = [dog, cat, fish, bird]
let cagedAnimals: [Cageable] = [bird]
let cleaned: [Cleanable] = [bird, fish]
let walkedAnimals: [Walkable] = [cat, dog]
let tankedAnimals: [Tankable] = [fish]

for animal in feedableAnimals {
    animal.feed()
}

for animal in cagedAnimals {
    animal.cage()
}

for animal in cleaned {
    animal.clean()
}

for animal in walkedAnimals {
    animal.exercised()
}

for animal in tankedAnimals {
    animal.putInTank()
}
