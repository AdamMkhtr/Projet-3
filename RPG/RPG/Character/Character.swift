import Foundation


class Character {
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  
  private var life: Int = 100{
    didSet {
      if life < 0 { life = 0 }
      if life > 100 { life = 100 }
    }
  }
  
  var isALive: Bool {
    return life > 0
  }
  
  
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
  

  func attack(receiver: Character) {
    guard isALive else {
      return 
    }
    receiver.life -= weapon.damage
  }
  
  
}

extension Character: CustomStringConvertible {
  var description: String {
    return "Nom: " + name + "\n" + "Arme:" + weapon.name + "\n" + "Vie: " + String(life)
  }
}

