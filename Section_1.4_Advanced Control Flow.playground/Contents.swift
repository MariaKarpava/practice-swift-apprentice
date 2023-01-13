import Foundation


var sum = 0
var count = 10
for i in 1...count where i % 2 == 1 {
    sum += i
//    print(sum)
}



var sumOfAllRaws = 0
for row in 0..<8 {
  if row % 2 == 0 {
    continue
  }

  for column in 0..<8 {
      sumOfAllRaws += row * column
  }
}
print(sumOfAllRaws)




sum = 0

rowLoop: for row in 0..<8 {
  columnLoop: for column in 0..<8 {
    if row == column {
      continue rowLoop
    }
    sum += row * column
  }
}
print(sum)


// Challenge 3: What will print

let coordinates = (1, 5, 0)
//let coordinates = (2, 2, 2)
//let coordinates = (3, 0, 1)
//let coordinates = (3, 2, 5)
//let coordinates = (0, 2, 4)


switch coordinates {
case let (x, y, z) where x == y && y == z:
  print("x = y = z")
case (_, _, 0):
  print("On the x/y plane")
case (_, 0, _):
  print("On the x/z plane")
case (0, _, _):
  print("On the y/z plane")
default:
  print("Nothing special")
}


/*
Challenge 5: The final countdown
Print a countdown from 10 to 0. (Note: do not use the reversed() method, which will be introduced later.)
*/

var number = 10

for _ in 0...10 {
    print(number)
    number -= 1
}

// OR:
for i in 0...10 {
    print(10 - i)
}


/*
 Challenge 6: Print a sequence
 Print 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0. (Note: do not use the stride(from:by:to:) function, which will be introduced later.)
 */

print()
let numberToAdd = 0.1
var result = 0.0

for _ in 0...1 {
    for _ in 0...9 {
        print(round(result * 10) / 10.0)
        result += numberToAdd
        
        if result >= 1.0 {
            break
        }
    }
}


