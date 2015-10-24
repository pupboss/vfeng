//
//  MyTableViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/24/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }

    
    @IBAction func jumpToUser() {
        
        self.performSegueWithIdentifier("my2user", sender: nil)
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
