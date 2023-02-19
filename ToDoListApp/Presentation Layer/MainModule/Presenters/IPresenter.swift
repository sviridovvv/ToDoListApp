//
//  ITableViewControllerOutput.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

protocol IPresenter: AnyObject {
	init(view: ITableViewController)
	func prepareViewData()
	func cellTapped(indexPath: IndexPath)
}
