//
//  SceneDelegate.swift
//  ToDoListApp
//
//  Created by Владимир Свиридов on 12.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)
		
		window.rootViewController = assemly()
		window.makeKeyAndVisible()
		
		self.window = window
	}
	
	private func assemly() -> UIViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let viewController = storyboard.instantiateViewController(withIdentifier: "LoginStoryboard") as? LoginViewController else {
			fatalError("Нету на Main.storyboard LoginViewController")
		}
		
		let worker = LoginWorker()
		let router = MainRouter()
		let presenter = LoginPresenter(viewController: viewController)
		let interactor = LoginInteractor(worker: worker, presenter: presenter)
		
		viewController.interactor = interactor
		viewController.router = router
		
		let navigationController = UINavigationController(rootViewController: viewController)
		let mask = UIImage()
		navigationController.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		navigationController.navigationBar.backIndicatorImage = mask
		navigationController.navigationBar.backIndicatorTransitionMaskImage = mask
		navigationController.navigationBar.topItem?.backBarButtonItem?.isEnabled = false
		return navigationController
	}
}
