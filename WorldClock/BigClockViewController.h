//
//  BigClockViewController.h
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigClockViewController : UIViewController

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, strong) NSTimeZone *timeZone;

@end
