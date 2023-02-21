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
	
	func configure(with name: String, isCompleted: Bool, dateCompletion: String? = nil, isOverdue: Bool? = false, priority: String? = nil) {
		taskLabel.text = name
		completionDate.text = nil
		checkBox.isChecked = isCompleted
		importantMark.isImportant = priority != nil
		self.selectionStyle = .none
		completionDate.text = dateCompletion
		self.backgroundColor = isOverdue == true ? .systemPink : .white
	}
}
