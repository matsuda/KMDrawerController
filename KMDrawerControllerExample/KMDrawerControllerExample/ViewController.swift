//
//  ViewController.swift
//  KMDrawerControllerExample
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let leftButton = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "showLeft:")
        self.navigationItem.leftBarButtonItem = leftButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showLeft(sender: UIBarButtonItem) {
        if let controller = self.drawerController {
            controller.toggleDrawer(.Left)
        }
    }
}

