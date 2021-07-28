//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Bruno Garcia on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentsDue = AssignmentsDue()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentsDue.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.description)
                                .font(.headline)
                            Text(item.course)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                    
                }
                .onMove(perform: { indices, newOffset in assignmentsDue.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentsDue.items.remove(atOffsets: indexSet)
                })
                
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddAssignmentItem(assignmentsDue: assignmentsDue)
            })
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddItemView = true}) {
                                    Image(systemName: "plus")
                                    
                                })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct AssignmentItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var course = String()
    
    var dueDate = Date()
}
