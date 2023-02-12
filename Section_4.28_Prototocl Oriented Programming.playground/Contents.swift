
// Static Dispatch vs Dynamic Dispatch

// AProtocol / AClass example: Static Dispatch is used
// BProtocol / BClass example: Dynamic Dispatch is used
// Why?
// The key is whether the `f()` is declared in the protocol itself. If yes, then Dynamic, if no, then Static.



protocol AProtocol {
    // f() is not declared here => Static Dispatch
}

extension AProtocol {
    func f() {
        print("f from AProtocol extension")
    }
}

class AClass: AProtocol {
    func f() {
        print("f from AClass")
    }
}

let actualTypeReferenceA = AClass()
let protocolReferenceA: AProtocol = actualTypeReferenceA

//actualTypeReferenceA.f() // f from AClass
//protocolReferenceA.f() // f from AProtocol extension



protocol BProtocol {
    func f() // f() is declared here => Dynamic Dispatch
}

extension BProtocol {
    func f() {
        print("f from BProtocol extension")
    }
}

class BClass: BProtocol {

    func f() {
        print("f from BClass")
    }
}

let actualTypeReferenceB = BClass()
let protocolReferenceB: BProtocol = actualTypeReferenceB

//actualTypeReferenceB.f() // f from BClass
//protocolReferenceB.f() // f from BClass


// -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --








/*
 Challenge 1: Protocol extension practice
 Suppose you own a retail store. You have food items, clothes and electronics. Begin with an Item protocol:

 protocol Item {
   var name: String { get }
   var clearance: Bool { get }
   var msrp: Double { get } // Manufacturer’s Suggested Retail Price
   var totalPrice: Double { get }
 }

 Fulfill the following requirements using what you’ve learned about protocol-oriented programming. In other words, minimize the code in your classes, structs or enums.

 Clothes do not have a sales tax, but all other items have 7.5% sales tax.
 When food items are discounted 50% on clearance, clothes are discounted 25%, and electronics are discounted 5%.
 Items should implement CustomStringConvertible and return name. Food items should also print their expiration dates.
 */


protocol Item: CustomStringConvertible {
  var name: String { get }
  var clearance: Bool { get }
  var msrp: Double { get } // Manufacturer’s Suggested Retail Price
  var totalPrice: Double { get }
}


extension Item {
  var description: String {
    return name
  }
}

protocol Taxable {
    var salesTaxPercent: Double { get }
}

protocol Discountable {
    var dicsountPercent: Double { get }
}


//enum Discount: Double {
//    case food = 0.5
//    case clothes = 0.25
//    case electronics = 0.05
//}

enum Discount {
    static let food = 0.5
    static let clothes = 0.25
    static let electronics = 0.05
}


struct ExpirationDate: CustomStringConvertible {
    let date: Int
    let month: Int
    let year: Int
    
    var description: String {
        "\(date)/\(month)/\(year)"
    }
    
}


struct Food: Item, Taxable, Discountable {
    let name: String
    var clearance: Bool
    let msrp: Double
    
    let salesTaxPercent: Double = 0.075
    let dicsountPercent = Discount.food
    
    var totalPrice: Double {
        if clearance {
            return (msrp - (dicsountPercent*msrp)) + (salesTaxPercent*msrp)
        } else {
            return msrp + (salesTaxPercent*msrp)
        }
    }
    
    let expirationDate: ExpirationDate
    
    var description: String {
        "Expiration tate of \(name): \(expirationDate)"
    }
    

//
//    var description: String {
//        "\(name) expires \(expirationDate.date)/\(expirationDate.month)/\(expirationDate.year)"
//    }
}


struct Clothes: Item, Discountable {
    let name: String
    var clearance: Bool
    let msrp: Double
    
    let dicsountPercent = Discount.clothes
    
    var totalPrice: Double {
        if clearance {
            return msrp - dicsountPercent*msrp
        } else {
            return msrp
        }
    }
    

}


struct Electronics: Item, Taxable, Discountable {
    let name: String
    var clearance: Bool
    let msrp: Double
    
    let salesTaxPercent: Double = 0.075
    let dicsountPercent = Discount.electronics
    
    var totalPrice: Double {
        if clearance {
            return (msrp-(dicsountPercent*msrp)) + (salesTaxPercent*msrp)
        } else {
            return msrp + (salesTaxPercent*msrp)
        }
    }
    

    
}


Food(name: "meat", clearance: false, msrp: 5.0, expirationDate: ExpirationDate(date: 10, month: 02, year: 2023)).totalPrice
Food(name: "meat", clearance: true, msrp: 5.0, expirationDate: ExpirationDate(date: 10, month: 02, year: 2023)).totalPrice
Clothes(name: "dress", clearance: true, msrp: 10.0).totalPrice
Clothes(name: "dress", clearance: false, msrp: 10.0).totalPrice
Electronics(name: "TV", clearance: false, msrp: 100.0).totalPrice

Food(name: "meat", clearance: false, msrp: 5.0, expirationDate: ExpirationDate(date: 10, month: 02, year: 2023))
Clothes(name: "dress", clearance: true, msrp: 10.0)
Electronics(name: "TV", clearance: true, msrp: 100.0)



/*
 // Solution from the book:
 
 protocol Item: CustomStringConvertible {
   var name: String { get }
   var clearance: Bool { get }
   var msrp: Double { get } // Manufacturer's Suggested Retail Price
   var totalPrice: Double { get }
 }

 protocol Taxable: Item {
   var taxPercentage: Double { get }
 }

 protocol Discountable: Item {
   var adjustedMsrp: Double { get }
 }

 extension Item {
   var description: String {
     name
   }
 }

 extension Item {
   var totalPrice: Double {
     msrp
   }
 }

 extension Item where Self: Taxable {
   var totalPrice: Double {
     msrp * (1 + taxPercentage)
   }
 }

 extension Item where Self: Discountable {
   var totalPrice: Double {
     adjustedMsrp
   }
 }

 extension Item where Self: Taxable & Discountable {
   var totalPrice: Double {
     adjustedMsrp * (1 + taxPercentage)
   }
 }

 struct Clothing: Discountable {
   let name: String
   var msrp: Double
   var clearance: Bool

   var adjustedMsrp: Double {
     msrp * (clearance ? 0.75 : 1.0)
   }
 }

 struct Electronics: Taxable, Discountable {
   let name: String
   var msrp: Double
   var clearance: Bool

   let taxPercentage = 0.075

   var adjustedMsrp: Double {
     msrp * (clearance ? 0.95 : 1.0)
   }
 }

 struct Food: Taxable {
   let name: String
   var msrp: Double
   var clearance: Bool
   let expirationDate: (month: Int, year: Int)

   let taxPercentage = 0.075

   var adjustedMsrp: Double {
     msrp * (clearance ? 0.50 : 1.0)
   }

   var description: String {
     "\(name) - expires \(expirationDate.month)/\(expirationDate.year)"
   }
 }

 Food(name: "Bread", msrp: 2.99, clearance: false, expirationDate: (11, 2016)).totalPrice
 Clothing(name: "Shirt", msrp: 12.99, clearance: true).totalPrice
 Clothing(name: "Last season shirt", msrp: 12.99, clearance: false).totalPrice
 Electronics(name: "Apple TV", msrp: 139.99, clearance: false).totalPrice
 Electronics(name: "Apple TV 3rd gen", msrp: 99.99, clearance: true).totalPrice

 // Custom string convertible demonstration
 Food(name: "Bread", msrp: 2.99, clearance: false, expirationDate: (11, 2016))
 Electronics(name: "Apple TV 3rd gen", msrp: 99.99, clearance: true)
 
 */




/*
 Challenge 2: Doubling values
 Write a protocol extension on Sequence named double() that only applies to sequences of numeric elements. Make it return an array where each element is twice the element in the sequence. Test your implementation on an array of Int and an array of Double, then see if you can try it on an array of String.

 Hints:
 Numeric values implement the protocol Numeric.
 Your method signature should be double() -> [Element]. The type [Element] is an array of whatever type the Sequence holds, such as String or Int.
 */



extension Sequence where Element: Numeric {
    func double() -> [Element] {
        return map { $0 * 2 }
    }
    
}
