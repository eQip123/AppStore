//
//  ForgotViewController.swift
//  AppStore
//
//  Created by Aidar Asanakunov on 15/10/22.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa
import UIKit
class ForgotViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let viewModel = ForgotViewModel()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Forgot Password"
        title.font = UIFont(name: "SF Pro Display", size: 24)
        title.font = .systemFont(ofSize: 24, weight: .heavy)
        return title
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = CustomTextField()
        textField.textColor = .gray
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.placeholder = "Email"
        return textField
    }()
    
    private lazy var iconEmailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "email")
        return imageView
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 99/255, green: 115/255, blue: 255/255, alpha: 1)
        button.setTitle("Confirm", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        bindingViewModel()
        confirm()
    }
    
    private func bindingViewModel() {
        emailTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)
    }
    
    private func setupConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        emailTextField.addSubview(iconEmailImage)
        view.addSubview(confirmButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.width.equalTo(335)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        iconEmailImage.snp.makeConstraints { make in
            make.leading.equalTo(emailTextField.snp.leading).offset(30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(180)
        }
    }
    
    private func confirm() {
        confirmButton.rx
            .tap
            .bind {[weak self] _ in
                self?.viewModel.updateData()
                self?.viewModel.isCorrectEmail()
                
                if self?.viewModel.status.value == true {
                    let alert = UIAlertController(title: "Ваш пароль", message: self?.viewModel.savedPass.value, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "Ошибка", message: "Такого email нет", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                }
            }
            .disposed(by: disposeBag)
    }
    
}
