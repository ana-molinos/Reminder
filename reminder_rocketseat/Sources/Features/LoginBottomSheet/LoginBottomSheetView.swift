//
//  LogginBottomSheetView.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 17/07/26.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView{
    
    private let handleArea: UIView = {
        let view = UIView()
        
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = Constants.little
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let title: UILabel = {
        let textBox = UILabel()
        
        textBox.text = "Entre para acessar suas receitas"
        textBox.font = Typography.subheading
        textBox.translatesAutoresizingMaskIntoConstraints = false
        
        return textBox
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        
        text.placeholder = "email@exemplo.com"
        text.font = Typography.input
        text.textColor = Colors.gray200
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = Typography.subheading
        button.backgroundColor = Colors.redBase
        button.tintColor = Colors.gray800
        button.layer.cornerRadius = 28
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        self.layer.cornerRadius = Constants.small
        
        self.addSubview(handleArea)
        self.addSubview(title)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            title.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Constants.huge),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.big),
            
            emailTextField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: Constants.huge),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.big),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.big),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.big),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.big),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.huge),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.big),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.big),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            
            
        ])
    }
    
}
