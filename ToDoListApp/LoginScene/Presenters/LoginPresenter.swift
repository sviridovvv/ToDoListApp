//
//  LoginPresenter.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import Foundation

/// Протокол для презентора логина
protocol ILoginPresenter {
	func present(response: LoginModels.Response)
}

/// Реализация презентера
final class LoginPresenter: ILoginPresenter {
	private weak var viewController: ILoginViewController?
	
	required init(viewController: ILoginViewController?) {
		self.viewController = viewController
	}
	
	/// Отпраляем вью результат авторизации
	public func present(response: LoginModels.Response) {
		let viewModel = LoginModels.ViewModel(
			success: response.success,
			userName: response.login,
			lastLoginDate: "\(response.lastLoginDate)"
		)
		
		viewController?.render(viewModel: viewModel)
	}
}
