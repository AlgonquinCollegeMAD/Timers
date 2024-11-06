import SwiftUI

struct TimersListView: View {  
  @State private var isPresented = true
  @ObservedObject var model = TimersListViewModel()
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(model.timers) { timer in
          Text("\(timer.duration)")
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
