//
//  AppCoordinator.swift
//  BeerList
//
//  Created by Gabriel on 25/01/24.
//

import UIKit

final class AppCoordinator {
    
    private let window: UIWindow!
    private let navigation: NavigationController!
    
    private var listBeerCoordinator: ListBeerCoordinator!
    
    required init(window: UIWindow) {
        self.window = window
        self.navigation = NavigationController()
        self.window.rootViewController = navigation
        self.window.makeKeyAndVisible()
    }
    
    
    func start() {
        listBeerCoordinator = ListBeerCoordinator()
        listBeerCoordinator.start(usingPresentation: .push(navigationController: navigation), animated: true)
    }
}
