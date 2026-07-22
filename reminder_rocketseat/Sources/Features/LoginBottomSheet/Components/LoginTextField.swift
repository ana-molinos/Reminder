//
//  LoginTextField.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 21/07/26.
//

import UIKit

class LoginTextField: UIView{
    var title: String
    var placeholder: String?
    var isPwdTxtField: Bool
    private var titleLabel: UILabel = {
        let textLabel = UILabel()
        
        textLabel.font = Typography.label
        textLabel.textColor = Colors.gray100
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    private var textField: UITextField = {
        let text = UITextField()
        
        text.font = Typography.input
        text.textColor = Colors.gray200
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    init(title: String, placeholder: String? = nil, isPwdTxtField: Bool = false) {
        
        self.title = title
        self.placeholder = placeholder
        self.isPwdTxtField = isPwdTxtField
        
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.titleLabel.text = self.title
        
        if let placeholder = self.placeholder {
            self.textField.placeholder = placeholder
        }
        
        if isPwdTxtField {
            self.textField.isSecureTextEntry = true
        }
        
        self.addSubview(titleLabel)
        self.addSubview(textField)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.spacingLittle),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: Constants.dimensionMedium),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    public func getText() -> String? {
        return textField.text
    }
}
