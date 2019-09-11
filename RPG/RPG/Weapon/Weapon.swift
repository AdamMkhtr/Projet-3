import Foundation





class Weapon {
  var name : String
  private(set) var damage: Int
  init (name: String, damage: Int) {
    self.name = name
    self.damage = damage
  }
}
