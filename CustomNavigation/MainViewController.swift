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
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
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
        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        label.text = "CAPTCHA KING"
        return label
    }()
    
    let newGameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("New Game", for: UIControl.State.normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        button.addTarget(self, action: #selector(handleNewGame), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNewGame(){
        print("Button tapped")
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
