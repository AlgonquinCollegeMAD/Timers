import SwiftUI

class TimersListViewModel: ObservableObject {
  @Published var timers: [Timer] = []
  
  init() {
    timers = [
      Timer(duration: 100),
      Timer(duration: 3900)
    ]
  }
  
  func addNew(_ timer: Timer) {
    timers.append(timer)
  }
}
