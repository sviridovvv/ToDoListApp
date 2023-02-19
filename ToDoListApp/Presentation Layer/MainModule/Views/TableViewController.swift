//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 12.02.2023.
//

import UIKit

/// Тейбл вью контроллер для отображения задач
class TableViewController: UITableViewController, ITableViewController {
	
	private var viewData: ViewData?
	
	var presenter: IPresenter!
	
	func render(viewData: ViewData) {
		self.viewData = viewData
		tableView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.prepareViewData()
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return viewData?.sections[section].title
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return viewData?.sections.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewData?.sections[section].cells.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else { return UITableViewCell() }
		let task = viewData?.sections[indexPath.section].cells[indexPath.row]
		
		let regularTask = task as? RegularTask
		let importantTask = task as? ImportantTask
		
		if let importantTask = importantTask {
			cell.configure(
				with: importantTask.title,
				isCompleted: importantTask.completed == true,
				dateCompletion: importantTask.completionDate,
				priority: importantTask.priority
			)
		} else if let regularTask = regularTask {
			cell.configure(
				with: regularTask.title,
				isCompleted: regularTask.completed == true
			)
		}
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.cellTapped(indexPath: indexPath)
	}
}
