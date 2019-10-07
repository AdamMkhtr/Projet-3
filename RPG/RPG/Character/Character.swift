import Foundation


class Character {
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  /// Return 0 if life goes into negative and return 100 if life goes into more than 100.
  private var life: Int = 100{
    didSet {
      if life < 0 { life = 0 }
      if life > 100 { life = 100 }
    }
  }
  /// Check if the character is a live.
  var isALive: Bool { //ici
    guard life > 0 else {
      print("mort")
      return false
    }
    
    return true
  }
  
  /// Check if the character race is a healer.
  var isAHeal: Bool {
    return false
  }
  
  
  var weapon: Weapon
  private(set) var name : String
  
  init (name: String, weapon: Weapon) {
    self.name = name
    self.weapon = weapon
    
  }
  
  
  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------
  
  /// Inflicts damage if pv more than 0.
  func attack(receiver: Character) { //ici
    guard isALive else { print("Ce personnage est mort choisi en un autre.")
      return
    }
    receiver.life -= weapon.damage
  }
  
  
}

extension Character: CustomStringConvertible { // probleme ici
  var description: String {
    return "Nom: " + name + "\n" + "Arme:" + weapon.name + "\n" + "Vie: " + String(life)
  }
}

