//
//  ReposListCoordinator.swift
//  ReposListTask
//
//  Created by user225645 on 7/25/22.
//

import UIKit

final class ReposListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    //we will pass out navigationController from appCoordinator
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //we need to sit reposListViewController to our navigation stack as the root
    //we must attach ReposListViewController to our storyboard to be able to instantiate it
    func start() {
        let reposListViewController = ReposListViewController.instantiate()
        navigationController.setViewControllers([reposListViewController], animated: false)
    }
    
    
}
