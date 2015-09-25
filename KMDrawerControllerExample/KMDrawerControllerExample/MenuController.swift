//
//  MenuController.swift
//  KMDrawerControllerExample
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: CellIdentifier)
        }
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "Cupertino"
        case 1:
            cell?.textLabel?.text = "New York"
        case 2:
            cell?.textLabel?.text = "London"
        default:
            cell?.textLabel?.text = "Tokyo"
        }
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let controller = self.drawerController {
            controller.toggleDrawer(.None)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
