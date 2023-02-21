//
//  ITableViewControllerInput.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

/// Протокол для таблицы
protocol IMainTableViewController: AnyObject {
	func render(viewData: MainModel.ViewData)
}
