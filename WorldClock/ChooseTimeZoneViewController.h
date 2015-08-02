//
//  ChooseTimeZoneViewController.h
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseTimeZoneViewController : UIViewController<UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *citiesForTimeZone;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) void(^didSelectTimeZone)(NSDictionary* timeZoneDict);

@end
