//
//  RegularTaskCell.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 12.02.2023.
//

import UIKit

/// Ячейка таблицы
final class TaskCell: UITableViewCell {
	@IBOutlet var taskLabel: UILabel!
	@IBOutlet var checkBox: CheckBox!
	@IBOutlet var completionDate: UILabel!
	@IBOutlet var importantMark: ImportantMark!
	
	/// Конфигурируем ячейки c обычной задачей
	public func configureRegularTask(
		with name: String,
		isCompleted: Bool
	) {
		taskLabel.text = name
		checkBox.isChecked = isCompleted
		completionDate.text = nil
		importantMark.isImportant = false
	}
	
	/// Конфигурируем ячейки с важной задачей
	public func configureImportantTask(
		with name: String,
		isCompleted: Bool,
		dateCompletion: String,
		isOverdue: Bool,
		priority: String
	) {
		taskLabel.text = name
		checkBox.isChecked = isCompleted
		completionDate.text = dateCompletion
		importantMark.isImportant = true
		self.selectionStyle = .none
		self.backgroundColor = isOverdue == true ? .systemPink : .white
	}
}
