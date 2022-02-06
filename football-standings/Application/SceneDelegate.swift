//
//  SceneDelegate.swift
//  football-standings
//
//  Created by Rowan Rhodes on 30/01/2022.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        self.appCoordinator = AppCoordinator(window: window)
        self.appCoordinator?.start()
    }
}
