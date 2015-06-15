//
//  ViewController.swift
//  KMDrawerControllerExample
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let drawerController = KMDrawerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let leftButton = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "showLeft:")
        self.navigationItem.leftBarButtonItem = leftButton
        self.drawerController.leftController = MenuController(style:.Grouped)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showLeft(sender: UIBarButtonItem) {
        let controller = self.drawerController
        controller.toggleDrawer(.Left, sender: self)
    }
}

