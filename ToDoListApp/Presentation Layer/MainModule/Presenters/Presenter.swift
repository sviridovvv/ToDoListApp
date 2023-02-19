//
//  Presenter.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

final class Presenter: IPresenter {
	private var view: ITableViewController
	private var taskSectionsAdapter: ISectionForTaskManagerAdapter!

	required init(view: ITableViewController) {
		self.view = view
	}
	
	func prepareViewData() {
		setup()
		let viewData = ViewData(sections: taskSectionsAdapter.getSectionsData())
		view.render(viewData: viewData)
	}
	
	func cellTapped(indexPath: IndexPath) {
		taskSectionsAdapter.getSectionsData()[indexPath.section].cells[indexPath.row].completed.toggle()
		view.render(viewData: ViewData(sections: taskSectionsAdapter.getSectionsData()))
	}

	private func setup() {
		let taskManager: ITaskManager = OrderedTaskManager(taskManager: TaskManager())
		let taskRepository: ITaskRepository = TaskRepository()
		taskManager.addTasks(tasks: taskRepository.getTasks())
		
		self.taskSectionsAdapter = SectionForTaskManagerAdapter(taskManager: taskManager)
	}
}
