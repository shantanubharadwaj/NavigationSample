//
//  ScreenB.swift
//  UnwindToRoot
//
//  Created by Shantanu Dutta on 1/23/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class ScreenB: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "B"
        label.font = UIFont(name: "Arial", size: 110)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Screen B"
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @IBAction func gotoNextScreen(_ sender: UIButton) {
        let board = UIStoryboard(name: "PushPop", bundle: Bundle.main)
        let vc = board.instantiateViewController(withIdentifier: "ScreenC")
        show(vc, sender: self)
//        present(vc, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
