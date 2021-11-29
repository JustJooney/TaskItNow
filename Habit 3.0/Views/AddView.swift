//
//  SwiftUIView.swift
//  Habit 3.0
//
//  Created by Joon Kang on 11/28/21.
//

import SwiftUI

struct AddView: View {
    
    @Binding var shouldShowModel: Bool
    
    var body: some View {
        
        List {
            VStack {
                Button {
                    shouldShowModel.toggle()
                } label: {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .environment(\.colorScheme, .dark)

    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(shouldShowModel: .constant(true))
    }
}
