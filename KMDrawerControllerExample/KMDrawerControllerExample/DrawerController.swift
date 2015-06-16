//
//  DrawerController.swift
//  KMDrawerControllerExample
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class DrawerController: KMDrawerController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.centerController = self.storyboard?.instantiateViewControllerWithIdentifier("RootNavigation") as! UIViewController
        self.leftController = MenuController(style:.Grouped)
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
