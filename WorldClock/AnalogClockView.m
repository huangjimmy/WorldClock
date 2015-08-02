//
//  AnalogClockView.m
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "AnalogClockView.h"

#define borderWidth         2
#define borderAlpha         1.0
#define graduationOffset    10
#define graduationLength    5.0
#define graduationWidth     1.0
#define digitOffset 0

@implementation AnalogClockView

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
    
    if (self.hours > 6 && self.hours < 18) {
        self.clockFaceColor = kAnalogClockDayBackgroundColor;
        self.secondHandColor = kAnalogClockDaySecondColor;
        self.minuteHandColor = kAnalogClockDayMinuteColor;
        self.hourHandColor = kAnalogClockDayHourColor;
        self.digitColor = kAnalogClockDayTextColor;
    }
    else{
        self.clockFaceColor = kAnalogClockNightBackgroundColor;
        self.secondHandColor = kAnalogClockNightSecondColor;
        self.minuteHandColor = kAnalogClockNightMinuteColor;
        self.hourHandColor = kAnalogClockNightHourColor;
        self.digitColor = kAnalogClockNightTextColor;
    }
    
    [self setNeedsDisplay];
    
}



- (void)initDefaults{
    self.clockFaceColor = kAnalogClockDayBackgroundColor;
    self.secondHandColor = kAnalogClockDaySecondColor;
    self.minuteHandColor = kAnalogClockDayMinuteColor;
    self.hourHandColor = kAnalogClockDayHourColor;
    self.digitColor = kAnalogClockDayTextColor;
    self.digitFont = [UIFont boldSystemFontOfSize:8.0f];
    self.hours = 9;
    self.minutes = 41;
    self.seconds = 30;
    
    self.backgroundColor = [UIColor clearColor];
    
    CADisplayLink *animationTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerFired:)];
    animationTimer.frameInterval = 8.0;
    [animationTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColorWithColor(ctx, self.clockFaceColor.CGColor);
    CGContextFillPath(ctx);
    
    // DIGIT DRAWING
    CGPoint center = CGPointMake(rect.size.width/2.0f, rect.size.height/2.0f);
    CGFloat markingDistanceFromCenter = rect.size.width/2.0f - self.digitFont.lineHeight/4.0f - (self.showGraduation?15:0) + digitOffset;
    NSInteger offset = 4;
    
    if (self.showGraduation) {
        for (int i = 0; i<60; i++) {
            CGFloat gradLength = graduationLength;
            if((i+1)%5== 1) gradLength = gradLength + 10;
            CGFloat theta = i*M_PI/30 - M_PI_2;
            CGPoint P1 = CGPointMake((self.frame.size.width/2 + ((self.frame.size.width - borderWidth*2 - graduationOffset) / 2) * cos(theta)), (self.frame.size.width/2 + ((self.frame.size.width - borderWidth*2 - graduationOffset) / 2) * sin(theta)));
            CGPoint P2 = CGPointMake((self.frame.size.width/2 + ((self.frame.size.width - borderWidth*2 - graduationOffset - gradLength) / 2) * cos(theta)), (self.frame.size.width/2 + ((self.frame.size.width - borderWidth*2 - graduationOffset - gradLength) / 2) * sin(theta)));
            
            CAShapeLayer  *shapeLayer = [CAShapeLayer layer];
            UIBezierPath *path1 = [UIBezierPath bezierPath];
            shapeLayer.path = path1.CGPath;
            [path1 setLineWidth:graduationWidth];
            [path1 moveToPoint:P1];
            [path1 addLineToPoint:P2];
            path1.lineCapStyle = kCGLineCapSquare;
            [_digitColor set];
            
            [path1 strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
        }
    }
    
    for(unsigned int i = 0; i < 12; i ++){
        NSString *hourNumber = [NSString stringWithFormat:@"%@%d", [NSString stringWithFormat:@"%@", i+1<10 ? @" ": @""] , i + 1 ];
        CGFloat labelX = center.x + (markingDistanceFromCenter - self.digitFont.lineHeight/2.0f) * cos((M_PI/180)* (i+offset) * 30 + M_PI);
        CGFloat labelY = center.y + - 1 * (markingDistanceFromCenter - self.digitFont.lineHeight/2.0f) * sin((M_PI/180)*(i+offset) * 30);
        [hourNumber drawInRect:CGRectMake(labelX - self.digitFont.lineHeight/2.0f,labelY - self.digitFont.lineHeight/2.0f,self.digitFont.lineHeight,self.digitFont.lineHeight) withAttributes:@{NSForegroundColorAttributeName: self.digitColor, NSFontAttributeName: self.digitFont}];
    }
    
    
    //DRAW CENTER CIRCLE
    CGContextAddEllipseInRect(ctx, CGRectMake(self.frame.size.width/2-3, self.frame.size.height/2-3, 6, 6));
    CGContextSetFillColorWithColor(ctx, self.hourHandColor.CGColor);
    CGContextFillPath(ctx);
    
    CGFloat secondRadian = self.seconds*M_PI/30;
    CGFloat minuteRadian = (self.minutes+self.seconds/60.0)*M_PI/30;
    CGFloat hourRadian = (self.hours+self.minutes/60.0)*M_PI/6;
    
    CGFloat secondRadius = self.frame.size.width / 3.2;
    CGFloat minuteRadius = self.frame.size.width / 3.2;
    CGFloat hourRadius = self.frame.size.width / 5;
    
    CGPoint secondPoint = CGPointMake(secondRadius*cosf(secondRadian - M_PI_2)+self.bounds.size.width/2, secondRadius*sinf(secondRadian - M_PI_2)+self.bounds.size.height/2);
    CGPoint minutePoint = CGPointMake(minuteRadius*cosf(minuteRadian - M_PI_2)+self.bounds.size.width/2, minuteRadius*sinf(minuteRadian - M_PI_2)+self.bounds.size.height/2);
    CGPoint hourPoint = CGPointMake(hourRadius*cosf(hourRadian - M_PI_2)+self.bounds.size.width/2, hourRadius*sinf(hourRadian - M_PI_2)+self.bounds.size.height/2);
    
    CGContextSetStrokeColorWithColor(ctx, self.hourHandColor.CGColor);
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextSetLineWidth(ctx,2.0);
    
    CGContextAddLineToPoint(ctx, hourPoint.x, hourPoint.y);
    CGContextStrokePath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, self.minuteHandColor.CGColor);
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextSetLineWidth(ctx,2.0);
    
    CGContextAddLineToPoint(ctx, minutePoint.x, minutePoint.y);
    CGContextStrokePath(ctx);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(self.frame.size.width/2-1.5, self.frame.size.height/2-1.5, 3, 3));
    CGContextSetFillColorWithColor(ctx, self.secondHandColor.CGColor);
    CGContextFillPath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, self.secondHandColor.CGColor);
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextSetLineWidth(ctx,1.0);
    
    CGContextAddLineToPoint(ctx, secondPoint.x, secondPoint.y);
    CGContextStrokePath(ctx);
    
    
}


@end
