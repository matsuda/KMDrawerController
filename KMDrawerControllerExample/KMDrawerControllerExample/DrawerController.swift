//
//  DrawerController.swift
//  KMDrawerControllerExample
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class DrawerController: KMDrawerController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.centerController = self.storyboard?.instantiateViewControllerWithIdentifier("RootNavigation")
        self.leftController = MenuController(style:.Grouped)
        self.drawerTransitionDelegate = self
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

    // MARK: - UIViewControllerTransitioningDelegate

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = KMDrawerAnimator(presenting: true)
        animator.drawerRatio = 0.8
        return animator
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return KMDrawerAnimator(presenting: false)
    }

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return KMDrawerPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
