
import Foundation







class Game {
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  
  
  var playerOne = Player()
  
  var playerTwo = Player()
  
  var isPlayerOnePlaying = true
  
  var stats = Analytics()
  
  var vault = Vault()
  

  
  //----------------------------------------------------------------------------
  // MARK: - Mehtods
  //----------------------------------------------------------------------------
  
  
  func whoWin() {
    if playerOne.isAllCharacterDead {
      print("Le Joueur 2 a gagné la partie")
    }
    else {
      print("Le Joueur 1 a gagné la partie")
    }
  }
  
  func textSelectCharacter ()  {
    print("Choisissez un personnage"
      + "\n1. Nain"
      + "\n2. Elf"
      + "\n3. Orc"
      + "\n4. Gnome)")
  }
  
  
  
  func addNain (player: Player, name: String) -> Bool {
    let nain = Nain(name: name)
    return player.addCharacter(character: nain)
  }
  
  
  
  func addElf (player: Player,name: String) -> Bool {
    let elf = Elf(name: name)
    return player.addCharacter(character: elf)
  }
  
  func addOrc (player: Player, name: String) -> Bool {
    let orc = Elf(name: name)
    return player.addCharacter(character: orc)
  }
  
  func addGnome (player: Player, name: String) -> Bool {
    let gnome = Elf(name: name)
    return player.addCharacter(character: gnome)
  }
  
  
  
  
  
  
  
  func chooseName() -> String {
    
    var name: String?
    
    while name == nil {
      print("Donner un nom à votre personnage") 
      if let result = readLine() {
        name = result
      }else {
        print("je n'ai pas compris")
      }
    }
    
    return name ?? "Inconnu"
  }
  
  
  
  
  func selectCharcter(for player: Player) {
    
    textSelectCharacter()
    
    if let choice = readLine() {
      var result = false
      let name = chooseName()
      switch choice {
        
      case "1":
        result = addNain(player: player, name: name)
        
      case "2":
        result = addElf(player: player, name: name)
        
      case "3":
        result = addOrc(player: player, name: name)
        
      case "4":
        result = addGnome(player: player, name: name)
        
      default:
        print("Je n'ai pas compris")
      }
      if result == false {
        print("equipe full")
      }
    }
  }
  
  
  
  
  func setupPlayers() {
    
    
    while !playerOne.isFull {
      selectCharcter(for: playerOne)
    }
    while !playerTwo.isFull {
      selectCharcter(for: playerTwo)
    }
    
  }
  
  
  
  func fightPlayer(attacker: Player, receiver: Player) {
    
    print("Séléctionne ton attaquant")
    
    attacker.printCharacters()
    
    let attackerPlayerIndex = askCharacterIndex()
    
    
    let attackerCharacter =
      attacker.getCharacter(at: attackerPlayerIndex)
    
    
    if attackerCharacter.isAHeal == true {
      
      vault.randVaultHeal(character: attackerCharacter) //ici
      
      print("Séléctionne qui heal")
      attacker.printCharacters()
      
      let allyCharacterIndex = askCharacterIndex()
      
      let allyCharacter =
        attacker.getCharacter(at: allyCharacterIndex)
      attackerCharacter.attack(receiver: allyCharacter)
    }
    else {
      
      vault.randVaultAttack(character: attackerCharacter) //ici
      
      print("Séléctionne ton receiver")
      receiver.printCharacters()
      
      let receiverCharacterIndex = askCharacterIndex()
      
      let receiverCharacter =
        receiver.getCharacter(at: receiverCharacterIndex)
      attackerCharacter.attack(receiver: receiverCharacter)
    }
    stats.addRound()
  }
  
  
  func fight() {
    while !playerOne.isAllCharacterDead && !playerTwo.isAllCharacterDead{
      if isPlayerOnePlaying {
        fightPlayer(attacker: playerOne, receiver: playerTwo)
        
      } else {
        fightPlayer(attacker: playerTwo, receiver: playerOne)
      }
      isPlayerOnePlaying.toggle()
    }
    endGame() //ici
  }
  
  
  func askCharacterIndex () -> Int {
    guard let line = readLine(),
      let number = Int(line),
      number <= 3 else {
        print("Je n'ai pas réussis")
        return  1
        
    }
    return number
    
  }
  
  func endGame () {
    print(stats.description)
    whoWin()
    
  }
  
  
  
  
  
}



