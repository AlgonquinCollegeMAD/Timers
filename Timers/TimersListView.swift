import SwiftUI

struct TimersListView: View {  
  @State private var isPresented = false
  @ObservedObject var model = TimersListViewModel()
  
  func formatDuration(_ duration: TimeInterval) -> String {
    let Formatter = DateComponentsFormatter()
    Formatter.allowedUnits = [.hour, .minute, .second]
    Formatter.zeroFormattingBehavior = .dropLeading
    return Formatter.string(from: duration) ?? "0s"
  }
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(model.timers) { timer in
          Text(formatDuration(timer.remaining))
        }
      }
      .navigationTitle("Timers")
      .toolbar {
        ToolbarItem {
          Button {
            isPresented.toggle()
          } label: {
            Text("Add")
          }
        }
      }
      .sheet(isPresented: $isPresented) {
        TimerView(shouldClose: $isPresented)
      }
    }
    .environmentObject(model)
  }
}

#Preview {
  TimersListView()
}
