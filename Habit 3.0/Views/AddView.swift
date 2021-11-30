//
//  SwiftUIView.swift
//  Habit 3.0
//
//  Created by Joon Kang on 11/28/21.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    @Binding var shouldShowModel: Bool
    @Binding var isLightMode: Bool
    @State private var isAlertTriggered = false
    @State var taskName: String = ""
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    TextField("'Make the bed'", text: $taskName)
                        .font(.title2)
                        .padding(.vertical, 4)
                    
                } header: {
                    
                    Text("Task Name")
                        .foregroundColor(isLightMode ? .blue : .yellow)
                }
            }
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        shouldShowModel.toggle()
                    } label: {
                        Text("Cancel")
                            .font(.title2)
                            .foregroundColor(.red)
                    }

                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        addTask()
                        shouldShowModel.toggle()
                    } label: {
                        Text("Done")
                            .font(.title2)
                            .foregroundColor(taskName.isEmpty ? .gray : isLightMode ? .blue : .yellow)
                    }
                    .disabled(taskName.isEmpty)
                }
            }
        }
        .environment(\.colorScheme, isLightMode ? .light : .dark)
        
        
    }
    
    func addTask(){
        
        let task = Task(context: managedObjectContext)
        task.taskName = taskName
        PersistenceController.shared.save()
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(shouldShowModel: .constant(true), isLightMode: .constant(false))
    }
}
