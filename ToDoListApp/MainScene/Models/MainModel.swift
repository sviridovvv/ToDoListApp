//
//  File.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

/// Подготовленная модель для вью
enum MainModel {
	struct ViewData {
		struct RegularTask {
			let name: String
			let isCompleted: Bool
		}
		
		struct ImportantTask {
			let name: String
			let isCompleted: Bool
			let isOverdue: Bool
			let dateCompletion: String
			let priority: String
		}
		
		enum Task {
			case regularTask(RegularTask)
			case importantTask(ImportantTask)
		}
		
		struct Section {
			let title: String
			let tasks: [Task]
		}
		
		let tasksBySections: [Section]
	}
	
	struct PresentData {
		struct Section {
			let title: String
			let tasks: [Task]
		}
		
		let tasksBySections: [Section]
	}
}
