//
//  UITableViewCell.swift
//  AppStore
//
//  Created by Aidar Asanakunov on 19/10/22.

import UIKit
//
class MainTableViewCell: UITableViewCell {
     lazy var firstTitleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.numberOfLines = 1
//        title.text = "Наименование"
        title.font = .systemFont(ofSize: 17, weight: .bold)
        return title
    }()
     lazy var secondTitleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .gray
        title.numberOfLines = 1
        title.font = .systemFont(ofSize: 17, weight: .bold)
//        title.text = "Откуда - Куда"
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubview() {
        addSubview(firstTitleLabel)
        addSubview(secondTitleLabel)
        firstTitleLabel.frame = CGRect(x: 20, y: -30, width: 300, height: 100)
        secondTitleLabel.frame = CGRect(x: 30, y: 40, width: 300, height: 30)
    }
    override func prepareForReuse() {
         super.prepareForReuse()
        print("prepare")
    }

    
    
}
