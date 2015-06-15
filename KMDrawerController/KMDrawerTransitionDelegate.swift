//
//  KMDrawerTransitionDelegate.swift
//  KMDrawerController
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class KMDrawerTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    // MARK: - UIViewControllerTransitioningDelegate

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return KMDrawerAnimator(presenting: true)
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return KMDrawerAnimator(presenting: false)
    }

}
