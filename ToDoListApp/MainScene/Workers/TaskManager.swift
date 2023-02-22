//
//  TaskManager.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 12.02.2023.
//

import Foundation

/// Протокол для менеджера задач
protocol ITaskManager: AnyObject {
	/// Получить все задания
	func getAllTasks() -> [Task]
	/// Показать все заверешенные задачи
	func getComletedTasks() -> [Task]
	/// Показать все незаверешнные задачи
	func getUncompletedTasks() -> [Task]
	/// Добавить задачу
	func addTask(task: Task)
	/// Добавить массив задач
	func addTasks(tasks: [Task])
	/// Удалить задачу
	func deleteTask(task: Task)
}

/// Менеджер задач
final class TaskManager: ITaskManager {
	private var tasks: [Task] = []
	
	/// Получить все задачи
	public func getAllTasks() -> [Task] {
		tasks
	}
	
	/// Показать все заверешенные задачи
	public func getComletedTasks() -> [Task] {
		tasks.filter { $0.completed == true }
	}
	
	/// Показать все незаверешнные задачи
	public func getUncompletedTasks() -> [Task] {
		tasks.filter { $0.completed == false }
	}
	
	/// Добавить задачу
	public func addTask(task: Task) {
		tasks.append(task)
	}
	
	/// Добавить массив задач
	public func addTasks(tasks: [Task]) {
		self.tasks.append(contentsOf: tasks)
	}
	
	/// Удалить задачу
	public func deleteTask(task: Task) {
		tasks.removeAll { $0 == task }
	}
}
