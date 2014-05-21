//
//  UKCustomModalSegue.m
//  TransparentModalView
//
//  Created by Leszek Kaczor on 21.05.2014.
//  Copyright (c) 2014 Untitled Kingdom. All rights reserved.
//

#import "UKCustomModalSegue.h"

@implementation UKCustomModalSegue

- (void)perform
{
    UIViewController * sourceViewController = self.sourceViewController;
    UIViewController * modalViewController = self.destinationViewController;
    UINavigationController * navCon = sourceViewController.navigationController;
    
    UIModalPresentationStyle prevStyle = navCon.modalPresentationStyle;
    [navCon setModalPresentationStyle:UIModalPresentationCurrentContext];
    [sourceViewController presentViewController:modalViewController animated:NO completion:nil];
    [navCon setModalPresentationStyle:prevStyle];
}

@end
