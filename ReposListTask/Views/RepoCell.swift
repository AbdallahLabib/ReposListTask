//
//  RepoCell.swift
//  ReposListTask
//
//  Created by user225645 on 7/26/22.
//

import UIKit
/*
 1. Repository name.
 2. Repository owner name.
 3. Avatar (Image) of the repository owner.
 4. Creation date.
 */

final class RepoCell: UITableViewCell{
    private let repoName = UILabel()
//    private let ownerName = UILabel()
//    private let image = UIImageView()
//    private let creationDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
        setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [repoName/*, ownerName, image, creationDate*/].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        repoName.font = .systemFont(ofSize: 28, weight: .bold)
        repoName.textColor = .red
        
//        [ownerName, creationDate].forEach {
//            $0.font = .systemFont(ofSize: 22, weight: .medium)
//            $0.textColor = .white
//        }
    }
    
    private func setupHierarchy() {
        //contentView.addSubview(image)
    }
    
    private func setupLayout() {
        //image.pinToSuperViewEdges()
        repoName.pinToSuperViewEdges([.left, .bottom], constant: 15)
        //creationDate.pinToSuperViewEdges([.right, .bottom], constant: 15)
        //ownerName.pinToSuperViewEdges([.top, .right], constant: 15)
    }
    
    func update(with allRepos: [Repo]) {
        allRepos.forEach {
            repoName.text = $0.name
//            ownerName.text = $0.owner.name
//            guard let url = URL(string: $0.owner.avatarURL) else { return }
//            DispatchQueue.global().async { [weak self] in
//                if let data = try? Data(contentsOf: url) {
//                    DispatchQueue.main.async {
//                        self?.image.image = UIImage(data: data)
//    
//                    }
//                }
//            }
        }
    }
}
