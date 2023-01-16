/*
 Challenge 2: Remove the first number
 Write a function that removes the first occurrence of a given integer from an array of integers.
 */


func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var result = array
    
    if let index = array.firstIndex(of: item) {
        result.remove(at: index)
      }
    
    print(result)
    return result
}

removingOnce(6, from: [3,6,1,3,6]) // [3, 1, 3, 6]





/*
 Challenge 3: Remove the numbers
 Write a function that removes all occurrences of a given integer from an array of integers.
 */

func removing(_ item: Int, from array: [Int]) -> [Int] {
    var result = [Int]()
    
    for candidate in array {
        if candidate != item {
          result.append(candidate)
        }
      }
    
    print(result)
    return result
}
removing(6, from: [3,6,1,3,6])





/*
 Challenge 4: Reverse an array
 Arrays have a reversed() method that returns an array holding the same elements as the original array in reverse order. Write a function that does the same thing without using reversed().
 */

// 1
func reversed1(_ array: [Int]) -> [Int] {
    var array = array
    var reversedArray = [Int]()
    
    for _ in array {
        var last = array.removeLast()
        reversedArray.append(last)
    }
    print(reversedArray)
    return reversedArray
}

reversed1([1,2,3,4,5])


// 2
func reversed2(_ array: [Int]) -> [Int] {
    var reversedArray = [Int]()
    
    for i in 0..<array.count {
        
        var last = array[(array.count-1)-i]
        reversedArray.append(last)
    }
    print(reversedArray)
    return reversedArray
}

reversed2([1,2,3,4,5])


// 3
func reversed3(_ array: [Int]) -> [Int] {
  var reversedArray = [Int]()
    
  for item in array {
      reversedArray.insert(item, at: 0)
  }
  return reversedArray
}

reversed3([1,2,3,4,5])




/*
Challenge 5: Return the middle
Write a function that returns the middle element of an array. When array size is even, return the first of the two middle elements.
*/


func middle2(_ array: [Int]) -> Int? {
  guard !array.isEmpty else {
    return nil
  }
    
  print(array[(array.count-1)/2])
  return array[(array.count-1)/2]
}

middle2([])
middle2([1,2,3,4,5])
middle2([1,2,3,4,5,6])





/*
 Challenge 6: Find the minimum and maximum
 Write a function that calculates the minimum and maximum values in an array of integers. Calculate these values yourself; don’t use the methods min and max. Return nil if the given array is empty.
 */

func minMax(of numbers: [Int]) -> (min: Int, max: Int)? {
    guard !numbers.isEmpty else {
      return nil
    }
      
    var min = numbers[0]
    var max = numbers[0]
    
    for number in numbers {
        if number < min {
            min = number
        }
        
        if number > max {
            max = number
        }
    }
    
    print(min, max)
    return (min, max)
}

minMax(of: [1,4,6,2,3])




/*
 Challenge 8: Long names
 Given a dictionary with two-letter state codes as keys, and the full state names as values, write a function that prints all the states with names longer than eight characters. For example, for the dictionary ["NY": "New York", "CA": "California"], the output would be California.
 */

func statesWithLongNames(in dictionary: [String : String]) {
    
    for (_, state) in dictionary {
        if state.count > 8 {
            print(state)
        }
    }
}

statesWithLongNames(in: ["NY": "New York", "CA": "California"])
statesWithLongNames(in: [:])




/*
 Challenge 9: Merge dictionaries
 Write a function that combines two dictionaries into one. If a certain key appears in both dictionaries, ignore the pair from the first dictionary.
 */

func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var newDictionary = dict1
        for (key, value) in dict2 {
            newDictionary[key] = value
        }

    print(newDictionary)
    return newDictionary
}

merging(["NY": "New York", "CA": "California"], with: ["NY": "NewYork", "CA": "California", "TX": "Texas"])




/*
 Challenge 10: Count the characters
 Declare a function occurrencesOfCharacters that calculates which characters occur in a string, as well as how often each of these characters occur. Return the result as a dictionary.
 
 Hint: String is a collection of characters that you can iterate over with a for statement. Bonus: To make your code shorter, dictionaries have a special subscript operator that lets you add a default value if it is not found in the dictionary. For example, dictionary["a", default: 0] creates a 0 entry for the character “a” if it is not found instead of just returning nil.
 */

func occurrencesOfCharacters(in text: String) -> [Character: Int] {
    var dict: [Character: Int] = [:]
    
    for character in text {
        dict[character, default: 0] += 1
    }
    
    print(dict)
    return dict
}
occurrencesOfCharacters(in: "String is a collection of characters that you can iterate over with a for statement.")
occurrencesOfCharacters(in: "")
occurrencesOfCharacters(in: "A")


/*
 Challenge 11: Unique values
 Write a function that returns true if all of the values of a dictionary are unique. Use a set to test uniqueness.
 */

func isInvertible(_ dictionary: [String: Int]) -> Bool {
    var uniqueValues: Set<Int> = []
    
    for value in dictionary.values {
        if uniqueValues.contains(value) == false {
            uniqueValues.insert(value)
        } else {
            return false
        }
    }

    return true
}

isInvertible(["NY": 1, "CA": 2, "TX": 2, "NN": 3])
isInvertible(["NY": 1, "CA": 2, "TX": 4, "NN": 3])





/*
 Challenge 12: Removing keys and setting values to nil
 Given the dictionary:

 var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick": "Intern", "Ray": "Hacker"]

 Set the value of the key "Patrick" to nil and completely remove the key and value for "Ray".
 */

var nameTitleLookup: [String: String?] = ["Mary": "Engineer", "Patrick": "Intern", "Ray": "Hacker"]

// Set value to nil
nameTitleLookup.updateValue(nil, forKey: "Patrick")

// Remove completely
nameTitleLookup["Ray"] = nil
nameTitleLookup.removeValue(forKey: "Ray")

print(nameTitleLookup)
