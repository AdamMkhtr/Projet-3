import Foundation








class Player {
  
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  

  private var team = Team()
  
  
  
  var isFull: Bool {
    return team.isFull
  }
  /// Return true if all characters are dead, false otherwise.
  var isAllCharacterDead: Bool {
    return team.isAllCharacterDead
  }
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------
  

  func getCharacter(at index: Int) -> Character {
    return team.getCharacter(at: index)
  }
  
  
  func addCharacter (character: Character) -> Bool {
    return team.addCharacter(character: character)
    
  }
  
  
  
  
  
  func printCharacters() {
    print("1 \(getCharacter(at: 0).name)"
      + "\n2 \(getCharacter(at: 1).name)"
      + "\n3 \(getCharacter(at: 2).name)")
    
  }
  
  // dans character ouvrir un tableau pour name 
  func isNameAlreadyInTeam(name: String) -> Bool {
   let isNameinTeam = team.characters.contains {$0.name == name}
    return isNameinTeam
  }
  
  
}

extension Player: CustomStringConvertible {
  var description: String {
    var message = ""
    
    for character in team.characters.description {
      message += "\n\(character.description)"
    }
    return message
  }
  
}
