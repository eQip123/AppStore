//
//  ViewController.swift
//  AppStore
//
//  Created by Aidar Asanakunov on 13/10/22.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class SignInViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let viewModel = SignInViewModel()
    
    private lazy var imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Sign In"
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
        textField.text = "Aidar2003@gmail.com"
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
        textField.text = "12345"
        return textField
    }()
    
    private lazy var iconPasswordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        return imageView
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(UIColor(red: 99/255, green: 115/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Display", size: 14)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 99/255, green: 115/255, blue: 255/255, alpha: 1)
        button.setTitle("Sign In", for: .normal)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(red: 99/255, green: 115/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro Display", size: 17)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        bindingViewModel()
        setupConstraints()
        signIn()
        signUp()
        forgotPassword()
    }
    
    private func bindingViewModel() {
        emailTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)
        
        passwordTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.pass)
            .disposed(by: disposeBag)
            
    }
    
    private func setupConstraints() {
        
        view.addSubview(imageLogo)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        emailTextField.addSubview(iconEmailImage)
        view.addSubview(passwordTextField)
        passwordTextField.addSubview(iconPasswordImage)
        view.addSubview(forgotButton)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        imageLogo.snp.makeConstraints { make in
            
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageLogo.snp.bottom).offset(-10)
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
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.trailing.equalTo(passwordTextField.snp.trailing)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(180)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
    private func signIn() {
        
        signInButton.rx
            .tap
            .bind {[weak self] _ in
                self?.viewModel.getSavedData()
                self?.viewModel.canLogIn()
                if self?.viewModel.status.value == true {
//                 let vc = MainViewController()
                    let mainTabBarController = MainTabBarController()
                    self?.navigationController?.pushViewController(mainTabBarController, animated: true)
                } else {
                    let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                }
            }
            .disposed(by: disposeBag)
        
    }
    private func signUp() {
        
        signUpButton
            .rx
            .tap
            .bind {
                let signUpViewController = SignUpViewController()
                self.navigationController?.pushViewController(signUpViewController, animated: true)
            }.disposed(by: disposeBag)
        
    }
    private func forgotPassword() {
        forgotButton
            .rx
            .tap
            .bind{
                let forgotPassword = ForgotViewController()
                self.navigationController?.pushViewController(forgotPassword, animated: true)
            }.disposed(by: disposeBag)
    }
}

//extension UIViewController {
//    func hideNavigationBar() {
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//}
