import Foundation






class Analytics {
  
  private var countRound = 0
  
  /// Count numbers of round.
  func addRound() {
  countRound += 1
  }
  
  /// Print statistics
  func endStats(player: Player) {
    print("\(countRound)")
    print("\(player.description)")
    
  }
  
  
  
  
}
extension Analytics: CustomStringConvertible {
  var description: String {
    return String(countRound)
  }
}

