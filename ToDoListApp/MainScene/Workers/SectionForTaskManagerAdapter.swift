//
//  TaskSectionsDelegate.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 16.02.2023.
//

import Foundation

/// Енам с секциями
enum Section: CaseIterable {
	case completed
	case uncompleted
	
	var title: String {
		switch self {
		case .completed:
			return "Completed"
		case .uncompleted:
			return "Uncompleted"
		}
	}
}

/// Протокол для адаптера менеджера задач
protocol ISectionForTaskManagerAdapter: AnyObject {
	/// Возвращает массив с секциями
	func getSections() -> [Section]
	/// Получить задачи для определнной секции
	func getTasksForSection(section: Section) -> [Task]
	/// Получить секцию по индексу
	func getSection(forIndex index: Int) -> Section
}

/// Адаптер для менеджера задач
final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	private let sections: [Section] = [.uncompleted, .completed]
	private let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Возвращает массив с секциями
	public func getSections() -> [Section] {
		sections
	}
	
	/// Получить секцию по индексу
	public func getSection(forIndex index: Int) -> Section {
		let i = min(index, sections.count - 1)
		return sections[i]
	}
	
	/// Получить задачи для определнной секции
	public func getTasksForSection(section: Section) -> [Task] {
		switch section {
		case .completed:
			return taskManager.getComletedTasks()
		case .uncompleted:
			return taskManager.getUncompletedTasks()
		}
	}
}
