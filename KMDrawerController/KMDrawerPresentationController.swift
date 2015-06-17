//
//  KMDrawerPresentationController.swift
//  KMDrawerController
//
//  Created by Kosuke Matsuda on 2015/06/17.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class KMDrawerPresentationController: UIPresentationController {

    var overlay: UIView!

    override func presentationTransitionWillBegin() {
        let containerView = self.containerView

        /*
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        self.containerView.insertSubview(view, atIndex: 0)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.containerView.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|[view]|",
                options: NSLayoutFormatOptions(0),
                metrics: nil, views: ["view": view]))
        self.containerView.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|",
                options: NSLayoutFormatOptions(0),
                metrics: nil, views: ["view": view]))
        */

        let view = UIView(frame: containerView.bounds)
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.0
        containerView.insertSubview(view, atIndex: 0)

        self.overlay = view
        let gesture = UITapGestureRecognizer(target: self, action: "didTapOverlay:")
        view.addGestureRecognizer(gesture)

        self.presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ [unowned self] (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            self.overlay.alpha = 0.5
        }, completion: { [unowned self] (context :UIViewControllerTransitionCoordinatorContext!) -> Void in
        })
    }

    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (context) -> Void in
            self.overlay.alpha = 0.0
        }, completion: { (context) -> Void in
        })
    }

    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.overlay.removeFromSuperview()
        }
    }

    override func containerViewWillLayoutSubviews() {
        self.overlay.frame = self.containerView.bounds
    }

    override func containerViewDidLayoutSubviews() {
    }

    func didTapOverlay(sender: AnyObject) {
        if let drawerController = self.presentingViewController as? KMDrawerController {
            drawerController.toggleDrawer(.None)
        }
        // self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
