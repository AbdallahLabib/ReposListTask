//
//  RepoDataService.swift
//  ReposListTask
//
//  Created by user225645 on 7/25/22.
//

import Foundation
import Combine

class RepoDataService {
    @Published var allRepos: [Repo] = []
    var repoSubscription: AnyCancellable?
    
    init() {
        getRepos()
    }
    
    private func getRepos() {
        guard let url = URL(string: "https://api.github.com/repositories") else { return }
        
        repoSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [Repo].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] returnedRepos in
                self?.allRepos = returnedRepos
                self?.repoSubscription?.cancel()
            }
    }
    
}

