//
//  LoginWorker.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import Foundation

/// Модель авторизации
public struct LoginDTO {
	var success: Int
	var login: String
	var lastLoginDate: Date
}

/// Протокол для воркера логина
protocol ILoginWorker: AnyObject {
	func login(login: String, password: String) -> LoginDTO
}

/// Реализация воркера логина
final class LoginWorker: ILoginWorker {
	/// Проверяем корректность логина и пароля
	public func login(login: String, password: String) -> LoginDTO {
		
		if login == "Admin" && password == "pa$$32!" {
			return LoginDTO(
				success: 1,
				login: login,
				lastLoginDate: Date()
			)
		} else {
			return LoginDTO(
				success: 0,
				login: login,
				lastLoginDate: Date()
			)
		}
	}
}
