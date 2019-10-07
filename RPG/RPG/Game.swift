
import Foundation







class Game {
  
  
  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------
  
  
  
  private var playerOne = Player()
  
  private var playerTwo = Player()
  
  private var isPlayerOnePlaying = true
  
  private var stats = Analytics()
  
  private var vault = Vault()
  
  private let minSelectionCharacterIndex = 1
  private let maxSelectionCharacterIndex = 3
  
  
  //----------------------------------------------------------------------------
  // MARK: - Mehtods
  //----------------------------------------------------------------------------
  
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - ADD CHARACTER TEAM
  //----------------------------------------------------------------------------
  
  
  
  /// text in select character.
  func textSelectCharacter ()  {
    print("Choisissez un personnage"
      + "\n1. Nain"
      + "\n2. Elf"
      + "\n3. Orc"
      + "\n4. Gnome")
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
  
  
  
  
  /// Return name for character or "Incconu" if error.
  func chooseName() -> String {
    var choice = ""
    
    repeat {
      
      print("Donne un nom à ton personnage")
      
      choice = readLine() ?? ""
      
      if (choice == "" ) {
        print("J'ai besoin d'un nom")
      }
    } while (choice.isEmpty || playerOne.isNameAlreadyInTeam(name: choice) || playerTwo.isNameAlreadyInTeam(name: choice))
    return choice
  }
  
  
  
  
  ///  Select race and name for the characters return "team full" if team is full.
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
        print("L'équipe est complète")
      }
    }
    print("")
  }
  
  
  
  
  /// Select character for player One and when is full swith to player two.
  func setupPlayers() {
    
    
    while !playerOne.isFull {
      print("Joeur 1 : ")
      selectCharcter(for: playerOne)
    }
    while !playerTwo.isFull {
      print("Joeur 2: ")
      selectCharcter(for: playerTwo)
    }
    
  }
  
  
  
  //----------------------------------------------------------------------------
  // MARK: - FIGHT
  //----------------------------------------------------------------------------
  
  
  /// Print player one win if player two have all character dead otherwise player two win.
  func whoWin() {
    if playerOne.isAllCharacterDead {
      print("Le Joueur 2 a gagné la partie")
    }
    else {
      print("Le Joueur 1 a gagné la partie")
    }
  }
  
  
  
  
  /// Select your character for attack or heal and select who heal or who attack.
  func fightPlayer(attacker: Player, receiver: Player) {
    
    var receiverCharacter : Character
    var allyCharacter: Character
    var attackerCharacter: Character
    repeat {
      print("Séléctionne ton attaquant")
      
      attacker.printCharacters()
      
      let attackerPlayerIndex = askCharacterIndex()
      
      
      attackerCharacter =
        attacker.getCharacter(at: attackerPlayerIndex)
    }while !attackerCharacter.isALive
    
    
    
    if attackerCharacter.isAHeal == true {
      
      vault.randVaultHeal(character: attackerCharacter)
      
      print("Séléctionne qui heal")
      attacker.printCharacters()
      repeat {
        let allyCharacterIndex = askCharacterIndex()
        
        allyCharacter =
          attacker.getCharacter(at: allyCharacterIndex)
        
        attackerCharacter.attack(receiver: allyCharacter)
      }while !allyCharacter.isALive
    }
    else {
      
      vault.randVaultAttack(character: attackerCharacter)
      repeat {
        print("Séléctionne ton receiver")
        receiver.printCharacters()
        
        let receiverCharacterIndex = askCharacterIndex()
        
        receiverCharacter =
          receiver.getCharacter(at: receiverCharacterIndex)
        
        attackerCharacter.attack(receiver: receiverCharacter)
      }while !receiverCharacter.isALive
    }
    
    stats.addRound()
  }
  
  
  
  
  /// Player one fight then player two fight until one team is all character dead.
  func fight() {
    while !playerOne.isAllCharacterDead || !playerTwo.isAllCharacterDead{// ici
      if isPlayerOnePlaying {
        print("Joueur 1:")
        fightPlayer(attacker: playerOne, receiver: playerTwo)
        
      } else {
        print("Joueur 2:")
        fightPlayer(attacker: playerTwo, receiver: playerOne)
      }
      isPlayerOnePlaying.toggle()
    }
    print("")
    endGame() 
  }
  
  
  
  
  /// Guard select character 1,2 or 3.
  private func isCharacterIndexInBounds(index: Int) -> Bool {
    return
      index >= minSelectionCharacterIndex && index <= maxSelectionCharacterIndex
  }
  
  
  
  func askCharacterIndex () -> Int {
    var index: Int
    
    let message = "Veuillez choisir un nombre en 1 et 3."
    print(message)
    
    repeat {
      let line = readLine() ?? ""
      index = Int(line) ?? minSelectionCharacterIndex - 1
      if (!isCharacterIndexInBounds(index: index)) {
        print(message)
      }
    } while (!isCharacterIndexInBounds(index: index))
    
    return index - 1
  }
  
  
  
  /// Print statistics of the game (Who win ? count of round ...).
  func endGame () {
    print(stats.description)
    whoWin()
    
  }
  
  func Start() {
    setupPlayers()
    fight()
  }
  
  
  
}

