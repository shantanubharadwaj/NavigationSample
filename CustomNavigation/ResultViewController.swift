//
//  ResultViewController.swift
//  CustomNavigation
//
//  Created by Shantanu Dutta on 1/28/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        navigationItem.title = "Result"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleMoveToHome))
    }
    
    @objc func handleMoveToHome(){
        print("handleMoveToHome")
        if let controller  = navigationController {
            controller.willMove(toParent: nil)
            let parent = controller.parent
            parent?.view.alpha = 0
            parent?.view.layoutIfNeeded()
            print("Date : \(Date())")
            UIView.animate(withDuration: 0.2, delay: 0.1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: {
                parent?.view.alpha = 1.0
                controller.view.alpha = 0
            }) { (finishhed) in
                print("anime com : \(Date())")
                controller.view.removeFromSuperview()
                controller.removeFromParent()
            }
        }
    }
    
}
