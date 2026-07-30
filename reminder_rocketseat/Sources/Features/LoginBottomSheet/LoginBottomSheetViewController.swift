//
//  LogginBottomSheetViewController.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 17/07/26.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    let contentView: LoginBottomSheetView
    let viewModel = LoginBottomSheetViewModel()
    public weak var coordinatorDelegate: LoginBottomSheetCoordinatorDelegate?
    
    var handleAreaHeight: CGFloat = 50.0
    
    init(contentView:LoginBottomSheetView, coordinatorDelegate: LoginBottomSheetCoordinatorDelegate) {
        self.contentView = contentView
        self.coordinatorDelegate = coordinatorDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    // MARK: - UI Setup
    private func setupUI(){
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    /// Configura a closure da viewModel para ela saber o que fazer quando essa variávei for acionada
    private func bindViewModel() {
        viewModel.succesResult = { [weak self] username in
            
            self?.presentSaveLoginAlert(email: username)
        }
    }
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: "Salvar acesso",
                                                message: "Deseja salvar seu acesso?",
                                                preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar",
                                       style: .default) { _ in
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.saveUser(user: user)
            self.coordinatorDelegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .cancel) { _ in
            self.coordinatorDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    private func setupGesture(){
        
    }
    
    private func handlePanGesture(){
        
    }
    
    /// Recebe por parametro uma closure denominada completion (i.e., algo que complementa a função, que gera um efeito de ação em cascata)
    func animateShow(completion: (()-> Void)? = nil){
        self.view.layoutIfNeeded() /// Força a atualização do layout para poder ler a altura correta de loginView na sequencia
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height) /// Transformação de translação (move a view de login para baixo o mesmo tanto de sua altura (ou seja, até ela desaparecer) sem alterar suas constraints) -> força a view a "nascer" deslocada/escondida
        
        /// Consolida o movimento : retorna a view para a posição original das constraints de forma animada com duração de 0.3 segundos
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(username: user, password: password)
    }
}
