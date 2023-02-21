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
	
	public func getSections() -> [Section] {
		sections
	}
	
	public func getSection(forIndex index: Int) -> Section {
		let i = min(index, sections.count - 1)
		return sections[i]
	}
	
	public func getTasksForSection(section: Section) -> [Task] {
		switch section {
		case .completed:
			return taskManager.getComletedTasks()
		case .uncompleted:
			return taskManager.getUncompletedTasks()
		}
	}
}
