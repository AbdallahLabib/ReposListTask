//
//  ReposListViewController.swift
//  ReposListTask
//
//  Created by user225645 on 7/25/22.
//

import UIKit

class ReposListViewController: UIViewController {
    
    //it will get us an instance of ReposListViewController
    static func instantiate () -> ReposListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "ReposListViewController") as! ReposListViewController
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        
        navigationItem.title = "Repos"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func tappedRightBarButton() {
        print("tapped right bar buttom")
    }

}
