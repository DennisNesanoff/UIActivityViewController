//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by Dennis Nesanoff on 01.01.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        createButton()
    }
    
    // MARK: -Method
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "Enter text to share"
        textField.delegate = self
        view.addSubview(textField)
    }
    
    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        buttonShare.setTitle("Share", for: .normal)
        buttonShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        view.addSubview(buttonShare)
    }
    
    @objc func handleShare() {
        let text = textField.text
        
        if text?.count == 0 {
            let message = "Input text and pressed button"
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(alertAction)
            present(alert, animated: true)
        }
        
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        present(activityViewController!, animated: true)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


