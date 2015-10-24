//
//  BaseTableViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/24/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
    }
}
