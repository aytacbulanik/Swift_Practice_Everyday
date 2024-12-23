//
//  RegisterViewController.swift
//  SwiftPractice
//
//  Created by Aytaç Bulanık on 22.12.2024.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let nameSurnameTextField: UITextField = {
       var textField = UITextField()
        textField.placeholder = "Adınızı ve soyadınızı giriniz"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Email adresinizi giriniz"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Şifrenizi giriniz"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordAgainTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Şifrenizi tekrar giriniz"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Kayıt Ol", for: .normal)
        button.backgroundColor = .appGreen
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dismissButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Vazgeç", for: .normal)
        button.backgroundColor = .appGray
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .appBackGround
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Geri", style: .plain, target: self, action: #selector(dismissButtonPressed))
        navigationController?.navigationBar.tintColor = .appGreen
        view.addSubview(nameSurnameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(passwordAgainTextField)
        view.addSubview(loginButton)
        view.addSubview(dismissButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            nameSurnameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            nameSurnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            nameSurnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            nameSurnameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            emailTextField.topAnchor.constraint(equalTo: nameSurnameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordAgainTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            passwordAgainTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            passwordAgainTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            passwordAgainTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: passwordAgainTextField.bottomAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            dismissButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            dismissButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    @objc func dismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func loginButtonPressed() {
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
