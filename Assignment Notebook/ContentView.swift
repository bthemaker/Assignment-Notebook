//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Bruno Garcia on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentsDue = AssignmentsDue()
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentsDue.assignments) { assignment in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(assignment.description)
                                .font(.headline)
                            Text(assignment.course)
                        }
                        Spacer()
                        Text(assignment.dueDate, style: .date)
                    }
                    
                }
                .onMove(perform: { indices, newOffset in assignmentsDue.assignments.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentsDue.assignments.remove(atOffsets: indexSet)
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
struct AssignmentItem: Identifiable {
    var id = UUID()
    var description = String()
    var course = String()
    var dueDate = Date()
}
