//
//  BigClockViewController.m
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "BigClockViewController.h"
#import "AnalogClockView.h"
#import "UIDigitalClockLabel.h"

@interface BigClockViewController ()
@property (strong, nonatomic) AnalogClockView *analogClockView;
@property (strong, nonatomic) UIDigitalClockLabel *digitalClockLabel;

@end

@implementation BigClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.analogClockView = [[AnalogClockView alloc] initWithFrame:CGRectZero];
    self.digitalClockLabel = [[UIDigitalClockLabel alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.analogClockView];
    [self.view addSubview:self.digitalClockLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate:)name:UIDeviceOrientationDidChangeNotification object:nil];

    [self.analogClockView addObserver:self forKeyPath:@"digitColor" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    self.digitalClockLabel.textColor = self.analogClockView.digitColor;
}

- (void) didRotate:(NSNotification *)notification

{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if (orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationPortraitUpsideDown || orientation == UIDeviceOrientationUnknown)
    {
        //portrait case
        
    }
    else if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight){
        //landscape mode
    }
    
    
}

- (void)dealloc{
    [self.analogClockView removeObserver:self forKeyPath:@"digitColor"];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self layoutSubViews];
}

- (void)layoutSubViews{
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - self.topLayoutGuide.length - self.bottomLayoutGuide.length;
    
    CGFloat clockWidth = MIN(width, height) - 20;
    self.analogClockView.showGraduation = YES;
    self.digitalClockLabel.textColor = self.analogClockView.digitColor;

    self.analogClockView.frame = CGRectMake((width-clockWidth)/2, (height-clockWidth)/2+self.topLayoutGuide.length, clockWidth, clockWidth);
    self.digitalClockLabel.frame = CGRectMake((width - 80)/2, self.analogClockView.frame.origin.y+self.analogClockView.frame.size.height - 80, 80, 20);
  
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.analogClockView.timeZone = self.timeZone;
    self.digitalClockLabel.timeZone = self.timeZone;
    self.analogClockView.digitFont = [UIFont boldSystemFontOfSize:15];
    self.navigationItem.title = self.cityName;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
