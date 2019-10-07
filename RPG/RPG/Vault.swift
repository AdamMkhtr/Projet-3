import Foundation






class Vault {
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  
  let attackVault = [BluntAxe(),ClassictAxe(),LegendaryAxe(),DamagedBow(),
                     ClassicdBow(),LegendarydBow(),BluntSword(),ClassicSword(),
                     LegendarySword()]
  
  
  let healVault = [DamagedWand(),ClassicdWand(),GreatWand(),LegendaryWand()]
  
  var canChangeWeapon: Bool {
    let randomNumber = Int.random(in: 0...4)
    return randomNumber == 1
  }
  
  
  var player = Player()
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------
  
  
  
   private func takeRandomWeapon (from weapons: [Weapon]) -> Weapon {
    let range = 0..<weapons.count
    let randomIndex = Int.random(in: range)
    return weapons[randomIndex]
  }
  
  private func askIfWeaponIsAccepted(weapon: Weapon) -> Bool {
    let message = "Un coffre est tombé il contient \(weapon.name) veux "
      + "tu  l'équiper ?\n1. Oui\n2. Non"
    
    var choice = ""
    
    repeat {
      print(message)
      choice = readLine() ?? ""
      if (choice != "1" && choice != "2") {
        print("Veuillez choisir un nombre en 1 et 2.")
      }
    } while (choice != "1" && choice != "2")
    
    if choice == "1" {
      return true
    } else {
      return false
    }

  }
  
  private func changeWeaponIfAccepted(character: Character, weapon: Weapon) {
    let shouldChangeWeapon = askIfWeaponIsAccepted(weapon: weapon)
    if shouldChangeWeapon {
      character.weapon = weapon
    }
  }
  
  func randVaultAttack(character: Character) {
    guard canChangeWeapon == true else { return }
    let weapon = takeRandomWeapon(from: attackVault)
    changeWeaponIfAccepted(character: character, weapon: weapon)
  }
  
  func randVaultHeal (character: Character) {
    guard canChangeWeapon == true else { return }
    let weapon = takeRandomWeapon(from: healVault)
    changeWeaponIfAccepted(character: character, weapon: weapon)
  }

  
  

  
}

