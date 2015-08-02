//
//  ChooseTimeZoneViewController.m
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "ChooseTimeZoneViewController.h"

@interface ChooseTimeZoneViewController ()
@property (weak, nonatomic) IBOutlet UIView *searchBarContainerView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UILabel *chooseCityLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSDictionary *citiesForTimeZoneFiltered;

@end

@implementation ChooseTimeZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.cancelButton setTitle:NSLocalizedString(@"Cancel", @"") forState:UIControlStateNormal];
    self.chooseCityLabel.text = NSLocalizedString(@"Choose City.", @"");
    [self.cancelButton setTintColor:kWatchRed];
    [self.cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.citiesForTimeZoneFiltered = self.citiesForTimeZone;
    [self.tableView reloadData];
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender{
    if (self.searchBar.isFirstResponder) {
        [self.searchBar resignFirstResponder];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.citiesForTimeZoneFiltered.allKeys.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *sections = [self.citiesForTimeZoneFiltered.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    
    return [sections objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *sections = [self.citiesForTimeZoneFiltered.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    NSArray *sections = [self.citiesForTimeZoneFiltered.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    return ((NSArray*)self.citiesForTimeZoneFiltered[sections[section]]).count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSArray *sections = [self.citiesForTimeZoneFiltered.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    NSArray *cities = ((NSArray*)self.citiesForTimeZoneFiltered[sections[indexPath.section]]);
    NSDictionary *city = [cities objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", city[@"city"], city[@"timezone"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *sections = [self.citiesForTimeZoneFiltered.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    NSArray *cities = ((NSArray*)self.citiesForTimeZoneFiltered[sections[indexPath.section]]);
    NSDictionary *city = [cities objectAtIndex:indexPath.row];
    
    if (self.didSelectTimeZone) {
        self.didSelectTimeZone(city);
    }
    
    [self.searchBar resignFirstResponder];
    [self cancel:self];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSArray *sections = [self.citiesForTimeZone.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    
    searchText = [searchText lowercaseString];
    
    if (searchText.length == 0) {
        self.citiesForTimeZoneFiltered = self.citiesForTimeZone;
    }
    else{
        NSMutableDictionary *citiesForTimeZoneFiltered = [[NSMutableDictionary alloc] init];
        
        for (NSString *section in sections) {
            NSArray *cities = self.citiesForTimeZone[section];
            NSArray *citiesFiltered = [cities filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
                NSString *cityName = [[evaluatedObject objectForKey:@"city"] lowercaseString];
                NSString *timeZone = [[evaluatedObject objectForKey:@"timezone"] lowercaseString];
                
                return [cityName rangeOfString:searchText].location != NSNotFound || [timeZone rangeOfString:searchText].location != NSNotFound;
            }]];
            
            if (citiesFiltered.count > 0) {
                [citiesForTimeZoneFiltered setObject:citiesFiltered forKey:section];
            }
        }
        
        self.citiesForTimeZoneFiltered = citiesForTimeZoneFiltered;
    }
    [self.tableView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    if (searchBar.isFirstResponder) {
        [searchBar resignFirstResponder];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
@end
