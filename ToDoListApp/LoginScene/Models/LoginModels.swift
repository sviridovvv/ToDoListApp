//
//  LoginModels.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import Foundation

/// Модель с запросом, ответом от итерактора и состоянием авторизации
enum LoginModels {
	struct Request {
		var login: String
		var password: String
	}
	
	struct Response {
		var success: Bool
		var login: String
		var lastLoginDate: Date
	}
	
	struct ViewModel {
		var success: Bool
		var userName: String
		var lastLoginDate: String
	}
}
