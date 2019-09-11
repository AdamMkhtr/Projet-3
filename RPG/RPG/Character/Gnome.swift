import Foundation





class Gnome: Character {
  init(name: String) {
    super.init(name: name, weapon: DamagedWand())
  }
  
  override var isAHeal: Bool {
    return true
  }
  
}
