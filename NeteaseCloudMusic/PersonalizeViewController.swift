//
//  PersonalizeViewController.swift
//  NeteaseCloudMusic
//
//  Created by Nirvana on 3/20/16.
//  Copyright © 2016 NSNirvana. All rights reserved.
//

import UIKit

class PersonalizeViewController: UIViewController {
    
    var cycleScrollView: SDCycleScrollView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cycleScrollView = SDCycleScrollView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200) , shouldInfiniteLoop: true, imageNamesGroup: ["placeHolder", "placeHolder", "placeHolder", "placeHolder", "placeHolder"])
        cycleScrollView.bannerImageViewContentMode = .ScaleAspectFill
        cycleScrollView.currentPageDotColor = UIColor.mainColor()
        tableView.tableHeaderView = cycleScrollView
        
        tableView.delegate = self
        tableView.dataSource = self
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

extension PersonalizeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
