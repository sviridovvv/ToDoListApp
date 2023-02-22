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
	private var taskFacade: ITaskFacade
	
	required init(
		presenter: IMainPresenter,
		taskSectionsAdapter: ISectionForTaskManagerAdapter,
		taskFacade: ITaskFacade
	) {
		self.presenter = presenter
		self.taskSectionsAdapter = taskSectionsAdapter
		self.taskFacade = taskFacade
	}
	
	/// После того как загрузилась вью, отправляем данные презентеру
	public func viewIsReady() {
		taskFacade.setupTaskManager()
		presenter.getPresentData(with: mapPresentData())
	}
	
	/// После нажатия на ячеку, обновляем и отправляем данные презентеру
	public func cellTapped(indexPath: IndexPath) {
		let section = taskSectionsAdapter.getSection(forIndex: indexPath.section)
		let task = taskSectionsAdapter.getTasksForSection(section: section)[indexPath.row]
		task.completed.toggle()
		presenter.getPresentData(with: mapPresentData())
	}
	
	private func mapPresentData() -> MainModel.PresentData {
		var sections = [MainModel.PresentData.Section]()
		for section in taskSectionsAdapter.getSections() {
			let sectionData = MainModel.PresentData.Section(
				title: section.title,
				tasks: taskSectionsAdapter.getTasksForSection(section: section)
			)
			
			sections.append(sectionData)
		}
		
		return MainModel.PresentData(tasksBySections: sections)
	}
}