//
//  WorldClockTableViewCell.h
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDigitalClockLabel.h"
#import "AnalogClockView.h"

@interface WorldClockTableViewCell : UITableViewCell

@property (nonatomic, readonly) UILabel *cityLabel;
@property (nonatomic, readonly) UIDigitalClockLabel *digitalClockLabel;
@property (nonatomic, readonly) AnalogClockView *analogClockView;
@property (nonatomic, readwrite) NSTimeZone *timeZone;

@end
