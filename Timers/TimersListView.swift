import SwiftUI

struct TimersListView: View {
    var timers: [Timer] = [
        Timer(duration: 100)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(timers) { timer in
                    Text("\(timer.duration)")
                }
            }
            .navigationTitle("Timers")
            .toolbar {
                ToolbarItem {
                    Button {
                        //noop
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
}

#Preview {
    TimersListView()
}
