import SwiftUI

struct TimerView: View {
    
    @State var hours: TimeInterval = 0
    @State var minutes: TimeInterval = 0
    @State var seconds: TimeInterval = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Timers")
                
                //Pickers
                HStack {
                    Picker(selection: $hours, label: Text("Hours")) {
                        ForEach(0..<24) { hour in
                            Text("\(hour)")
                        }
                    }
                    .pickerStyle(.wheel)
                    Text("hours")

                    Picker(selection: $minutes, label: Text("Minutes")) {
                        ForEach(0..<60) { min in
                            Text("\(min)")
                        }
                    }
                    .pickerStyle(.wheel)
                    Text("hours")

                    Picker(selection: $seconds, label: Text("Seconds")) {
                        ForEach(0..<60) { sec in
                            Text("\(sec)")
                        }
                    }
                    .pickerStyle(.wheel)
                    Text("hours")
                }
                .padding()
                
                //Presets
                HStack {
                    Button {
                        //noop
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
                        //noop
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
                        //noop
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
                        //noop
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
                       //noop
                    } label: {
                        Text("Start")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                       //noop
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
        
    }
}

#Preview {
    TimerView()
}
