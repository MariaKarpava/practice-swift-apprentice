/*
 Challenge 1: Build a collection
 Consider the pet and keeper example from earlier in the chapter.
 
 Imagine that instead of looking after only two animals, every keeper looks after a changing number of animals throughout the day. It could be one, two, or ten animals per keeper instead of just morning and afternoon ones. You’d have to do things like the following:

 let christine = Keeper<Cat>(name: "Christine")

 christine.lookAfter(someCat)
 christine.lookAfter(anotherCat)

 You’d want access to the count of animals for a keeper like christine.countAnimals and to access the 51st animal via a zero-based index like christine.animalAtIndex(50).

 Of course, you’re describing your old friend, the array type, Array<Element>!

 Your challenge is to update the Keeper type to have this kind of interface. You’ll probably want to include a private array inside Keeper and then provide methods and properties on Keeper to allow outside access to the array.

 */

class Cat {
    var name: String

    init(name: String) {
        self.name = name
  }
}

class Dog {
    var name: String

    init(name: String) {
    self.name = name
  }
}


class Keeper<Animal> {
    var name: String
    
    private var animals: [Animal]
    
    var countAnimals: Int {
        get {
            animals.count
        }
    }
    
    init(name: String) {
        self.name = name
        self.animals = []
    }
    
    func lookAfter(_ animal: Animal) {
        animals.append(animal)
    }
    
    func animalAtIndex(_ index: Int) -> Animal? {
        guard index < animals.count else {
            return nil
        }
        return animals[index]
    }
    
}


let christine = Keeper<Cat>(name: "Christine")
//print(type(of: christine))

let cat1 = Cat(name: "cat1")
let dog1 = Dog(name: "dog1")
let cat2 = Cat(name: "cat2")


christine.lookAfter(cat1)
christine.lookAfter(cat2)
//christine.lookAfter(dog1) // can't put dog into kepper of cats

print(christine.countAnimals)
if let cat = christine.animalAtIndex(1) {
    print(cat.name)
} else {
    print("no cat")
}

if let cat = christine.animalAtIndex(2) {
    print(cat.name)
} else {
    print("no cat")
}


// -- -- -- --

class Keeper_Cat {
    var name: String
    
    private var animals: [Cat]
    
    var countAnimals: Int {
        get {
            animals.count
        }
    }
    
    init(name: String) {
        self.name = name
        self.animals = []
    }
    
    func lookAfter(_ animal: Cat) {
        animals.append(animal)
    }
    
    func animalAtIndex(_ index: Int) -> Cat? {
        guard index <= animals.count else {
            return nil
        }
        return animals[index]
    }
    
}

class Keeper_Dog {
    var name: String
    
    private var animals: [Dog]
    
    var countAnimals: Int {
        get {
            animals.count
        }
    }
    
    init(name: String) {
        self.name = name
        self.animals = []
    }
    
    func lookAfter(_ animal: Dog) {
        animals.append(animal)
    }
    
    func animalAtIndex(_ index: Int) -> Dog? {
        guard index <= animals.count else {
            return nil
        }
        return animals[index]
    }
    
}

