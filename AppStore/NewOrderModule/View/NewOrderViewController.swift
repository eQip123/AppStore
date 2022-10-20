//
//  NewOrderViewController.swift
//  AppStore
//
//  Created by Эмир Кармышев on 19.10.22.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift


class NewOrderViewController: UIViewController {
    let disposeBag = DisposeBag()
    let viewModel = NewOrderViewModel()
    
    private lazy var nameTextField: UITextField = {
        let view = SecondCustomTextField()
        view.placeholder = "Name"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var fromWhereTextField: UITextField = {
        let view = SecondCustomTextField()
        view.placeholder = " From where"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var toWhereTextField: UITextField = {
        let view = SecondCustomTextField()
        view.placeholder = " To where"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var widthTextField: UITextField = {
        let view = SecondCustomTextField()
        view.placeholder = " Width"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var heightTextField: UITextField = {
        let view = SecondCustomTextField()
        view.placeholder = " Height"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var weightTextField: UITextField = {
        let view = SecondCustomTextField()
        view.placeholder = " Weight, kg"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var commentTextField: UITextField = {
        let view = SecondCustomTextField()
        view.placeholder = " Comment"
        view.textColor = .black
        view.font = .systemFont(ofSize: 17, weight: .medium)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var createButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "create"), for: .normal)
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "2"), for: .normal)
        return view
    }()
    private lazy var newOrderlabel: UILabel = {
        let view = UILabel()
        view.text = "New Order"
        view.font = .systemFont(ofSize: 24, weight: .heavy)
        return view
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupConstraints()
        bindingViewModel()
        
    }
    private func setupConstraints() {
        view.backgroundColor = .white
        view.addSubview(createButton)
        createButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(689)
            make.bottom.equalToSuperview().offset(-72)
            make.centerX.equalToSuperview()
        }
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(22)
            make.top.equalToSuperview().offset(69)
        }
        view.addSubview(newOrderlabel)
        newOrderlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(86)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(nameTextField)
        view.addSubview(fromWhereTextField)
        view.addSubview(toWhereTextField)
        view.addSubview(widthTextField)
        view.addSubview(heightTextField)
        view.addSubview(weightTextField)
        view.addSubview(commentTextField)

        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(newOrderlabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        fromWhereTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        toWhereTextField.snp.makeConstraints { make in
            make.top.equalTo(fromWhereTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        widthTextField.snp.makeConstraints { make in
            make.top.equalTo(toWhereTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        heightTextField.snp.makeConstraints { make in
            make.top.equalTo(widthTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        weightTextField.snp.makeConstraints { make in
            make.top.equalTo(heightTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(50)
        }
        commentTextField.snp.makeConstraints { make in
            make.top.equalTo(weightTextField.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(21)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(83)
        }
    }
    
    private func bindingViewModel() {
        nameTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.name)
            .disposed(by: disposeBag)
        
        fromWhereTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.fromWhere)
            .disposed(by: disposeBag)
        
        toWhereTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.toWhere)
            .disposed(by: disposeBag)
        
        widthTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.width)
            .disposed(by: disposeBag)
        
        heightTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.height)
            .disposed(by: disposeBag)
        
        weightTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.weight)
            .disposed(by: disposeBag)
        
        commentTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.comment)
            .disposed(by: disposeBag)
        
        createButton.rx
            .tap
            .bind {[weak self] _ in
                self?.viewModel.saveOrder()
            }
    }
}
