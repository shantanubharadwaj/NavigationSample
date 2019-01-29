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
    private var roundCount: Int = 0 {
        didSet {
            navigationItem.title = "Round \(roundCount) / 5"
        }
    }
    
    private var difficultyLevel: Int = 3
    private var activeField: UITextField?
    
    private var oldContentInset = UIEdgeInsets.zero
    private var oldIndicatorInset = UIEdgeInsets.zero
    private var oldOffset = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        let descriptor = UIFontDescriptor(name: "Arial", size: 20)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(descriptor: descriptor, size: 20)]
        registerForKeyboardNotifications()
        configureViewElements()
        configureViewWithNewSet()
//        startTimer()
    }
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: view.bounds)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let containerView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let timerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        view.layer.cornerRadius = 50
        return view
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = "00:30"
        return label
    }()
    
    let captchaImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return iv
    }()
    
    lazy var answerField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Answer"
        tf.borderStyle = .roundedRect
        tf.delegate = self
        return tf
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return button
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        deregisterForKeyboardNotifications()
    }
    
    @objc func handleSubmit() {
        
    }
    
    @objc func keyboardWasShown(_ notification: Notification) {
        oldContentInset = scrollView.contentInset
        oldIndicatorInset = scrollView.scrollIndicatorInsets
        oldOffset = scrollView.contentOffset
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.scrollIndicatorInsets.bottom = keyboardSize.height
//            var aRect = view.frame
//            aRect.size.height -= keyboardSize.height
//            if let activeField = self.activeField {
//                if (!aRect.contains(activeField.frame.origin)){
//                    scrollView.scrollRectToVisible(activeField.frame, animated: true)
//                }
//            }
        }

//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if let activeField = self.activeField {
//                if activeField.frame.origin.y > keyboardSize.origin.y {
//                    view.frame.origin.y = keyboardSize.origin.y - activeField.center.y - 20
//                }
//            }
//        }
    }
    
    @objc func keyboardWillBeHidden(_ notification: Notification) {
//        view.frame.origin.y = 0
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize.height, right: 0.0)
//            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
//            scrollView.contentOffset = oldOffset
        }
        scrollView.contentInset = oldContentInset
//        scrollView.scrollIndicatorInsets = oldIndicatorInset
        scrollView.contentOffset = oldOffset
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func deregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureViewElements() {
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        scrollView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true

        containerView.addSubview(timerView)
        timerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        timerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50).isActive = true
        timerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        timerView.addSubview(timerLabel)
        timerLabel.centerXAnchor.constraint(equalTo: timerView.centerXAnchor).isActive = true
        timerLabel.centerYAnchor.constraint(equalTo: timerView.centerYAnchor).isActive = true
        
        containerView.addSubview(captchaImageView)
        captchaImageView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 70).isActive = true
        captchaImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 50).isActive = true
        captchaImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -50).isActive = true
        captchaImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        containerView.addSubview(answerField)
        answerField.topAnchor.constraint(equalTo: captchaImageView.bottomAnchor, constant: 50).isActive = true
        answerField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 50).isActive = true
        answerField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -50).isActive = true
        
        containerView.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: answerField.bottomAnchor, constant: 40).isActive = true
        submitButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 50).isActive = true
        submitButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -50).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
 
    }
    
    override func viewWillLayoutSubviews() {
        scrollView.contentSize = CGSize(width: containerView.bounds.size.width, height: containerView.bounds.size.height)
    }
    
    func configureViewWithNewSet() {
        if isRoundAvailable {
            print("New Round")
        }else{
            print("Game Over")
        }
    }
    
    var isRoundAvailable: Bool {
        if roundCount < 5 {
            roundCount += 1
            return true
        }
        return false
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

extension GameViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeField?.resignFirstResponder()
        activeField = nil
        return true
    }
}
