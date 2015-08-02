//
//  UIDigitalClockLabel.h
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDigitalClockLabel : UILabel

@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger hours;

@property (nonatomic, strong) NSTimeZone *timeZone;

@end
