//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 12.02.2023.
//

import UIKit

/// Протокол для таблицы
protocol ITaskManagerTableViewController: AnyObject {
	func render(viewData: MainModel.ViewModel)
}

/// Таблица для отображения задач
class TaskManagerTableViewController: UITableViewController, ITaskManagerTableViewController {
	private var viewModel: MainModel.ViewModel?
	var interactor: IMainInteractor!
	
	func render(viewData: MainModel.ViewModel) {
		self.viewModel = viewData
		tableView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		interactor.viewIsReady()
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewModel?.tasksBySections[section].title
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		viewModel?.tasksBySections.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel?.tasksBySections[section].tasks.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let cell = self.tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell,
			let taskData = viewModel?.tasksBySections[indexPath.section].tasks[indexPath.row]
		else { return UITableViewCell() }
		
		switch taskData {
		case .importantTask(let task):
			cell.configureImportantTask(
				with: task.name,
				isCompleted: task.isCompleted,
				dateCompletion: task.dateCompletion,
				isOverdue: task.isOverdue,
				priority: task.priority
			)
		case .regularTask(let task):
			cell.configureRegularTask(
				with: task.name,
				isCompleted: task.isCompleted == true
			)
		}
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		interactor.cellTapped(indexPath: indexPath)
	}
}
