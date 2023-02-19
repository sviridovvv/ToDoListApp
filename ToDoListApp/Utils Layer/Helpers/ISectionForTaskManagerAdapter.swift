//
//  ITaskSectionsDelegate.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 16.02.2023.
//

import Foundation

/// Протокол для адаптера менеджера задач
protocol ISectionForTaskManagerAdapter: AnyObject {
	/// Возвращает массив секций с необходимыми данными для построения секций и ячеек
	func getSectionsData() -> [Section]
}
