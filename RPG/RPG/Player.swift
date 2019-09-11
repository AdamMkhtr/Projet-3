import Foundation








class Player {
  
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  

  private var team = Team()
  
  
  
  var isFull: Bool {
    return team.isFull
  }
  
  var isAllCharacterDead: Bool {
    return team.isAllCharacterDead
  }
  
  var test: Any {
    return team.characters
  }
  
  
  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------
  

  func getCharacter(at index: Int) -> Character {
    return getCharacter(at: index)
  }
  
  
  func addCharacter (character: Character) -> Bool {
    return team.addCharacter(character: character)
    
  }
  
  
  
  
  
  func printCharacters() {
    print("\(getCharacter(at: 0).name)"
      + "\n1 \(getCharacter(at: 1).name)"
      + "\n2 \(getCharacter(at: 2).name)")
    
  }
  
}

extension Player: CustomStringConvertible {
  var description: String {
    var message = ""
    
    for character in team.characters {
      message += "\n\(character.description)"
    }
    return message
  }
  
}
