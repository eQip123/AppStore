//
//  SignUpViewController.swift
//  AppStore
//
//  Created by Aidar Asanakunov on 15/10/22.
//

import UIKit
import SnapKit
class SignUpViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Sign Up"
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
    
    private lazy var passwordTextField: UITextField = {
        let textField = CustomTextField()
        textField.textColor = .gray
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    
    private lazy var iconPasswordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        return imageView
    }()
    private lazy var confirmIconPasswordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        return imageView
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = CustomTextField()
        textField.textColor = .gray
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 25
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.placeholder = "Confirm password"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupConstraints()
    }
    private func setupConstraints() {
        
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        emailTextField.addSubview(iconEmailImage)
        view.addSubview(passwordTextField)
        passwordTextField.addSubview(iconPasswordImage)
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.addSubview(confirmIconPasswordImage)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.width.equalTo(335)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        iconEmailImage.snp.makeConstraints { make in
            make.leading.equalTo(emailTextField.snp.leading).offset(30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.width.equalTo(335)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        iconPasswordImage.snp.makeConstraints { make in
            make.leading.equalTo(passwordTextField.snp.leading).offset(30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.width.equalTo(335)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        confirmIconPasswordImage.snp.makeConstraints { make in
            make.leading.equalTo(confirmPasswordTextField.snp.leading).offset(30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
    }
    
    
}
