//
//  ArticleCell.swift
//  GoodNews
//
//  Created by 董恩志 on 2022/2/26.
//

import UIKit
import SnapKit

class ArticleCell: UITableViewCell {

    // MARK: - Properties
    
    // MARK: - UIElements
    private let backgroundCustomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel,descriptionLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 10
        return sv
    }()

    // MARK: - Autolayout
    func setConstraints() {
        contentView.addSubview(backgroundCustomView)
        contentView.addSubview(labelStackView)
        
        backgroundCustomView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(backgroundCustomView).offset(5)
            make.bottom.equalTo(backgroundCustomView).offset(-5)
            make.left.equalTo(backgroundCustomView).offset(5)
            make.right.lessThanOrEqualTo(backgroundCustomView).offset(-5)
        }
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemBackground
        selectionStyle = .none
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(viewModel: ArticleViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
    
}
