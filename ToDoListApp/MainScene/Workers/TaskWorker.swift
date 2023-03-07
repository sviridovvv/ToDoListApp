//
//  ITaskFacade.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import Foundation

/// Протокол для воркера задач
protocol ITaskWorker: AnyObject {
	func setupTaskManager()
}

/// Реализация воркера задач
final class TaskWorker: ITaskWorker {
	
	private var repository: ITaskRepository!
	private var taskManager: ITaskManager!
	
	required init(repository: ITaskRepository, taskManager: ITaskManager) {
		self.repository = repository
		self.taskManager = taskManager
	}
	
	/// Получаем данные из репозитория и добавляем их в менеджер задач
	public func setupTaskManager() {
		taskManager.addTasks(tasks: repository.getTasks())
	}
}
