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

    var drawerTransitionDelegate = KMDrawerTransitionDelegate()
    var drawerState: KMDrawerState = .None

    var centerController: UIViewController! {
        willSet {
            self.removeChildController(self.centerController)
        }
        didSet {
            if let controller = self.centerController {
                self.addChildViewController(controller)
                controller.view.frame = self.view.bounds
                self.view.addSubview(controller.view)
                controller.didMoveToParentViewController(self)
            }
        }
    }

    var leftController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        /*
        let gesture = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
        gesture.delegate = self
        self.view.addGestureRecognizer(gesture)
        */
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

    func removeChildController(controller: UIViewController?) {
        if let controller = controller {
            controller.view.removeFromSuperview()
            controller.removeFromParentViewController()
        }
    }

    func handleTapGesture(gesture: UIGestureRecognizer) {
        if self.view.isEqual(gesture.view) {
            self.toggleDrawer(.None)
        }
    }

    func toggleDrawer(state: KMDrawerState) {
        if state == self.drawerState { return }
        switch state {
        case .Left:
            if let controller = self.leftController {
                controller.transitioningDelegate = self.drawerTransitionDelegate
                controller.modalPresentationStyle = .Custom
                self.presentViewController(controller, animated: true, completion: {
                    self.drawerState = state
                    self.addChildViewController(controller)
                    controller.didMoveToParentViewController(self)
                })
            }
        default:
            switch self.drawerState {
            case .Left:
                if let controller = self.leftController {
                    controller.willMoveToParentViewController(nil)
                    controller.removeFromParentViewController()
                    controller.dismissViewControllerAnimated(true, completion: {
                        self.drawerState = state
                    })
                }
            default:
                break
            }
        }
    }

    // MARK: - UIGestureRecognizerDelegate
    /*
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return self.view.isEqual(touch.view)
    }
    */
}

extension UIViewController {
    var drawerController: KMDrawerController? {
        var parent: UIViewController? = self.parentViewController
        while (parent != nil) {
            if (parent is KMDrawerController) {
                return parent as? KMDrawerController
            }
            parent = parent?.parentViewController
        }
        return nil
    }
}
