import Foundation


/*
 Create an enum GameCharacterType that defines values for elf, giant and wizard.
 Create a protocol GameCharacter that inherits from AnyObject and has properties name, hitPoints and attackPoints. Implement this protocol for every character type.
 Create a struct GameCharacterFactory with a single static method make(ofType: GameCharacterType) -> GameCharacter.
 Create a global function battle that pits two characters against each other — with the first character striking first! If a character reaches 0 hit points, they have lost.
 Hints:

 The playground should not be able to see the concrete types that implement GameCharacter.
 Elves have 3 hit points and 10 attack points. Wizards have 5 hit points and 5 attack points. Giants have 10 hit points and 3 attack points.
 The playground should know none of the above!
 In your playground, you should use the following scenario as a test case:
 */

public enum GameCharacterType {
    case elf
    case giant
    case wizard
}

public protocol GameCharacter: AnyObject {
    var name: String { get }
    var hitPoints: Int { get set }
    var attackPoints: Int { get }
}

class Elf: GameCharacter {
    var name = "Elf"
    var hitPoints = 3
    var attackPoints = 10
}

class Giant: GameCharacter {
    var name = "Giant"
    var hitPoints = 10
    var attackPoints = 3
}

class Wizard: GameCharacter {
    var name = "Wizard"
    var hitPoints = 5
    var attackPoints = 5
}


public struct GameCharacterFactory {
    
    static public func make(ofType type: GameCharacterType) -> GameCharacter {
        switch type {
        case .elf:
            return Elf()
        case .giant:
            return Giant()
        case .wizard:
            return Wizard()
        }
    }
}


public func battle(_ character1: GameCharacter, vs character2: GameCharacter) {
    print()
    print("\(type(of: character1)).hitPoints = \(character1.hitPoints); \(type(of: character2)).hitPoints = \(character2.hitPoints)")
    
    character2.hitPoints -= character1.attackPoints
    
    if character2.hitPoints <= 0 {
        print("\(character2) has lost.")
        return 
    }
    
    character1.hitPoints -= character2.attackPoints
    
    if character1.hitPoints <= 0 {
        print("\(character1) has lost.")
    } else {
        print("Both players still active.")
    }
    

}

