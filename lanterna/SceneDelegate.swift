//
//  SceneDelegate.swift
//  lanterna
//
//  Created by Luccas Santana Marinho on 26/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    //MARK: ---

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
    //MARK: ---
        
        let safeWindow = UIWindow(windowScene: windowScene)
            safeWindow.frame = UIScreen.main.bounds
            safeWindow.rootViewController = ViewController()
            safeWindow.makeKeyAndVisible()

        window = safeWindow
    }
}
