import Foundation








class Team {


//----------------------------------------------------------------------------
// MARK: - Properties
//----------------------------------------------------------------------------

/// Determine the maximum of charcter un player team.
private let maxcharaters = 3


var characters = [Character]()

/// Check if the team is full.
var isFull: Bool{
  return characters.count == maxcharaters
}
/// return true if all character in team is dead otherwise return false.
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


/// Return true if the team is not full and add one character une the team otherwise return false.
func addCharacter (character: Character) -> Bool {
  guard isFull == false else {
    return false
  }
  characters.append(character)
  return true
}
/// Picked a character in the Team (Array)
func getCharacter(at index: Int) -> Character {
  return characters[index]
}



}
