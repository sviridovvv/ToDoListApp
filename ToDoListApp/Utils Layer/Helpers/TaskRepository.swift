//
//  TaskFiller.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 15.02.2023.
//

import Foundation

/// Репозиторий с задачами
final class TaskRepository: ITaskRepository {
	private var tasks: [Task] = [
		RegularTask(id: 0, title: "Sleep", completed: false),
		ImportantTask(id: 9, title: "Code to code", completed: true, priority: .high),
		RegularTask(id: 1, title: "Waling out", completed: false),
		ImportantTask(id: 6, title: "Sing a song", completed: true, priority: .low),
		RegularTask(id: 2, title: "Laugh", completed: true),
		ImportantTask(id: 8, title: "Reapir a car", completed: true, priority: .medium),
		RegularTask(id: 3, title: "Go to bed", completed: false),
		ImportantTask(id: 7, title: "Clap your hands", completed: false, priority: .low),
		RegularTask(id: 4, title: "Play gutar", completed: true),
		ImportantTask(id: 5, title: "Buy food", completed: true, priority: .high),
	]
	
	/// Добавляет массив предустановленных задач
	public func getTasks() -> [Task] {
		tasks
	}
}
