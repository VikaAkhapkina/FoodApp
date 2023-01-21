//
//  RecipePreviewTableViewCell.swift
//  FoodApp
//
//  Created by Artem Khalilyaev on 11.01.23.
//

import UIKit
import SnapKit
import Kingfisher

class RecipePreviewTableViewCell: UITableViewCell {

    static let identifier = "RecipePreviewTableViewCell"

    let stackView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 16
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    let foodImageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()

    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(foodImageView)
        stackView.addArrangedSubview(titleLabel)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        foodImageView.snp.makeConstraints {
            //$0.height.equalTo(contentView)
            $0.width.equalTo(150)
        }
    }

    func set(model: RecipePreviewModel) {
        foodImageView.kf.setImage(with: URL(string: model.image))
        titleLabel.text = model.title
    }
    
}
