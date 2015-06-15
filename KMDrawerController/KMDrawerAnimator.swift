//
//  KMDrawerAnimator.swift
//  KMDrawerController
//
//  Created by Kosuke Matsuda on 2015/06/15.
//  Copyright (c) 2015年 matsuda. All rights reserved.
//

import UIKit

class KMDrawerAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var duration: NSTimeInterval = 0.5
    var presenting: Bool = false

    init(presenting: Bool) {
        self.presenting = presenting
        super.init()
    }

    // MARK: - UIViewControllerAnimatedTransitioning

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return self.duration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if self.presenting {
            self.animatePresentation(transitionContext)
        } else {
            self.animateDismissal(transitionContext)
        }
    }

    func animatePresentation(transitionContext: UIViewControllerContextTransitioning) {
        let source = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let destination = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let container = transitionContext.containerView()

        let endFrame = transitionContext.finalFrameForViewController(source)
        container.addSubview(destination.view)

        var startFrame = endFrame
        startFrame.origin.x -= endFrame.size.width
        destination.view.frame = startFrame
        // destination.view.layoutIfNeeded()

        /*
        let destinationSS = destination.view.snapshotViewAfterScreenUpdates(true)
        destinationSS.frame = startFrame
        container.addSubview(destinationSS)
        */

        // source.beginAppearanceTransition(false, animated: true)
        let duration = self.transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: {
            // source.view.tintAdjustmentMode = .Dimmed
            destination.view.frame = endFrame
        }) { (finished: Bool) -> Void in
            // destinationSS.removeFromSuperview()
            // container.addSubview(destination.view)
            // source.endAppearanceTransition()
            transitionContext.completeTransition(finished)
        }
    }

    func animateDismissal(transitionContext: UIViewControllerContextTransitioning) {
        let source = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        // let destination = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!

        let startFrame = transitionContext.initialFrameForViewController(source)
        var endFrame = startFrame
        endFrame.origin.x -= endFrame.size.width

        source.view.frame = startFrame
        // source.view.layoutIfNeeded()

        // destination.beginAppearanceTransition(true, animated: true)
        let duration = self.transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: nil, animations: {
            // destination.view.tintAdjustmentMode = .Automatic
            source.view.frame = endFrame
        }) { (finished: Bool) -> Void in
            // destination.view.userInteractionEnabled = true
            // destination.endAppearanceTransition()
            transitionContext.completeTransition(finished)
        }
    }
}
