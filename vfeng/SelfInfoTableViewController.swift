//
//  SelfInfoTableViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/24/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit
import Alamofire

class SelfInfoTableViewController: BaseTableViewController {

    var infoArr = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getSelfInfoFromServer()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "infocell")
    }

    func getSelfInfoFromServer() -> Void {
        
        MBProgressHUD.showMessage(Constants.Notification.LOADING)
        
        Alamofire.request(.GET, Constants.ROOT_URL + "account/" + Constants.UserInfo.USER_NAME).responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            MBProgressHUD.hideHUD()
            
            if let arr = response.result.value as? Array<AnyObject> {
                
                self.infoArr = arr
                
                self.tableView.reloadData()
            } else {
                
                MBProgressHUD.showError(Constants.Notification.NET_ERROR)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.infoArr.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("infocell", forIndexPath: indexPath)

        cell.textLabel?.text = self.infoArr[indexPath.row] as? String

        return cell
    }

}
