import Foundation








class Team {
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  

  private let maxcharaters = 3
  
  
  var characters = [Character]()
  
  
  var isFull: Bool{
    return characters.count == maxcharaters
  }
  
  var isAllCharacterDead: Bool {
    for character in characters {
      if character.isALive {
        return false
      }
    }
    return true
  }
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------
  

  
  func addCharacter (character: Character) -> Bool {
    guard isFull == false else {
      return false
    }
    characters.append(character)
    return true
  }
  
  func getCharacter(at index: Int) -> Character {
    return characters[index]
  }



}
