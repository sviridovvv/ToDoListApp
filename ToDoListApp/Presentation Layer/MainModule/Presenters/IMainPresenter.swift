//
//  ITableViewControllerOutput.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 19.02.2023.
//

import Foundation

/// Протокол для главного презентера
protocol IMainPresenter: AnyObject {
	init(view: IMainTableViewController, taskSectionsAdapter: ISectionForTaskManagerAdapter)
	func prepareViewData()
	func cellTapped(indexPath: IndexPath)
}
