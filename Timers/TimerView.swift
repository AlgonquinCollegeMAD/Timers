import SwiftUI

struct TimerView: View {
  
  @State var hours: TimeInterval = 0
  @State var minutes: TimeInterval = 0
  @State var seconds: TimeInterval = 0
  @Binding var shouldClose: Bool
  @EnvironmentObject var model: TimersListViewModel
  
  var body: some View {
    NavigationStack {
      VStack {
        Text("Timers")
        
        //Pickers
        HStack {
          Picker(selection: $hours, label: Text("Hours")) {
            ForEach(0..<24) { hour in
              Text("\(hour)").tag(TimeInterval(hour))
            }
          }
          .pickerStyle(.wheel)
          Text("hours")
          
          Picker(selection: $minutes, label: Text("Minutes")) {
            ForEach(0..<60) { min in
              Text("\(min)").tag(TimeInterval(min))
            }
          }
          .pickerStyle(.wheel)
          Text("min")
          
          Picker(selection: $seconds, label: Text("Seconds")) {
            ForEach(0..<60) { sec in
              Text("\(sec)").tag(TimeInterval(sec))
            }
          }
          .pickerStyle(.wheel)
          Text("sec")
        }
        .padding()
        
        //Presets
        HStack {
          Button {
            model.addNew(Timer(duration: 60))
            shouldClose.toggle()
          } label: {
            VStack {
              Text("1")
              Text("min")
            }
            .foregroundStyle(Color.white)
            .frame(width: 50, height: 50)
            .padding()
            .background(Circle())
          }
          
          Button {
            model.addNew(Timer(duration: 2 * 60))
            shouldClose.toggle()
          } label: {
            VStack {
              Text("2")
              Text("min")
            }
            .foregroundStyle(Color.white)
            .frame(width: 50, height: 50)
            .padding()
            .background(Circle())
          }
          
          Button {
            model.addNew(Timer(duration: 3 * 60))
            shouldClose.toggle()
          } label: {
            VStack {
              Text("3")
              Text("min")
            }
            .foregroundStyle(Color.white)
            .frame(width: 50, height: 50)
            .padding()
            .background(Circle())
          }
          
          Button {
            model.addNew(Timer(duration: 5 * 60))
            shouldClose.toggle()
          } label: {
            VStack {
              Text("5")
              Text("min")
            }
            .foregroundStyle(Color.white)
            .frame(width: 50, height: 50)
            .padding()
            .background(Circle())
          }
          
        }
        
        Spacer()
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            model.addNew(Timer(duration: hours * 60 * 60 + minutes * 60 + seconds))
            shouldClose.toggle()
          } label: {
            Text("Start")
          }
        }
        
        ToolbarItem(placement: .topBarLeading) {
          Button {
            shouldClose.toggle()
          } label: {
            Text("Cancel")
          }
        }
      }
    }
    
  }
}

#Preview {
//  TimerView()
}
