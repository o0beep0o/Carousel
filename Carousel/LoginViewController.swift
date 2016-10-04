//
//  LoginViewController.swift
//  Carousel
//
//  Created by Parker, Bryan on 10/1/16.
//  Copyright © 2016 Parker, Bryan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var loginButtonParentView: UIView!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var indicatorSignIn: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var initialLoginButtonY: CGFloat!
    var offsetLoginButton: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.loginScrollView.delegate = self
        loginScrollView.contentSize = loginScrollView.frame.size
        initialLoginButtonY = loginButtonParentView.frame.origin.y
        offsetLoginButton = -130
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display

            self.loginScrollView.contentInset.bottom = 120
            self.loginButtonParentView.frame.origin.y = self.initialLoginButtonY + self.offsetLoginButton
            self.loginScrollView.contentOffset.y = self.loginScrollView.contentInset.bottom
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide

            self.loginButtonParentView.frame.origin.y = self.initialLoginButtonY
            self.loginScrollView.contentInset.bottom = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didPressBack(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }

    @IBAction func didTapLogin(_ sender: AnyObject) {
        view.endEditing(true)
    }

    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
    @IBAction func didPressSignIn(_ sender: AnyObject) {
        if self.emailField.text!.isEmpty || self.passwordField.text!.isEmpty {
            let alertController = UIAlertController(title: "Email & Password Required", message: "Please enter your information.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true) {
            }
        } else {
            
            self.indicatorSignIn.startAnimating()
            
            let secondsToDelay = 2.0
            run(after: secondsToDelay) {
                if self.emailField.text == "parker" && self.passwordField.text == "pass" {
                    self.performSegue(withIdentifier: "pushSignIn", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid Email and Password", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true) {
                    }
                }
            }
        }
    }
}
