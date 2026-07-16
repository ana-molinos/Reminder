//
//  SplashView.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 09/07/26.
//

import Foundation
import UIKit

class SplashView: UIView{
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    init(){
        super.init(frame: .zero)
        
        setupUI()
    }
    
    // Init padrão para caso algo de errado
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(logoImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
