//
//  TaskSectionsDelegate.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 16.02.2023.
//

import Foundation

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
	
	/// Получить задачи для определнной секции
	public func getSection(forIndex index: Int) -> Section {
		let i = min(index, sections.count - 1)
		return sections[i]
	}
	
	/// Получить секцию по индексу
	public func getTasksForSection(section: Section) -> [Task] {
		switch section {
		case .completed:
			return taskManager.getComletedTasks()
		case .uncompleted:
			return taskManager.getUncompletedTasks()
		}
	}
}
