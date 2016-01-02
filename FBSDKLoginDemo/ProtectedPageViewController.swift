//
//  ProtectedPageViewController.swift
//  FBSDKLoginDemo
//
//  Created by Lupti on 1/1/16.
//  Copyright © 2016 lupti. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ProtectedPageViewController: UIViewController {

    @IBAction func logoutButtonTapped(sender: AnyObject) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        // User session is killed
        let loginPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        let loginPageNav = UINavigationController(rootViewController: loginPage)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginPageNav
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
