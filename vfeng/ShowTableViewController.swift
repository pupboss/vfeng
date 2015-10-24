//
//  ShowTableViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/25/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit
import Alamofire

class ShowTableViewController: BaseTableViewController {

    var foodArr = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "foodcell")
        
        self.tableView.rowHeight = 101

        MBProgressHUD.showMessage(Constants.Notification.LOADING)
        
        Alamofire.request(.GET, Constants.ROOT_URL + "information/food").responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            MBProgressHUD.hideHUD()
            
            if let arr = response.result.value as? Array<Array<String>> {
                
                self.foodArr = arr
                
                self.tableView.reloadData()
            } else {
                
                MBProgressHUD.showError(Constants.Notification.NET_ERROR)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.foodArr.count
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)
        
        self.performSegueWithIdentifier("show2detail", sender: self.foodArr[indexPath.row])
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("foodcell") as! FoodTableViewCell
        
        let arr: Array<String> = self.foodArr[indexPath.row] as! Array<String>
        
        cell.imgView.image = UIImage.init(data: NSData.init(contentsOfURL: NSURL(string: arr[0])!)!)
        cell.nameLabel.text = arr[1]
        cell.rewardLabel.text = arr[3]
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let con = segue.destinationViewController as! ShowDetailViewController
        
        con.detailArr = sender as! Array<String>
    }
    

}
