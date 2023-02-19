//
//  ITaskManager.swift
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
