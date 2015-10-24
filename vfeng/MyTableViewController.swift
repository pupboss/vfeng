//
//  MyTableViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/24/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class MyTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func jumpToUser() {
        
        self.performSegueWithIdentifier("my2user", sender: nil)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if "" == Constants.UserInfo.USER_NAME {
            
            self.performSegueWithIdentifier("my2login", sender: nil)
            
        } else {
            
        }
    }

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destViewController = segue.destinationViewController
        
        destViewController.hidesBottomBarWhenPushed = true
    }
    

}
