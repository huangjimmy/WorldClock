//
//  WorldClockTableViewCell.m
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "WorldClockTableViewCell.h"

@implementation WorldClockTableViewCell

@synthesize timeZone = _timeZone;

- (UILabel*)cityLabel{
    return (UILabel*)[self.contentView viewWithTag:1];
}

- (UIDigitalClockLabel*)digitalClockLabel{
    return (UIDigitalClockLabel*)[self.contentView viewWithTag:2];
}

- (AnalogClockView*)analogClockView{
    return (AnalogClockView*)[self.contentView viewWithTag:3];
}

- (NSTimeZone*)timeZone{
    return _timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone{
    _timeZone = timeZone;
    self.digitalClockLabel.timeZone = timeZone;
    self.analogClockView.timeZone = timeZone;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    if (animated) {
        
        __weak typeof(self) myself = self;
        
        [UIView animateWithDuration:0.3 animations:^{
            myself.analogClockView.hidden = editing;
        }];
    }
    else{
        self.analogClockView.hidden = editing;
    }
    
}


@end
