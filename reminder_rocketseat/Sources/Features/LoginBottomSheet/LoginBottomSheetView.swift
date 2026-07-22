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
        view.layer.cornerRadius = Constants.paddingLittle
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let title: UILabel = {
        let textBox = UILabel()
        
        textBox.text = "login.label.title".localized
        textBox.isUserInteractionEnabled = true
        textBox.font = Typography.subheading
        textBox.translatesAutoresizingMaskIntoConstraints = false
        
        return textBox
    }()
    
//    private let emailTextField: UITextField = {
//        let text = UITextField()
//        
//        text.placeholder = "login.email.placeholder".localized
//        text.font = Typography.input
//        text.textColor = Colors.gray200
//        text.borderStyle = .roundedRect
//        text.translatesAutoresizingMaskIntoConstraints = false
//        
//        return text
//    }()
    
    private let emailTextField: LoginTextField = {
        let textField = LoginTextField(title: "login.email.title".localized, placeholder: "login.email.placeholder".localized)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let passwordTextField: LoginTextField = {
        let textField = LoginTextField(title: "login.password.title".localized, placeholder: "senha", isPwdTxtField: true)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
//    private let passwordTextField: UITextField = {
//        let text = UITextField()
//        
//        text.borderStyle = .roundedRect
//        text.isSecureTextEntry = true
//        text.translatesAutoresizingMaskIntoConstraints = false
//        
//        return text
//    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("login.button.title".localized, for: .normal)
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
        
        let exampleGesture = UITapGestureRecognizer(target: self, action: #selector(exampleTaped))
        title.addGestureRecognizer(exampleGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func exampleTaped(){
        print("clicou na label")
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        self.layer.cornerRadius = Constants.paddingSmall
        
        self.addSubview(handleArea)
        self.addSubview(title)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.paddingSmall),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            title.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Constants.spacingMedium),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.paddingBig),
            
            emailTextField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: Constants.spacingMedium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.paddingBig),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.paddingBig),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.spacingSmall),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.paddingBig),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.paddingBig),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.spacingMedium),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.paddingBig),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.paddingBig),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.dimensionMedium)
            
        ])
    }
    
}
