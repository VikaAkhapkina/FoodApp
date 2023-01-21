//
//  InitInfoView.swift
//  FoodApp
//
//  Created by Viktoriya on 21.01.23.
//

import Foundation
import UIKit

class InitInfoView: UIView {
    
    let aggregateLikesLabel: UILabel = {
        let aggregateLikesLabel = UILabel()
        aggregateLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        aggregateLikesLabel.textAlignment = .justified
        return aggregateLikesLabel
    }()


    init () {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup () {
        addSubview(aggregateLikesLabel)
        
        aggregateLikesLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(32)

        }
    }
    
    func set(likes: Int) {
        aggregateLikesLabel.text = String(likes)
    }

}
