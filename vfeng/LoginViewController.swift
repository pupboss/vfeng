//
//  LoginViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/24/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController {

    
    var userId = ""
    var password = ""
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.USER_NAME_KEY) == "" || CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.PASSWORD_KEY) == "") {
            
        } else {
            
            userId = CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.USER_NAME_KEY)
            password = CommonTools.getUserDefaultValueForKey(Constants.UserInfoKey.PASSWORD_KEY)
            
            self.userNameTextField.text = userId
            self.passwordTextField.text = password
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitEditing() {
        
        self.view.endEditing(true)
    }
    
    @IBAction func loginAction() {
        
        MBProgressHUD.showMessage(Constants.Notification.LOADING)
        
        self.userId = self.userNameTextField.text!
        self.password = self.passwordTextField.text!
        
        if (self.userId.length + self.password.length <= 7) {
            
            MBProgressHUD.showError("补全信息后再登录")
            return
        }
        
        
        let param = [
            "username": self.userId,
            "password": self.password
        ]
        
        Alamofire.request(.POST, Constants.ROOT_URL + "account", parameters: param).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            MBProgressHUD.hideHUD()
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if dict["status"] as! Bool {
                
                    MBProgressHUD.showSuccess("登录成功")
                    self.dismissViewControllerAnimated(true, completion: nil)
                    CommonTools.storeUserDefaultValueForKey(Constants.UserInfoKey.USER_NAME_KEY, value: self.userNameTextField.text!)
                    CommonTools.storeUserDefaultValueForKey(Constants.UserInfoKey.PASSWORD_KEY, value: self.passwordTextField.text!)
                    
                    Constants.UserInfo.USER_NAME = self.userId
                } else {
                    
                    MBProgressHUD.showError(Constants.Notification.NET_ERROR)
                }
                
            } else {
                
                MBProgressHUD.showError(Constants.Notification.NET_ERROR)
            }
        }
    }
}
