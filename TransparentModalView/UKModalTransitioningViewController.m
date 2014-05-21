//
//  UKModalTransitioningViewController.m
//  TransparentModalView
//
//  Created by Leszek Kaczor on 21.05.2014.
//  Copyright (c) 2014 Untitled Kingdom. All rights reserved.
//

#import "UKModalTransitioningViewController.h"
#import "UKModalTransitioningDelegate.h"

@interface UKModalTransitioningViewController ()

@end

@implementation UKModalTransitioningViewController

#pragma mark - Initializations
- (id)init
{
    self = [super init];
    if (self)
    {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.modalTransitioningDelegate = [[UKModalTransitioningDelegate alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.modalTransitioningDelegate = [[UKModalTransitioningDelegate alloc] init];
    }
    return self;
}

#pragma mark - Custom accessors
- (void)setModalTransitioningDelegate:(UKModalTransitioningDelegate *)modalTransitioningDelegate
{
    _modalTransitioningDelegate = modalTransitioningDelegate;
    self.transitioningDelegate = modalTransitioningDelegate;
}

#pragma mark - IBActions
- (IBAction)viewTapAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
