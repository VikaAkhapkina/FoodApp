//
//  RecipeHeaderView.swift
//  FoodApp
//
//  Created by Viktoriya on 17.01.23.
//

import UIKit
import Kingfisher

class RecipeHeaderView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    
    }()
    
    let sourceNameLabel: UILabel = {
        let sourceNameLabel = UILabel()
        sourceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceNameLabel.textAlignment = .center
        sourceNameLabel.numberOfLines = 0
        return sourceNameLabel
    }()
    
    init() {
        super.init(frame: .zero)
        setup()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(sourceNameLabel)

        imageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(48)
            $0.top.equalToSuperview().offset(32)
            $0.height.equalTo(216)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        
        sourceNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    func set(title: String, image: String, sourceName: String) {
        titleLabel.text = title
        imageView.kf.setImage(with: URL(string: image))
        sourceNameLabel.text = sourceName
//        aggregateLikesLabel.text = String(like)
        
    }
}
