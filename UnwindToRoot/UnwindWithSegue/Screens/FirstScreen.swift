//
//  FirstScreen.swift
//  UnwindToRoot
//
//  Created by Shantanu Dutta on 1/23/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class FirstScreen: UIViewController {

    var dataPassed = "Lets Get Started !"
    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextStory(_ sender: UIBarButtonItem) {
        let board = UIStoryboard(name: "PushPop", bundle: Bundle.main)
        let vc = board.instantiateViewController(withIdentifier: "ScreenA")
        let rootVC = UINavigationController(rootViewController: vc)
        present(rootVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        dataLabel.text = dataPassed
    }
    
    func setupView() {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    @IBAction func unwindSegueToHome(segue: UIStoryboardSegue){}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
