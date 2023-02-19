//
//  UIButton + Extensions.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 12.02.2023.
//

import UIKit

/// Устанавливает чекбокс выполненного задания
class CheckBox: UIImageView {
	
	let checkedImage = UIImage(named: "checkmark")
	
	var isChecked: Bool = false {
		didSet {
			if isChecked == true {
				self.tintColor = .systemGreen
				self.image = checkedImage
			} else {
				self.image = nil
			}
		}
	}
}

/// Устанавливает индикатор важного задания
class ImportantMark: UIImageView {
	
	let importantImage = UIImage(named: "exclamationmark")
	
	var isImportant: Bool = false {
		didSet {
			if isImportant == true {
				self.tintColor = .systemRed
				self.image = importantImage
			} else {
				self.image = nil
			}
		}
	}
}
