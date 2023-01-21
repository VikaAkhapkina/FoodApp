//
//  RecipeDetailisView.swift
//  FoodApp
//
//  Created by Viktoriya on 17.01.23.
//

import Foundation
import UIKit
import SnapKit

class RecipeDetailisView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()
    
    let headerView: RecipeHeaderView = {
        let headerView = RecipeHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    let initInfo: InitInfoView = {
        let initInfo = InitInfoView()
        initInfo.translatesAutoresizingMaskIntoConstraints = false
        return initInfo
    }()

    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(initInfo)
    }
    
    func set(model: RecipeDetailsModal) {
        headerView.set(title: model.title, image: model.image, sourceName: model.sourceName)
    }
    
    func setInit(model: RecipeDetailsModal) {
        initInfo.set(likes: model.aggregateLikes)
    }
    
    
    func setConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
            $0.width.equalTo(self.snp.width)
        }
        
        stackView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
//            $0.edges.equalToSuperview()
        }
        
        
        
    }
}
