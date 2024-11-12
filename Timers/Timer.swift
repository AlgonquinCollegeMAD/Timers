import SwiftUI

struct Timer: Identifiable {
    var id = UUID()
    var duration: TimeInterval
    var startTime = Date()
    var elapsed: TimeInterval {
        Date().timeIntervalSince(startTime)
    }
    var isRunning: Bool {
        elapsed < duration
    }
    var remaining: TimeInterval {
      max(0, duration - elapsed)
    }
}
