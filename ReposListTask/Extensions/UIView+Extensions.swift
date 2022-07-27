//
//  UIView+Extensions.swift
//  ReposListTask
//
//  Created by user225645 on 7/26/22.
//

import UIKit

enum Edge {
    case left
    case top
    case right
    case bottom
}

extension UIView {
    func pinToSuperViewEdges(_ edges: [Edge] = [.top, .bottom, .right, .left], constant: CGFloat = 0) {
        guard let superview = superview else { return }
        edges.forEach {
            switch $0 {
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            }
        }
    }
}

