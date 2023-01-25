/*
 Challenge 1: Movie lists
 
 Imagine you’re writing a movie-viewing app in Swift. Users can create lists of movies and share those lists with other users. Create a User and a List class that uses reference semantics to help maintain lists between users.

 User: Has a method addList(_:) that adds the given list to a dictionary of List objects (using the name as a key), and list(forName:) -> List? that returns the List for the provided name.
 
 List: Contains a name and an array of movie titles. A print method will print all the movies in the list.
 
 Create jane and john users and have them create and share lists. Have both jane and john modify the same list and call print from both users. Are all the changes reflected?
 
 What happens when you implement the same with structs? What problems do you run into?
 */


class User {
    var lists: [String: List] = [:]
    
    func addList(_ list: List) {     // ["Drama", dramaList, "Comedy", comedyList]
        lists[list.name] = list
    }
    
    func list(forName name: String) -> List? {      // masha.list("Drama") -> dramaList
        lists[name]
    }
    
}


class List {
    let name: String    // "Drama"
    var movieTitles: [String] = []    // ["Deep Water", "Knives Out"]
    
    init(name: String) {
        self.name = name
    }
    
    func printAllMovies() {
        print("Movie List: \(name)")   // Movie List: "Drama"
 
        for movie in movieTitles {     // "Deep Water"
            print(movie)               // "Knives Out"
        }
    }
    
}

var masha = User()
var igor = User()

var dramaList = List(name: "Drama")
var comedyList = List(name: "Comedy")


masha.addList(dramaList)
masha.addList(comedyList)
igor.addList(dramaList)


masha.lists["Drama"]?.movieTitles.append("Deep Water") // masha.lists["Drama"]? -> dramaList;  dramaList.movieTitles.append("Deep Water") -> movieTitles = ["Deep Water"]

masha.lists["Drama"]?.movieTitles.append("Knives Out")

igor.lists["Drama"]?.movieTitles.append("Aftersun")


masha.lists["Drama"]?.printAllMovies()
print()
igor.lists["Drama"]?.printAllMovies()



/*
 Challenge 2: T-shirt store
 Your challenge here is to build a set of objects to support a T-shirt store. Decide if each object should be a class or a struct and why.

 TShirt: Represents a shirt style you can buy. Each TShirt has a size, color, price, and an optional image on the front.
 
 User: A registered user of the t-shirt store app. A user has a name, email, and a ShoppingCart (see below).
 
 Address: Represents a shipping address and contains the name, street, city, and zip code.
 
 ShoppingCart: Holds a current order, which is composed of an array of TShirt that the User wants to buy, as well as a method to calculate the total cost. Additionally, there is an Address that represents where the order will be shipped.
 
 Bonus: After you’ve decided on whether to use a class or struct for each object, go ahead and implement them all!
 */


struct Tshirt {
    var size: String
    var color: String
    var price: Int
    var hasImage: Bool
}

class UserX {
    var name: String
    var email: String
    var shoppingCart: ShoppingCart
    
    init(name: String, email: String, shoppingCart: ShoppingCart) {
        self.name = name
        self.email = email
        self.shoppingCart = shoppingCart
    }
}


struct Address {
    var name: String
    var street: String
    var city: String
    var zipCode: String
}


class ShoppingCart {
    var wantedTshirts: [Tshirt] = []
    var address: Address
    
    init(address: Address) {
        self.address = address
    }
    
    func totalCost() -> Int {
        var result = 0
        for tshirt in wantedTshirts {
            result += tshirt.price
        }
        return result
    }
}
