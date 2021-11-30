//
//  ContentView.swift
//  Habit 3.0
//
//  Created by Joon Kang on 11/28/21.
//

import SwiftUI


struct ContentView: View {
    
    @State var shouldShowModel = false
    @State var isLightMode = false
    @State private var selectedIndex = 0
    var tabIconArray = ["checkmark", "plus"]
    var tabNameArray = ["Task", "Add"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                
                // this opens a new screen for the user to add a new task
                Spacer().sheet(isPresented: $shouldShowModel) {
                    AddView(shouldShowModel: $shouldShowModel, isLightMode: $isLightMode)
                }
                
                HomeView(shouldShowModel: $shouldShowModel, isLightMode: $isLightMode)
                
            }
            
            Divider()
                .padding(.bottom, 1)
                .background(isLightMode ? .blue : .yellow)
            
            HStack {
                Button {
                    shouldShowModel.toggle()
                } label: {
                    Spacer()
                    VStack {
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .foregroundColor(isLightMode ? .black : .white)
                        Text("Add")
                            .font(.system(size:16, weight: .bold))
                            .foregroundColor(isLightMode ? .black : .white)
                    }
                    Spacer()
                }
                .padding(.vertical, 5)
                Button {
                    isLightMode.toggle()
                } label: {
                    Spacer()
                    VStack {
                        Image(systemName: "\(isLightMode ? "moon.fill" : "sun.max.fill")")
                            .font(.system(size: 25))
                            .foregroundColor(isLightMode ? .black : .white)
                        Text("\(isLightMode ? "Dark Mode" : "Light Mode")")
                            .font(.system(size:16, weight: .bold))
                            .foregroundColor(isLightMode ? .black : .white)
                    }
                    Spacer()
                }
            }
            .background(isLightMode ? .white : .black)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
