//
//  MyShopingListViewController.swift
//  SwiftPractice
//
//  Created by Aytaç Bulanık on 1.01.2025.
//

import UIKit

class MyShopingListViewController: UIViewController {
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add List", for: .normal)
        button.backgroundColor = .appGreen
        button.layer.cornerRadius = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .appBackGround
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 80),
            addButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    @objc func addButtonPressed() {
        print("button pressed")
    }
    
    
    
    
    

}
