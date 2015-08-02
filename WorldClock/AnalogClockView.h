//
//  AnologClockView.h
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAnalogClockDayBackgroundColor [UIColor colorWithHexString:@"#efeff4"]
#define kAnalogClockDaySecondColor [UIColor colorWithHexString:@"#ff3b30"]
#define kAnalogClockDayMinuteColor [UIColor blackColor]
#define kAnalogClockDayHourColor [UIColor blackColor]
#define kAnalogClockDayTextColor [UIColor blackColor]

#define kAnalogClockNightBackgroundColor [UIColor blackColor]
#define kAnalogClockNightSecondColor [UIColor colorWithHexString:@"#ff3b30"]
#define kAnalogClockNightMinuteColor [UIColor whiteColor]
#define kAnalogClockNightHourColor [UIColor whiteColor]
#define kAnalogClockNightTextColor [UIColor whiteColor]

@interface AnalogClockView : UIView

@property (nonatomic, strong) UIColor *hourHandColor;
@property (nonatomic, strong) UIColor *minuteHandColor;
@property (nonatomic, strong) UIColor *secondHandColor;
@property (nonatomic, strong) UIColor *digitColor;
@property (nonatomic, strong) UIFont *digitFont;
@property (nonatomic, strong) UIColor *clockFaceColor;
@property (nonatomic, assign) BOOL showGraduation;

@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger hours;

@property (nonatomic, strong) NSTimeZone *timeZone;

@end
