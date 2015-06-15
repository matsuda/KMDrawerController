//
//  KMDrawerController.swift
//  KMDrawerController
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

enum KMDrawerState {
    case None, Left
}

class KMDrawerController: UIViewController, UIGestureRecognizerDelegate {

    let drawerTransitionDelegate = KMDrawerTransitionDelegate()
    var drawerState: KMDrawerState = .None
    var drawerLength: CGFloat = 200 {
        didSet {
            if let controller = self.leftController {
                var f = controller.view.frame
                f.size.width = self.drawerLength
                controller.view.frame = f
                controller.view.setNeedsLayout()
            }
        }
    }

    var leftController: UIViewController? {
        willSet {
            if let controlelr = self.leftController {
                controlelr.view.removeFromSuperview()
                controlelr.removeFromParentViewController()
            }
        }
        didSet {
            if let controller = self.leftController {
                self.addChildViewController(controller)
                var f = controller.view.frame
                f.size.width = self.drawerLength
                controller.view.frame = f
                self.view.addSubview(controller.view)
                controller.didMoveToParentViewController(self)
            }
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        let gesture = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
        gesture.delegate = self
        self.view.addGestureRecognizer(gesture)
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

    func initialize() {
        self.transitioningDelegate = self.drawerTransitionDelegate
        self.modalPresentationStyle = .Custom
    }

    func handleTapGesture(gesture: UIGestureRecognizer) {
        if self.view.isEqual(gesture.view) {
            self.toggleDrawer(.None, sender: nil)
        }
    }

    func toggleDrawer(state: KMDrawerState, sender: UIViewController?) {
        if state == self.drawerState { return }
        switch state {
        case .Left:
            if let sender = sender {
                sender.presentViewController(self, animated: true, completion: { () -> Void in
                    self.drawerState = .Left
                })
            }
        default:
            let completion: Void -> Void = {
                self.drawerState = .None
            }
            if let sender = sender {
                sender.dismissViewControllerAnimated(true, completion: completion)
            } else {
                self.presentingViewController?.dismissViewControllerAnimated(true, completion: completion)
            }
        }
    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return self.view.isEqual(touch.view)
    }
}
