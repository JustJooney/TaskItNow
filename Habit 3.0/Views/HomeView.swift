//
//  HomeView.swift
//  Habit 3.0
//
//  Created by Joon Kang on 11/28/21.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "taskName", ascending: true)]) var tasks: FetchedResults<Task>
    
    @Binding var shouldShowModel: Bool
    @Binding var isLightMode: Bool
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Section() {
                    ForEach(tasks, id:\.self) {task in
                        
                        Text(task.taskName ?? "")
                            .font(.title2)

                    }
                    .onDelete(perform: removeItem)
                } header: {
                    Text("Tasks")
                        .foregroundColor(isLightMode ? .blue : .yellow)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("\(Date().formatted(.dateTime.day().month().year()))")
        }
        .environment(\.colorScheme, isLightMode ? .light : .dark)
    }
    
    func removeItem(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            PersistenceController.shared.delete(task)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(shouldShowModel: .constant(true), isLightMode: .constant(false))
    }
}
