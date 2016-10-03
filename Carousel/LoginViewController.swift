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
    
    var initialLoginButtonY: CGFloat!
    var offsetLoginButton: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loginScrollView.delegate = self
        self.loginScrollView.contentInset.bottom = 120
        initialLoginButtonY = loginButtonParentView.frame.origin.y
        offsetLoginButton = -120
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display

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
        // Dispose of any resources that can be recreated.
    }    

    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
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
