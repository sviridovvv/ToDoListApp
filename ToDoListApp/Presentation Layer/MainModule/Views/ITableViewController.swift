//
//  ITableViewControllerInput.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

protocol ITableViewController: AnyObject {
	func render(viewData: ViewData)
}
