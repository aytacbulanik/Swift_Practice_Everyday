//
//  RegisterViewController.swift
//  SwiftPractice
//
//  Created by Aytaç Bulanık on 22.12.2024.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    private let nameSurnameTextField: UITextField = {
       var textField = UITextField()
        textField.placeholder = "Adınızı ve soyadınızı giriniz"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .alphabet
        textField.autocapitalizationType = .words
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Email adresinizi giriniz"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Şifrenizi giriniz"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordAgainTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Şifrenizi tekrar giriniz"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
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
    private var db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        nameSurnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordAgainTextField.delegate = self
    }
    
    private func setupUI() {
        title = "Kayıt Ol"
        view.backgroundColor = .appBackGround
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Geri", style: .plain, target: self, action: #selector(dismissButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = .appGreen
        view.addSubview(nameSurnameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(passwordAgainTextField)
        view.addSubview(loginButton)
        view.addSubview(dismissButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            nameSurnameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            nameSurnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            nameSurnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            nameSurnameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            emailTextField.topAnchor.constraint(equalTo: nameSurnameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: nameSurnameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameSurnameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordAgainTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            passwordAgainTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordAgainTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            passwordAgainTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: passwordAgainTextField.bottomAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: passwordAgainTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordAgainTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            dismissButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            dismissButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    @objc func dismissButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func loginButtonPressed() {
        guard let nameSurname = nameSurnameTextField.text , nameSurname != "" else {
            showAlertController(title: "Hata", message: "Ad Soyad alanı boş bırakılamaz")
            return
        }
        
        guard let email = emailTextField.text , email != "" else {
            showAlertController(title: "Hata", message: "Lütfen geçerli bir mail adresi giriniz")
            return
        }
        
        guard let password = passwordTextField.text , password != "" else {
            showAlertController(title: "Hata", message: "Lütfen şifre giriniz")
            return
        }
        guard let passwordAgain = passwordAgainTextField.text , passwordAgain != "" else {
            showAlertController(title: "Hata", message: "Lütfen şifrenizi tekrar giriniz")
            return
        }
        
        if password.lowercased() != passwordAgain.lowercased() {
           showAlertController(title: "Hata", message: "Şifreler Aynı Değil")
           return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error {
                self?.showAlertController(title: "Kayıt Hatası", message: error.localizedDescription)
                return
            }
            
            guard let userId = result?.user.uid else {return}
            
            Firestore.firestore().collection(Constants.usersRef).document(userId).setData(
                    [
                    Constants.id : userId,
                    Constants.nameSurname : nameSurname,
                    Constants.email : email,
                    Constants.createdDate : FieldValue.serverTimestamp(),
                    Constants.connetions : [],
                    Constants.pendingRequest : [],
                    Constants.sendConnetions : []
                    ])
                   { error in
                    self?.showAlertController(title: "Hata", message: "Kayıt oluşturulurken hata oluştu")
                }
                      
            
            
            self?.showAlertController(title: "Başarılı", message: "Kayıt oluşturuldu") {
                self?.dismiss(animated: true)
            }
            
                
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func showAlertController(title : String , message : String, completion : (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }

}
