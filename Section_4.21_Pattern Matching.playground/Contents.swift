import Foundation

func fibonacci(position: Int) -> Int {
  switch position {
  // 1
  case let n where n <= 1:
    return 0
  // 2
  case 2:
    return 1
  // 3
  case let n:
    return fibonacci(position: n - 1) + fibonacci(position: n - 2)
  }
}

func f2(position: Int) -> Int {
    if position <= 1 { return 0 }
    else if position == 2 { return 1 }
    else { return f2(position: position - 1) + f2(position: position - 2) }
}

func f3(position: Int) -> Int {
    guard position > 2 else {
        return position == 2 ? 1 : 0
    }
    return f3(position: position - 1) + f3(position: position - 2)
}

print(fibonacci(position: 15))  // 377
print(f2(position: 15))  // 377
print(f3(position: 15))  // 377

if case 1...10 = 5 {
     print("In the range")
}

let matched = (1...10 ~= 5)
print(matched)

let list = [0, 1, 2, 3]
let integer = 2

/*
Challenge 1: Carded
Given this code, write an if statement that shows an error if the user is not yet 21 years old:

enum FormField {
  case firstName(String)
  case lastName(String)
  case emailAddress(String)
  case age(Int)
}
let minimumAge = 21
let submittedAge = FormField.age(22)
*/

enum FormField {
  case firstName(String)
  case lastName(String)
  case emailAddress(String)
  case age(Int)
}
    
    
let minimumAge = 21
let submittedAge = FormField.age(22)

if case .age(let age) = submittedAge, case 0..<minimumAge = age {
    print("Not allowed")
} else {
    print("Allowed")
}


/*
 Challenge 2: Planets with liquid water
 Given this code, find the planets with liquid water using a for loop:

 enum CelestialBody {
   case star
   case planet(liquidWater: Bool)
   case comet
 }

 let telescopeCensus = [
   CelestialBody.star,
   .planet(liquidWater: false),
   .planet(liquidWater: true),
   .planet(liquidWater: true),
   .comet
 ]
 */

enum CelestialBody {
  case star
  case planet(liquidWater: Bool)
  case comet
}

let telescopeCensus = [
  CelestialBody.star,
  .planet(liquidWater: false),
  .planet(liquidWater: true),
  .planet(liquidWater: true),
  .comet
]

for element in telescopeCensus {
    switch element {
    case .planet(let hasWater) where hasWater == true:
        print(element)
    default:
       continue
    }
}


/*
 Challenge 3: Find the year
 Given this code, find the albums that were released in 1974 with a for loop:

 let queenAlbums = [
   ("A Night at the Opera", 1974),
   ("Sheer Heart Attack", 1974),
   ("Jazz", 1978),
   ("The Game", 1980)
 ]
 */

let queenAlbums = [
  ("A Night at the Opera", 1974),
  ("Sheer Heart Attack", 1974),
  ("Jazz", 1978),
  ("The Game", 1980)
]
// 1
for album in queenAlbums {
    if album.1 == 1974 {
        print(album)
    }
}
print()

// 2
for album in queenAlbums {
    if case (_, 1974) = album {
        print(album)
    }
}
print()

// 3
queenAlbums
    .filter { $0.1 == 1974 }
    .forEach { print($0) }

print()


/*
 Challenge 4: Where in the world
 Given the following code, write a switch statement that will print out whether the monument is located in the northern hemisphere, the southern hemisphere, or on the equator.

 let coordinates = (lat: 37.334890, long: -122.009000)
 */

// GPS coordinates of Southern Hemisphere. Latitude: -45.0000 Longitude: 0.0000.

let coordinates = (lat: 37.334890, long: -122.009000)

// 1
switch coordinates {
case _ where coordinates.lat < 0:
    print("in Southern hemisphere")
case _ where coordinates.lat > 0:
    print("in North hemisphere")
case _ where coordinates.lat == 0:
    print("on the equator")
default:
    break
}


// 2
switch coordinates {
case (let lat, _) where lat < 0:
  print("In the Southern hemisphere!")
case (let lat, _) where lat == 0:
  print("Its on the equator!")
case (let lat, _) where lat > 0:
  print("In the Northern hemisphere!")
default:
  break
}
