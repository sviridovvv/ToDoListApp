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
	
	func configure(with title: String?, isCompleted: Bool, dateCompletion: Date? = nil, priority: Priority? = nil) {
		taskLabel.text = title
		completionDate.text = nil
		checkBox.isChecked = isCompleted
		importantMark.isImportant = priority != nil
		self.selectionStyle = .none
		
		if let dateCompletion = dateCompletion {
			if dateCompletion < Date() {
				self.backgroundColor = .systemPink
			}
			
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "dd.MM.yyyy"
			completionDate.text = dateFormatter.string(from: dateCompletion)
		}
	}
}
