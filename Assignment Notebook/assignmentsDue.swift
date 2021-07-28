//
//  AssignmentsDue.swift
//  Assignment Notebook
//
//  Created by Bruno Garcia on 7/28/21.
//

import Foundation

class AssignmentsDue: ObservableObject {
    @Published var items = [AssignmentItem(description: "Math Homework", course: "Math", dueDate: Date()),
                            AssignmentItem(description: "Science Homework", course: "Science", dueDate: Date()),
                            AssignmentItem(description: "History Homework", course: "History", dueDate: Date())]

}
