//
//  LoginInteractor.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import Foundation

/// Протокол для итерактора логина
protocol ILoginInteractor: AnyObject {
	func login(request: LoginModels.Request)
}

/// Реализация итерактора логина
final class LoginInteractor: ILoginInteractor {
	private var worker: ILoginWorker
	private var presenter: ILoginPresenter?
	
	required init(worker: ILoginWorker, presenter: ILoginPresenter) {
		self.worker = worker
		self.presenter = presenter
	}
	
	/// Отправляем запрос на авторизацию
	public func login(request: LoginModels.Request) {
		let result = worker.login(login: request.login, password: request.password)
		
		let response = LoginModels.Response(
			success: result.success == 1,
			login: result.login,
			lastLoginDate: result.lastLoginDate
		)
		
		presenter?.present(response: response)
	}
	
}
