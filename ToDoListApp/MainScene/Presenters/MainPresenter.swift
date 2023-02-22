//
//  Presenter.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

/// Протокол для главного презентера
protocol IMainPresenter: AnyObject {
	init(view: IMainTableViewController)
	/// Получаем данные из интерактора
	func getPresentData(with presentData: MainModel.PresentData)
}

/// Реализация главного презентера
final class MainPresenter: IMainPresenter {
	private var view: IMainTableViewController!
	
	required init(view: IMainTableViewController) {
		self.view = view
	}
	
	/// Получаем данные из интерактора
	public func getPresentData(with presentData: MainModel.PresentData) {
		view.render(viewData: mapViewData(with: presentData))
	}
	
	private func mapViewData(with presentData: MainModel.PresentData) -> MainModel.ViewData {
		var sections = [MainModel.ViewData.Section]()
		for section in presentData.tasksBySections {
			let sectionData = MainModel.ViewData.Section(
				title: section.title,
				tasks: mapTasksData(tasks: section.tasks)
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
