//
//  TaskViewModel.swift
//  Task Manager
//
//  Created by Byron Mejia on 8/12/22.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
}
