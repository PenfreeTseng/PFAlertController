//
//  PFAlertPopTransition.m
//  ZMKou
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 Duma. All rights reserved.
//

#import "PFAlertPopTransition.h"
#import "PFAlertController.h"

#define kBGAlpha 0.3f

@implementation PFAlertPopTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    PFAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.bgView.alpha = 0;
    toVC.alertView.alpha = 0;
    toVC.alertView.transform = CGAffineTransformMakeScale(0, 0);
    //
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    //
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.bgView.alpha = kBGAlpha;
                         toVC.alertView.alpha = 1;
                         toVC.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}
@end
