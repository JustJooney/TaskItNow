//
//  HomeView.swift
//  Habit 3.0
//
//  Created by Joon Kang on 11/28/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: TimeOfDay.entity(), sortDescriptors: []) var timeOfDay: FetchedResults<TimeOfDay>
    
    @Binding var shouldShowModel: Bool
    
    var body: some View {
        
        
        NavigationView {
            
            GeometryReader { geometry in
                
                List {
                    Section() {

                        NavigationLink("Name of Habit", destination: HomeDetailView())

                    } header: {
                        
                        Text("Morning")
    
                    }
                    
                    
                    Section {
                        ForEach(0..<10, id:\.self){_ in
                            NavigationLink("I am a ForEach button", destination: HomeDetailView())
                        }
                    } header: {
                        Text("Afternoon")
                    }
                    
                    Section {
                        NavigationLink("Yup", destination: HomeDetailView())
                    } header: {
                        
                        Text("Evening")
                    }
                }
                .listStyle(.inset)
            }
            .navigationTitle("\(Date().formatted(.dateTime.day().month().year()))")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        print("Edit button has been pressed")
                    } label: {
                        Text("Edit")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }

                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        shouldShowModel.toggle()
                    } label: {
                        Text("Add")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }

                }
            }
        }
        
        .environment(\.colorScheme, .dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(shouldShowModel: .constant(true))
    }
}
