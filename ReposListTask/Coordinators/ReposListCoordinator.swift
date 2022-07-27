//
//  ReposListCoordinator.swift
//  ReposListTask
//
//  Created by user225645 on 7/25/22.
//

import UIKit

final class ReposListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    //pass out navigationController from appCoordinator
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //create reposListVC
        //create reposListVM
        //show current controller using navigationController
        let reposListViewController = ReposListViewController.instantiate()
        let vm = ReposListViewModel()
        reposListViewController.vm = vm
        navigationController.setViewControllers([reposListViewController], animated: false)
        
    }
}
