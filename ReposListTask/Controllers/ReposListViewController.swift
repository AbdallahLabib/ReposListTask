//
//  ReposListViewController.swift
//  ReposListTask
//
//  Created by user225645 on 7/25/22.
//

import UIKit

class ReposListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    var vm: ReposListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        
        navigationItem.title = vm.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.register(RepoCell.self, forCellReuseIdentifier: "RepoCell")
    }
    
    @objc func tappedRightBarButton() {
        print("tapped right bar buttom")
    }

}

extension ReposListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
        cell.update(with: vm.allRepos)
        //cell.textLabel?.text = "Ali"
        return cell
    }
    
}

extension ReposListViewController {
    //it will get us an instance of ReposListViewController that we will use inside its coordinator
    //attach ReposListViewController to our storyboard to be able to instantiate it
    static func instantiate () -> ReposListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "ReposListViewController") as! ReposListViewController
        return controller
    }
}
