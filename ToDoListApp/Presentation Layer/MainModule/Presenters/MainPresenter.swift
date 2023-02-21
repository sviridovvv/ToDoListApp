//
//  Presenter.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

/// Реализация главного презентера
final class MainPresenter: IMainPresenter {
	private var taskSectionsAdapter: ISectionForTaskManagerAdapter!
	private weak var view: IMainTableViewController!

	required init(view: IMainTableViewController, taskSectionsAdapter: ISectionForTaskManagerAdapter) {
		self.view = view
		self.taskSectionsAdapter = taskSectionsAdapter
	}
	
	func prepareViewData() {
		view.render(viewData: mapViewData())
	}
	
	func cellTapped(indexPath: IndexPath) {
		let section = taskSectionsAdapter.getSection(forIndex: indexPath.section)
		let task = taskSectionsAdapter.getTasksForSection(section: section)[indexPath.row]
		task.completed.toggle()
		view.render(viewData: mapViewData())
	}
	
	private func mapViewData() -> MainModel.ViewData {
		var sections = [MainModel.ViewData.Section]()
		for section in taskSectionsAdapter.getSections() {
			let sectionData = MainModel.ViewData.Section(
				title: section.title,
				tasks: mapTasksData(tasks: taskSectionsAdapter.getTasksForSection(section: section))
			)
			
			sections.append(sectionData)
		}
		
		return MainModel.ViewData(tasksBySections: sections)
	}
	
	private func mapTasksData(tasks: [Task]) -> [MainModel.ViewData.Task] {
		tasks.map { mapTaskData(task: $0) }
	}
	
	private func mapTaskData(task: Task) -> MainModel.ViewData.Task {
		if let task = task as? ImportantTask {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "dd.MM.yyyy"
			let date = dateFormatter.string(from: task.completionDate ?? Date())
			let result = MainModel.ViewData.ImportantTask(
				name: task.title ?? "",
				isCompleted: task.completed,
				isOverdue: task.completionDate ?? Date() < Date(),
				dateCompletion: "Deadline: \(date)",
				priority: "\(task.priority)"
			)
			
			return .importantTask(result)
		} else {
			return .regularTask(MainModel.ViewData.RegularTask(name: task.title ?? "", isCompleted: task.completed))
		}
	}
}
