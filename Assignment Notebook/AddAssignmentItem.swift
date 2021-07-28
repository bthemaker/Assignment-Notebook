//
//  AddAssignmentItem.swift
//  Assignment Notebook
//
//  Created by Bruno Garcia on 7/28/21.
//

import SwiftUI

struct AddAssignmentItem: View {
    
    @ObservedObject var assignmentsDue = AssignmentsDue()
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    
    static let priorities = ["High", "Medium", "Low"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) { priority in
                        Text(priority)
                    }
                }
                TextField("Description", text: $description)
                
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                
            }
            .navigationBarTitle("Add New Assignment Item", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if priority.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), priority: priority,
                                        description: description, dueDate: dueDate)
                    assignmentsDue.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                    
                }
                
            })
        }
    }
}

struct AddAssignmentItem_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentItem(assignmentsDue: AssignmentsDue())
    }
}
