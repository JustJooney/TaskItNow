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
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Section() {
                    
                    ForEach(tasks, id:\.self) {task in
                        HStack {
                            
                            Text(task.taskName ?? "")
                                .font(.title2)
                            
                        }
                        .onLongPressGesture {
                            task.isComplete = true
                        }
                    }
                    .onDelete(perform: removeItem)
                } header: {
                    Text("Tasks")
                        .foregroundColor(.yellow)
                }
            }
            .listStyle(.plain)
            .statusBar(hidden: true)
            .navigationTitle("\(Date().formatted(.dateTime.day().month().year()))")
            .animation(.spring(), value: 0)
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
