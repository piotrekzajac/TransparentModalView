//
//  UKCustomModalSegue.m
//  TransparentModalView
//
//  Created by Leszek Kaczor on 21.05.2014.
//  Copyright (c) 2014 Untitled Kingdom. All rights reserved.
//

#import "UKCustomModalSegue.h"

static CGFloat animationDuration = 0.4f;

@implementation UKCustomModalSegue

- (void)perform
{
    UIViewController * sourceViewController = self.sourceViewController;
    UIViewController * modalViewController = self.destinationViewController;
    UINavigationController * navCon = sourceViewController.navigationController;
    
    UIWindow * mainWindow = [[[UIApplication sharedApplication] windows] firstObject];

    [mainWindow addSubview:modalViewController.view];
    CGPoint modalCenter = modalViewController.view.center;
    modalCenter.y += [[UIScreen mainScreen] bounds].size.height;
    modalViewController.view.center = modalCenter;
    
    [UIView animateWithDuration:animationDuration animations:^{
        modalViewController.view.center = sourceViewController.view.center;
    } completion:^(BOOL finished) {
        [modalViewController.view removeFromSuperview];
        UIModalPresentationStyle prevStyle = navCon.modalPresentationStyle;
        [navCon setModalPresentationStyle:UIModalPresentationCurrentContext];
        [sourceViewController setModalPresentationStyle:UIModalPresentationCurrentContext];
        [sourceViewController presentViewController:modalViewController animated:NO completion:nil];
        [navCon setModalPresentationStyle:prevStyle];
    }];
}

@end
