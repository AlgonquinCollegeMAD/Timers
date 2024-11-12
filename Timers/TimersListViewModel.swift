import SwiftUI

class TimersListViewModel: ObservableObject {
  @Published var timers: [Timer] = []
  
  init() {
    timers = [
      Timer(duration: 100),
      Timer(duration: 3900)
    ]
    startTicking()
  }
  
  func addNew(_ timer: Timer) {
    timers.append(timer)
  }
  
  private func startTicking() {
    Task {
      await tickLoop()
    }
  }
  
  @MainActor
  private func tick() {
    timers = timers
    print("Tick at \(Date())")
  }
  
  private func tickLoop() async {
    while true {
      await tick()
      // Wait for 1 second before the next tick
      try? await Task.sleep(nanoseconds: 1_000_000_000)
    }
  }
}
