//
//  ITaskFiller.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 15.02.2023.
//

/// Протокол для репозитория
protocol ITaskRepository: AnyObject {
	/// Добавляет массив предустановленных задач
	func getTasks() -> [Task]
}
