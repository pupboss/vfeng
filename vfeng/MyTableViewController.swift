//
//  MyTableViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/24/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class MyTableViewController: BaseTableViewController {

    @IBOutlet weak var escButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func jumpToUser() {
        
        self.performSegueWithIdentifier("my2user", sender: nil)
    }

    
    @IBAction func logoutAction(sender: UIBarButtonItem) {
        
        let alertController = UIAlertController.init(title: nil, message: "V疯", preferredStyle: .ActionSheet)
        let escAction = UIAlertAction.init(title: "退出登录", style: .Default) { (action: UIAlertAction) -> Void in
            
            self.performSegueWithIdentifier("my2login", sender: nil)
        }
        
        
        alertController.addAction(escAction)
        
        let cancelAction = UIAlertAction.init(title: "取消", style: .Cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        alertController.modalPresentationStyle = .Popover
        
        alertController.popoverPresentationController?.barButtonItem = self.escButton;
        alertController.popoverPresentationController?.sourceView = self.view;
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if "" == Constants.UserInfo.USER_NAME {
            
            self.performSegueWithIdentifier("my2login", sender: nil)
            
        } else {
            
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destViewController = segue.destinationViewController
        
        destViewController.hidesBottomBarWhenPushed = true
    }
    

}
