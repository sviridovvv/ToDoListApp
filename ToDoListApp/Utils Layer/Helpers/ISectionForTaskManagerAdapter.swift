//
//  ITaskSectionsDelegate.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 16.02.2023.
//

import Foundation

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
