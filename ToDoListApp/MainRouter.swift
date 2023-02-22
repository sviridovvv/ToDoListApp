//
//  MainRouter.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import Foundation

import UIKit

protocol IMainRouter {
	func route(view: UIViewController)
}

class MainRouter: IMainRouter {
	weak var viewController: LoginViewController?
	
	func route(view: UIViewController) {
		view.present(assembly(), animated: true)
	}
	
	private func assembly() -> UIViewController {
		let storyboard = UIStoryboard(name: "TaskManager", bundle: nil)

		guard let viewController = storyboard.instantiateViewController(withIdentifier: "TaskManagerStoryboard") as? TaskManagerTableViewController else {
			fatalError("Нету на TaskManager.storyboard TaskManagerTableViewController")
		}

		let taskManager = OrderedTaskManager(taskManager: TaskManager())
		let repository = TaskRepository()
		let taskSectionsAdapter = SectionForTaskManagerAdapter(taskManager: taskManager)
		let presenter = MainPresenter(view: viewController)
		let taskFacade = TaskFacade(repository: repository, taskManager: taskManager)
		viewController.modalPresentationStyle = .fullScreen
		viewController.interactor = MainInteractor(
			presenter: presenter,
			taskSectionsAdapter: taskSectionsAdapter,
			taskFacade: taskFacade
		)
		
		return viewController
	}
}
