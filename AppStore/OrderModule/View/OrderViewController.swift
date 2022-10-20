//
//  OrderViewController.swift
//  AppStore
//
//  Created by Эмир Кармышев on 19.10.22.
//

import Foundation
import UIKit
import RxRelay
import RxSwift
import RxCocoa
import SnapKit

class OrderViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let viewModel = OrderViewModel()
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "back"), for: .normal)
        return view
    }()
    private lazy var orderlabel: UILabel = {
        let view = UILabel()
        view.text = "Order"
        view.font = .systemFont(ofSize: 24, weight: .heavy)
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabelWithInsets()
        view.text = "Name"
        view.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    private lazy var fromWhereLabel: UILabel = {
        let view = UILabelWithInsets()
        view.text = "From Where"
        view.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    private lazy var toWhereLabel: UILabel = {
        let view = UILabelWithInsets()
        view.text = "To Where"
        view.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    private lazy var widthLabel: UILabel = {
        let view = UILabelWithInsets()
        view.text = "Width"
        view.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    private lazy var heightLabel: UILabel = {
        let view = UILabelWithInsets()
        view.text = "Height"
        view.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    private lazy var weightLabel: UILabel = {
        let view = UILabelWithInsets()
        view.text = "Weight, kg"
        view.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    private lazy var commentLabel: UILabel = {
        let view = UILabelWithInsets()
        view.text = "Comment"
        view.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        acceptLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getOrder()
        acceptLabels()
    }
    
    private func acceptLabels() {
        nameLabel.text = viewModel.name.value
        fromWhereLabel.text = viewModel.fromWhere.value
        toWhereLabel.text = viewModel.toWhere.value
        widthLabel.text = viewModel.width.value
        heightLabel.text = viewModel.height.value
        weightLabel.text = viewModel.weight.value
        commentLabel.text = viewModel.comment.value
    }
    
    private func setupConstraints() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(22)
            make.top.equalToSuperview().offset(69)
        }
        view.addSubview(orderlabel)
        orderlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(86)
            make.centerX.equalToSuperview()
        }
        view.addSubview(nameLabel)
        view.addSubview(fromWhereLabel)
        view.addSubview(toWhereLabel)
        view.addSubview(widthLabel)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(commentLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(orderlabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        fromWhereLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        toWhereLabel.snp.makeConstraints { make in
            make.top.equalTo(fromWhereLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        widthLabel.snp.makeConstraints { make in
            make.top.equalTo(toWhereLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(widthLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(83)
        }
    }
}



class UILabelWithInsets: UILabel {
    public var textInsets: UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
