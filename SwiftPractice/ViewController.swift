//
//  ViewController.swift
//  SwiftPractice
//
//  Created by Aytaç Bulanık on 22.12.2024.
//

import UIKit

class ViewController: UIViewController {

    
    private let emailTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Email adresinizi giriniz..."
        textField.borderStyle = .roundedRect
        textField.tintColor = .red
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Şifrenizi giriniz..."
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Giriş Yap", for: .normal)
        button.backgroundColor = .appGreen
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Üye Ol", for: .normal)
        button.backgroundColor = .appGray
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .appBackGround
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        print("Login button tapped")
    }
    
    @objc func registerButtonPressed() {
        print("register button pressed")
    }
}

