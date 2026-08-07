//
//  HomeViewController.swift
//  reminder_rocketseat
//
//  Created by Ana Julia Molinos Leite Da Silva on 03/08/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    public weak var coordinatorDelegate: HomeCoordinatorDelegate?
    
    init(contentView: HomeView, coordinatorDelegate: HomeCoordinatorDelegate) {
        self.contentView = contentView
        self.coordinatorDelegate = coordinatorDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindView()
        setup()
    }
    
    private func setupBindView() {
        
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.gray600
        buildHierarchy()
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: self.contentView)
    }
}
