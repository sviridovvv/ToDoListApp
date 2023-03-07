//
//  MainInteractor.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import Foundation

/// Протокол для итерактора
protocol IMainInteractor: AnyObject {
	func viewIsReady()
	func cellTapped(indexPath: IndexPath)
}

/// Реализация итерактора
final class MainInteractor: IMainInteractor {
	private var presenter: IMainPresenter!
	private var taskSectionsAdapter: ISectionForTaskManagerAdapter!
	private var taskWorker: ITaskWorker
	
	required init(
		presenter: IMainPresenter,
		taskSectionsAdapter: ISectionForTaskManagerAdapter,
		taskWorker: ITaskWorker
	) {
		self.presenter = presenter
		self.taskSectionsAdapter = taskSectionsAdapter
		self.taskWorker = taskWorker
	}
	
	/// После того как загрузилась вью, отправляем данные презентеру
	public func viewIsReady() {
		taskWorker.setupTaskManager()
		presenter.getPresentData(with: mapPresentData())
	}
	
	/// После нажатия на ячеку, обновляем и отправляем данные презентеру
	public func cellTapped(indexPath: IndexPath) {
		let section = taskSectionsAdapter.getSection(forIndex: indexPath.section)
		let task = taskSectionsAdapter.getTasksForSection(section: section)[indexPath.row]
		task.completed.toggle()
		presenter.getPresentData(with: mapPresentData())
	}
	
	private func mapPresentData() -> MainModel.Response {
		var sections = [MainModel.Response.Section]()
		for section in taskSectionsAdapter.getSections() {
			let sectionData = MainModel.Response.Section(
				title: section.title,
				tasks: taskSectionsAdapter.getTasksForSection(section: section)
			)
			
			sections.append(sectionData)
		}
		
		return MainModel.Response(tasksBySections: sections)
	}
}
