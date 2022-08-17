//
//  TaskViewModel.swift
//  Task Manager
//
//  Created by Byron Mejia on 8/12/22.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: Tab = .today
    
    // MARK: New Task Properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = CustomColor.yellow.rawValue
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = TaskType.basic.rawValue
    @Published var showDatePicker: Bool = false
    @Published var editTask: Task?
    
    func addTask(context: NSManagedObjectContext) -> Bool {
        var task: Task!
        if let editTask = editTask {
            task = editTask
        } else {
            task = Task(context: context)
        }
        
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetTaskData() {
        taskType = TaskType.basic.rawValue
        taskColor = CustomColor.yellow.rawValue
        taskTitle = ""
        taskDeadline = Date()
    }
    
    func setupTask() {
        if let editTask = editTask {
            taskType = editTask.type ?? TaskType.basic.rawValue
            taskColor = editTask.color ?? CustomColor.yellow.rawValue
            taskTitle = editTask.title ?? ""
            taskDeadline = editTask.deadline ?? Date()
        }
    }
}
