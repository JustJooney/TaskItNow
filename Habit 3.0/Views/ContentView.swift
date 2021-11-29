//
//  ContentView.swift
//  Habit 3.0
//
//  Created by Joon Kang on 11/28/21.
//

import SwiftUI


struct ContentView: View {
    
    @State var shouldShowModel = false
    @State private var selectedIndex = 0
    var tabIconArray = ["checkmark", "calendar", "gearshape.fill"]
    var tabNameArray = ["Task", "Progress", "Setting"]
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                
                // this opens a new screen for the user to add a new task
                Spacer().fullScreenCover(isPresented: $shouldShowModel) {
                    AddView(shouldShowModel: $shouldShowModel)
                }
                
                switch selectedIndex {
                    
                case 0 :
                    HomeView(shouldShowModel: $shouldShowModel)
                case 1:
                    ScrollView {
                        Text("Second View")
                    }
                case 2:
                    ScrollView {
                        Text("Hello")
                    }
                default:
                    HomeView(shouldShowModel: $shouldShowModel)
                }
            }

            Divider()
                .padding(.bottom, 1)
                .background(.yellow)
            
            HStack {
                ForEach(0..<3) { num in
                    Button {
                        selectedIndex = num
                    } label: {
                        Spacer()
                        VStack {
                            Image(systemName: tabIconArray[num])
                                .font(.system(size: 25))
                                .foregroundColor(selectedIndex == num ? .yellow : .white)
                            Text("\(tabNameArray[num])")
                                .font(.system(size:16, weight: .bold))
                                .foregroundColor(selectedIndex == num ? .yellow : .white)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
            }
            .background(.black)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
