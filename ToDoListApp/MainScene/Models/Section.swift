//
//  Task.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 12.02.2023.
//

import Foundation

/// Модель задачи
class Task: Equatable {
	static func == (lhs: Task, rhs: Task) -> Bool {
		return lhs.id == lhs.id && lhs.completed == rhs.completed && lhs.title == rhs.title
	}
	
	var id: Int = 0
	var title: String? = nil
	var completed: Bool = false
	
	init(id: Int, title: String, completed: Bool) {
		self.id = id
		self.title = title
		self.completed = completed
	}
}

/// Модель обычной задачи
final class RegularTask: Task {}

/// Модель важной задачи
final class ImportantTask: Task {
	
	let priority: Priority
	var completionDate: Date? {
		switch priority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: Date())
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: Date())
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: Date())
		}
	}
	
	init(id: Int, title: String, completed: Bool, priority: Priority) {
		self.priority = priority
		super.init(id: id, title: title, completed: completed)
	}
}

enum Priority: Int {
	case low
	case medium
	case high
}
