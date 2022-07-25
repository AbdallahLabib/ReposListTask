//
//  AppCoordinator.swift
//  ReposListTask
//
//  Created by user225645 on 7/25/22.
//

import Foundation
import UIKit

protocol Coordinator {
    //every time you use a coordinator, you need to append it to this array, so you make sure that
    //your coordinators are retained and we don't deallocate them immediately.
    var childCoordinators: [Coordinator] { get }
    
    //the entry point for its coordinator.
    //it will be called in every coordinator
    func start()
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    //to inject window from scene delegate
    private let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    //We want to set our rootViewController in our window to a navigation controller
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
}
