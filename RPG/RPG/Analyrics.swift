import Foundation






class Analytics {
  
  var countRound = 0
  
  func addRound() {
  countRound += 1
  }
  
  func endStats() {
    
  }
  
  
  
  
}
extension Analytics: CustomStringConvertible {
  var description: String {
    return String(countRound)
  }
}

