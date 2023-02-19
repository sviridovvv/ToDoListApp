//
//  TaskSectionsDelegate.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 16.02.2023.
//

import Foundation

/// Адаптер для менеджера задач
final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	private let countOfSections = 2
	private let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Возвращает массив секций с необходимыми данными для построения секций и ячеек
	public func getSectionsData() -> [Section] {
		var section: [Section] = []
		
		for index in 0..<countOfSections {
			switch index {
			case 0:
				let tasks = taskManager.getUncompletedTasks()
				section.append(Section(id: index, title: tasks.isEmpty ? "" : "Uncompleted Tasks",cells: tasks))
			case 1:
				let tasks = taskManager.getComletedTasks()
				section.append(Section(id: index, title: tasks.isEmpty ? "" : "Completed Tasks", cells: tasks))
			default:
				break
			}
		}
		return section
	}
}
