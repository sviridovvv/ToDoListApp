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
	}
}

/// Реализация вью контроллера
extension LoginViewController: ILoginViewController {
	/// Отображаем результат авторизации
	public func render(viewModel: LoginModels.ViewModel) {
				
		let alert: UIAlertController
		let action: UIAlertAction
		
		if viewModel.success {
			alert = UIAlertController(
				title: "Success",
				message: viewModel.userName,
				preferredStyle: UIAlertController.Style.alert
			)

			action = UIAlertAction(title: "Ok", style: .default) {_ in
				self.router.route(view: self)
			}
		} else {
			alert = UIAlertController(
				title: "Error",
				message: "",
				preferredStyle: UIAlertController.Style.alert
			)

			action = UIAlertAction(title: "Ok", style: .default)
		}
		
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
}
