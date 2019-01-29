//
//  MainViewController.swift
//  CustomNavigation
//
//  Created by Shantanu Dutta on 1/28/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        configureView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let gameHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let descriptor = UIFontDescriptor().withFamily("Arial").withSymbolicTraits(.traitBold) ?? UIFontDescriptor().withFamily("Arial")
        label.font = UIFont(descriptor: descriptor, size: 40)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "CAPTCHA KING"
        return label
    }()
    
    let newGameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("New Game", for: UIControl.State.normal)
        button.setTitleColor(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.addTarget(self, action: #selector(handleNewGame), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNewGame(){
        let gameController = GameViewController()
        let navigationController = UINavigationController(rootViewController: gameController)
        
        
        UIView.transition(with: self.view, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.view.addSubview(navigationController.view)
            self.addChild(navigationController)
            navigationController.didMove(toParent: self)
        }, completion: nil)
    }
    
    func configureView() {
        view.addSubview(gameHeaderLabel)
        gameHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gameHeaderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        view.addSubview(newGameButton)
        newGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        newGameButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        newGameButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        newGameButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
