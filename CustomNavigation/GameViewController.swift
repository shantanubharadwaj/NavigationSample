//
//  GameViewController.swift
//  CustomNavigation
//
//  Created by Shantanu Dutta on 1/28/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9832233787, blue: 0.861335814, alpha: 1)
        navigationItem.title = "Captcha"
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(moveToResult), userInfo: nil, repeats: false)
        timer?.tolerance = 0.2
        
    }
    
    @objc func moveToResult() {
        timer?.invalidate()
        
        let resultController = ResultViewController()
        navigationController?.show(resultController, sender: self)
    }
}
