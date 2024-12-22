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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    private func setupUI() {
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

