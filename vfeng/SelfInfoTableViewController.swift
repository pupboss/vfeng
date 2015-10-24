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

    let keyArr = ["姓名", "年龄", "性别", "生日", "手机号", "邮箱", "身份证号", "地址", "V标签", "V领域", "密码", "加入日期", "账户是否有效"]
    var infoArr = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getSelfInfoFromServer()
        
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

        cell.textLabel?.text = self.keyArr[indexPath.row]
        cell.detailTextLabel?.text = self.infoArr[indexPath.row] as? String

        return cell
    }

}
