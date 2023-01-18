import Foundation


/*
 Challenge 1: Character count
 Write a function that takes a string and prints out the count of each character in the string.
 
 For bonus points, print them ordered by the count of each character.
 
 For bonus-bonus points, print it as a nice histogram.

 Hint: You could use # characters to draw the bars.
 */

func numberOfEachCharacter (_ string: String) {
    guard string.count > 0 else { return }
            
    var charactersDict: [Character: Int] = [:]
    for character in string {
       charactersDict[character, default: 0] += 1
    }
    
    
    let filteredDict = charactersDict.sorted(by: < )
    
    for i in filteredDict {
        print("\(i.key): \(i.value)")
    }
    
    
    var octotorp = "#"
    for (key, value) in filteredDict {
        let s = String(repeating: octotorp, count: value)
        print("\(key): \(s)")
    }
    
}

//numberOfEachCharacter("Hinttttnn")
//numberOfEachCharacter("")
//print()



/*
 Challenge 2: Word count
 Write a function that tells you how many words there are in a string. Do it without splitting the string.

 Hint: try iterating through the string yourself.
 */

func numberOfWords(in text: String) -> Int {
    var counter = 1

    for character in text {
        if character == " " {
            counter += 1
        }
    }
//    print(counter)
    return counter
}
numberOfWords(in: "Write a function that tells you how many words there are in a string.")



/*
 Challenge 3: Name formatter
 Write a function that takes a string that looks like “Galloway, Matt” and returns one which looks like “Matt Galloway”, i.e., the string goes from "<LAST_NAME>, <FIRST_NAME>" to "<FIRST_NAME> <LAST_NAME>".
 */

func nameFormatter (_ fullName: String) -> String {
    let fullName = fullName.replacingOccurrences(of: ",", with: "")
    let spaceIndex = fullName.firstIndex(of: " ")!
    
    let lastName = fullName[fullName.startIndex..<spaceIndex]
    let lastNameString = String(lastName)
    
    
    let firstName = fullName[fullName.index(after: spaceIndex)...]
    let firstNameString = String(firstName)
    
//    print("\(firstNameString) \(lastNameString)")
    return "\(firstNameString) \(lastNameString)"
}

nameFormatter("Galloway, Matt")


/*
 Challenge 4: Components
 A method exists on a string named components(separatedBy:) that will split the string into chunks, which are delimited by the given string, and return an array containing the results.

 Your challenge is to implement this yourself.

 Hint: There exists a view on String named indices that lets you iterate through all the indices (of type String.Index) in the string. You will need to use this.
 */

//var x = "Your, challenge is, to implement this yourself."
//print(x.components(separatedBy: ",")) // ["Your", " challenge is", " to implement this yourself."]


func splitString(_ string: String, delimiter: Character) -> [String] {
    var result = [String]()
    var lastWordIndex = string.startIndex


//    print("string.indices : \(string.indices)")
    
    for i in string.indices {
//    print("i: \(i)")
//        print("string[i]: \(string[i])")
        
        if string[i] == delimiter {
            let substring = string[lastWordIndex..<i]
            result.append(String(substring))
            
            lastWordIndex = string.index(i, offsetBy: 1) // offset = смещение
//            print(lastWordIndex)
        }
    }
    
    
    let substring = string[lastWordIndex..<string.endIndex]
    result.append(String(substring))

    print(result)
    return result
}

//splitString("Your, challenge is, to implement this yourself. Your, challenge is, to implement this yourself.", delimiter: ",")



/*
 Challenge 5: Word reverser
 Write a function that takes a string and returns a version of it with each individual word reversed.

 For example, if the string is “My dog is called Rover” then the resulting string would be “yM god si dellac revoR”.

 Try to do it by iterating through the indices of the string until you find a space and then reversing what was before it. Build up the result string by continually doing that as you iterate through the string.

 Hint: You’ll need to do a similar thing as you did for Challenge 4 but reverse the word each time. Try to explain to yourself, or the closest unsuspecting family member, why this is better in terms of memory usage than using the function you created in the previous challenge.
 */


func reverseWordsInString(_ string: String) -> String {
    var result = ""
    var lastWordIndex = string.startIndex

    for i in string.indices {

        if string[i] == " " {
            let substring = string[lastWordIndex..<i]

            result += substring.reversed() + " "

            lastWordIndex = string.index(i, offsetBy: 1)
        }

    }

    let substring = string[lastWordIndex..<string.endIndex]
    result.append(String(substring.reversed()))

    print(result)
    return result
}

reverseWordsInString("My dog is called Rover")
reverseWordsInString("")
reverseWordsInString("abc")



