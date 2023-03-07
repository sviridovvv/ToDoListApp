//
//  LoginViewController.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 22.02.2023.
//

import UIKit

/// Протокол для вью контроллера
protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

/// Вью контроллер
final class LoginViewController: UIViewController {
	var interactor: ILoginInteractor!
	var router: IMainRouter!
	
	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPass: UITextField!
	@IBAction func buttonLogin(_ sender: Any) {
		if let email = textFieldLogin.text, let password = textFieldPass.text {
			let request = LoginModels.Request(login: email, password: password)
			interactor?.login(request: request)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = Constants.appName
	}
}

/// Реализация вью контроллера
extension LoginViewController: ILoginViewController {
	/// Отображаем результат авторизации
	public func render(viewModel: LoginModels.ViewModel) {
		if viewModel.success {
			showAlert(title: "Success", message: viewModel.userName) { [weak self] _ in
				guard let self = self else { return }
				self.router.route(view: self)
			}
		} else {
			showAlert(title: "Error", message: "")
		}
	}
	
	private func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
		let alert = UIAlertController(
			title: title,
			message: message,
			preferredStyle: UIAlertController.Style.alert
		)
		
		let action = UIAlertAction(title: "Ok", style: .default, handler: completion)
		
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
}
