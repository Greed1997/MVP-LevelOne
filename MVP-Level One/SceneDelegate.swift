//
//  SceneDelegate.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController()
        let assemblyModuleBuilder = AssemblyModuleBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyModuleBuilder)
        router.initalViewController()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

