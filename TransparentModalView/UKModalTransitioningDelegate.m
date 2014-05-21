//
//  UKModalTransitioningDelegate.m
//  TransparentModalView
//
//  Created by Leszek Kaczor on 21.05.2014.
//  Copyright (c) 2014 Untitled Kingdom. All rights reserved.
//

#import "UKModalTransitioningDelegate.h"

static NSTimeInterval animationDuration = 0.4f;

@interface UKModalTransitioningDelegate()

@property (nonatomic) BOOL presenting;

@end

@implementation UKModalTransitioningDelegate

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.presenting = YES;
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.presenting = NO;
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return animationDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    
    void (^animationBlock)();
    
    if (self.presenting)
    {
        toViewController.view.alpha = 0.0f;
        [containerView addSubview:fromViewController.view];
        [containerView addSubview:toViewController.view];
        
        animationBlock = ^(){
            toViewController.view.alpha = 1.0f;
        };
    } else {
        [containerView addSubview:toViewController.view];
        [containerView addSubview:fromViewController.view];
        
        animationBlock = ^(){
            fromViewController.view.alpha = 0.0f;
        };
    }
    
    void (^completion)(BOOL) = ^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    };
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:animationBlock
                     completion:completion];
}


@end
