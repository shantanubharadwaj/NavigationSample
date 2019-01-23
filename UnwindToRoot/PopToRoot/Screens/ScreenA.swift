//
//  ScreenA.swift
//  UnwindToRoot
//
//  Created by Shantanu Dutta on 1/23/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class ScreenA: UIViewController {
    
    let store = DataFactory.instance.dataStore()
    @IBOutlet weak var buttonA: UIButton!
    let label: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont(name: "Arial", size: 110)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 20)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Screen A"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Move To Main", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleMoveToMain))
        
        
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(dataLabel)
        dataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dataLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataLabel.text = store.savedValue
    }
    
    @objc func handleMoveToMain(){
        dismiss(animated: true, completion: nil)
    }

    @IBAction func gotoToNextScreen(_ sender: UIButton) {
        let board = UIStoryboard(name: "PushPop", bundle: Bundle.main)
        let vc = board.instantiateViewController(withIdentifier: "ScreenB")
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
