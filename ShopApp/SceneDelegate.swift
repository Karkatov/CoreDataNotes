//
//  SceneDelegate.swift
//  ShopApp
//
//  Created by Duxxless on 27.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        let viewController = ViewController()
        navigationController.setViewControllers([viewController], animated: true)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        
    }
}

