//
//  UIDigitalClockLabel.m
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "UIDigitalClockLabel.h"

@implementation UIDigitalClockLabel

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initDefaults];
    }
    
    return self;
}

- (id)init{
    return [self initWithFrame:CGRectZero];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self initDefaults];
}

- (void)timerFired:(id)sender
{
    NSDate *time = [NSDate date];
    static NSCalendar *gregorian;
    
    if (!gregorian) gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    if (self.timeZone) {
        [gregorian setTimeZone:self.timeZone];
    }
    NSDateComponents *weekdayComponents =
    [gregorian components:(NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:time];
    
    self.hours = [weekdayComponents hour];
    self.minutes = [weekdayComponents minute];
    self.seconds = [weekdayComponents second];
    self.text = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", (int)self.hours, (int)self.minutes, (int)self.seconds];
    [self setNeedsDisplay];
    
}



- (void)initDefaults{
    
    self.hours = 9;
    self.minutes = 41;
    self.seconds = 30;
    
    CADisplayLink *animationTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerFired:)];
    animationTimer.frameInterval = 8.0;
    [animationTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}


@end
