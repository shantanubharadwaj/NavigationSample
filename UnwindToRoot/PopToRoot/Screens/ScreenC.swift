//
//  ScreenC.swift
//  UnwindToRoot
//
//  Created by Shantanu Dutta on 1/23/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class ScreenC: UIViewController {

    var delegate: PassInfoDelegate = DataFactory.instance.dataStore()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "C"
        label.font = UIFont(name: "Arial", size: 110)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Screen C"
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoHome(_ sender: UIButton) {
        delegate.info("This is the passed value")
        self.navigationController?.popToRootViewController(animated: true)
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
