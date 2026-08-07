//
//  HomeView.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 03/08/26.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    let profileBackground: UIView = {
        let view = UIView()
        
        view.backgroundColor = Colors.gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = Constants.cornerRadiusSmall
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let avatarImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "Avatar")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "logout_button"), for: .normal)
        button.addTarget(self, action: #selector(logoutButtonDidTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let text = UILabel()
        
        text.text = "home.label.title".localized
        text.font = Typography.input
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let userNameLabel: UILabel = {
        let text = UILabel()
        
        text.text = "home.label.username".localized
        text.font = Typography.heading
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let feebackButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "star")
        
        button.setTitle("home.evaluation.button.label".localized, for: .normal)
        button.backgroundColor = Colors.gray100
        button.titleLabel?.font = Typography.subheading
        button.setImage(icon, for: .normal)
        button.tintColor = Colors.gray800
        button.layer.cornerRadius = Constants.cornerRadiosMedium
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(profileBackground)
        profileBackground.addSubview(avatarImage)
        profileBackground.addSubview(logoutButton)
        profileBackground.addSubview(titleLabel)
        profileBackground.addSubview(userNameLabel)
        
        addSubview(contentBackground)
        contentBackground.addSubview(feebackButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileBackground.topAnchor.constraint(equalTo: self.topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            avatarImage.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: 50 + Constants.paddingBig),
            avatarImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Constants.paddingBig),
            avatarImage.heightAnchor.constraint(equalToConstant: Constants.dimensionMedium),
            
            logoutButton.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: 50 + Constants.paddingBig),
            logoutButton.trailingAnchor.constraint(equalTo: profileBackground.trailingAnchor, constant: -Constants.paddingBig),
            
            titleLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: Constants.spacingSmall),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.paddingBig),
            
            
            userNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.spacingTiny),
            userNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.paddingBig),
            
            contentBackground.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: Constants.spacingMedium),
            contentBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            feebackButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.paddingBig),
            feebackButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.paddingBig),
            feebackButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.paddingHuge),
            feebackButton.heightAnchor.constraint(equalToConstant: Constants.dimensionMedium)
        ])
    }
    
    @objc
    private func logoutButtonDidTapped() {
        
    }
}
