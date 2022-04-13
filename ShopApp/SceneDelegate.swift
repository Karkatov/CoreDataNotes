//
//  SceneDelegate.swift
//  ShopApp
//
//  Created by Duxxless on 27.03.2022.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
    
        let navigationController = UINavigationController()
        let tableViewController = TableViewController()
        tableViewController.context = getContext()
        navigationController.setViewControllers([tableViewController], animated: true)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
}

