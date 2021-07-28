//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Bruno Garcia on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var assignments = ["Assignment 1","Assignment 2","Assignment 3","Assignment 4",]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignments, id: \.self) { assignment in
                    Text(assignment)
                }
                .onMove(perform: { indices, newOffset in assignments.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignments.remove(atOffsets: indexSet)
                })
                
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
