//
//  UKModalTransitioningViewController.h
//  TransparentModalView
//
//  Created by Leszek Kaczor on 21.05.2014.
//  Copyright (c) 2014 Untitled Kingdom. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UKModalTransitioningDelegate;
@interface UKModalTransitioningViewController : UIViewController

@property (strong, nonatomic) UKModalTransitioningDelegate * modalTransitioningDelegate;

@end
