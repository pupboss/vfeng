//
//  ShowDetailViewController.swift
//  vfeng
//
//  Created by Li Jie on 10/25/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {

    var detailArr: Array<String> = []
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var rewardLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgView.image = UIImage.init(data: NSData.init(contentsOfURL: NSURL(string: self.detailArr[0])!)!)
        self.nameLabel.text = detailArr[1]
        self.rewardLabel.text = detailArr[3]
        self.infoLabel.text = detailArr[2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
