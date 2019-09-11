import Foundation






class Vault {
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  
  let attackVault = [BluntAxe(),ClassictAxe(),LegendaryAxe(),DamagedBow(),
                     ClassicdBow(),LegendarydBow(),BluntSword(),ClassicSword(),
                     LegendarySword()]
  
  
  let healVault = [DamagedWand(),ClassicdWand(),GreatWand(),LegendaryWand()]
  
  let rand = [1,2,3,4]
  
  
  var player = Player()
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------
  
  
  
  func randVaultAttack (character: Character) {
    
    let randomLoot = Int(arc4random_uniform(UInt32(rand.count)))
    let resultRand = rand[randomLoot]
    
    if resultRand == 1 {
      let randomAttackVault = Int(arc4random_uniform(UInt32(attackVault.count)))
      let lootAttack = attackVault[randomAttackVault]
      
      print("Un coffre est tombé il contient \(lootAttack) veux tu l'équiper ?"
        + "\n1. Oui"
        + "\n1. Non")
      
      
      if let line = readLine() {
        
        switch line {
          
        case "1":
          character.weapon = lootAttack
          
        case "2":
          return
          
          
        default:
          print("Je n'ai pas compris")
        }
      }
      
    }
    
  }
  
  
  
  
  func randVaultHeal (character: Character) {
    
    let randomLoot = Int(arc4random_uniform(UInt32(rand.count)))
    let resultRand = rand[randomLoot]
    
    if resultRand == 1 {
      let randomHealVault = Int(arc4random_uniform(UInt32(healVault.count)))
      let lootHeal = healVault[randomHealVault]
      
      print("Un coffre est tombé il contient \(lootHeal) veux tu l'équiper ?"
        + "\n1. Oui"
        + "\n1. Non")
      
      
      if let line = readLine() {
        
        switch line {
          
        case "1":
          character.weapon = lootHeal
          
        case "2":
          return
          
          
        default:
          print("Je n'ai pas compris")
        }
      }
      
    }
    
  }
  
}

