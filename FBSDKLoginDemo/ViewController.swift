//
//  ViewController.swift
//  FBSDKLoginDemo
//
//  Created by Lupti on 1/1/16.
//  Copyright © 2016 lupti. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate{

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("User is not Logged in")
        } else {
            print("User is logged in.")
        }
        
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        
    }
/* Absoultely required FB login function*/
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        guard error == nil else {
            print(error.localizedDescription)
            return
        }
        
        guard result.token != nil else {
            return
        }
            print("Token is \(FBSDKAccessToken.currentAccessToken().tokenString)")
            print("User ID is \(FBSDKAccessToken.currentAccessToken().userID)")
            print("App ID is \(FBSDKAccessToken.currentAccessToken().appID)")
        
        displayNextView("ProtectedPageViewController")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        guard FBSDKAccessToken.currentAccessToken() != nil else {
            return
        }
        
        displayNextView("ProtectedPageViewController")
    }

/* Another Required FB function holder */
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
     /* This function is required by the FBSDKLogin but not necessary implement here. */
        print("loginButtonDidLogOut(loginButton: FBSDKLoginButton!)")
        print("*** User Did Logout!")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayNextView(identifier: String) {
        
        let protectedPage = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! ProtectedPageViewController
        
        let protectedPageNav = UINavigationController(rootViewController: protectedPage)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = protectedPageNav
    }

}

