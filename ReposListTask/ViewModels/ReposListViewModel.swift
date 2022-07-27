//
//  ReposListViewModel.swift
//  ReposListTask
//
//  Created by user225645 on 7/26/22.
//

import Foundation
import Combine

class ReposListViewModel {
    let title:String = "Repos"
    @Published var allRepos: [Repo] = []
    
    private let dataService = RepoDataService()
    private var cancellabels = Set<AnyCancellable>()
    
    init() {
        addSubscripers()
    }
    
    func addSubscripers() {
        dataService.$allRepos
            .sink { [weak self] (returnedRepos) in
                self?.allRepos = returnedRepos
            }
            .store(in: &cancellabels)
    }
    
    func numberOfRows() -> Int {
        return allRepos.count
    }
    
    func cell(at indexPath: IndexPath) -> Repo {
        return allRepos[indexPath.row]
    }
}
