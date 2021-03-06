//
//  WorldClockViewController.m
//  WorldClock
//
//  Created by HUANG,Shaojun on 8/2/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "WorldClockViewController.h"
#import "WorldClockTableViewCell.h"
#import "ChooseTimeZoneViewController.h"
#import "BigClockViewController.h"


//the following timezone list is extracted from Mac OS X WorldClock Widget 
static NSString *timeZoneList = @"[{\"name\":\"Africa\",\"array\":[{\"city\":\"Accra\",\"offset\":0,\"timezone\":\"Africa/Accra\",\"id\":\"2306104\"},{\"city\":\"Addis Ababa\",\"offset\":180,\"timezone\":\"Africa/Addis_Ababa\",\"id\":\"344979\"},{\"city\":\"Algiers\",\"offset\":60,\"timezone\":\"Africa/Algiers\",\"id\":\"2507480\"},{\"city\":\"Asmera\",\"offset\":180,\"timezone\":\"Africa/Asmera\",\"id\":\"343300\"},{\"city\":\"Bamako\",\"offset\":0,\"timezone\":\"Africa/Bamako\",\"id\":\"2460596\"},{\"city\":\"Bangui\",\"offset\":60,\"timezone\":\"Africa/Bangui\",\"id\":\"2389853\"},{\"city\":\"Cairo\",\"offset\":180,\"timezone\":\"Africa/Cairo\",\"id\":\"360630\"},{\"city\":\"Cape Town\",\"offset\":120,\"timezone\":\"Africa/Johannesburg\",\"id\":\"3369157\"},{\"city\":\"Conakry\",\"offset\":0,\"timezone\":\"Africa/Conakry\",\"id\":\"2422465\"},{\"city\":\"Dakar\",\"offset\":0,\"timezone\":\"Africa/Dakar\",\"id\":\"2253354\"},{\"city\":\"Dar es Salaam\",\"offset\":180,\"timezone\":\"Africa/Dar_es_Salaam\",\"id\":\"160263\"},{\"city\":\"Djibouti\",\"offset\":180,\"timezone\":\"Africa/Djibouti\",\"id\":\"223817\"},{\"city\":\"Douala\",\"offset\":60,\"timezone\":\"Africa/Douala\",\"id\":\"2232593\"},{\"city\":\"Freetown\",\"offset\":0,\"timezone\":\"Africa/Freetown\",\"id\":\"2409306\"},{\"city\":\"Harare\",\"offset\":120,\"timezone\":\"Africa/Harare\",\"id\":\"890299\"},{\"city\":\"Kampala\",\"offset\":180,\"timezone\":\"Africa/Kampala\",\"id\":\"232422\"},{\"city\":\"Khartoum\",\"offset\":180,\"timezone\":\"Africa/Khartoum\",\"id\":\"379252\"},{\"city\":\"Kinshasa\",\"offset\":60,\"timezone\":\"Africa/Kinshasa\",\"id\":\"2314302\"},{\"city\":\"Lagos\",\"offset\":60,\"timezone\":\"Africa/Lagos\",\"id\":\"2332459\"},{\"city\":\"Luanda\",\"offset\":60,\"timezone\":\"Africa/Luanda\",\"id\":\"2240449\"},{\"city\":\"Lusaka\",\"offset\":120,\"timezone\":\"Africa/Lusaka\",\"id\":\"909137\"},{\"city\":\"Maputo\",\"offset\":120,\"timezone\":\"Africa/Maputo\",\"id\":\"1040652\"},{\"city\":\"Mogadishu\",\"offset\":180,\"timezone\":\"Africa/Mogadishu\",\"id\":\"53654\"},{\"city\":\"Monrovia\",\"offset\":0,\"timezone\":\"Africa/Monrovia\",\"id\":\"2274895\"},{\"city\":\"Nairobi\",\"offset\":180,\"timezone\":\"Africa/Nairobi\",\"id\":\"184745\"},{\"city\":\"Ndjamena\",\"offset\":60,\"timezone\":\"Africa/Ndjamena\",\"id\":\"2427123\"},{\"city\":\"Nouakchott\",\"offset\":0,\"timezone\":\"Africa/Nouakchott\",\"id\":\"2377450\"},{\"city\":\"Ouagadougou\",\"offset\":0,\"timezone\":\"Africa/Ouagadougou\",\"id\":\"2357048\"},{\"city\":\"Rabat\",\"offset\":0,\"timezone\":\"Africa/Casablanca\",\"id\":\"2538475\"},{\"city\":\"Tripoli\",\"offset\":120,\"timezone\":\"Africa/Tripoli\",\"id\":\"2210247\"},{\"city\":\"Tunis\",\"offset\":60,\"timezone\":\"Africa/Tunis\",\"id\":\"2464470\"}]},{\"name\":\"Asia\",\"array\":[{\"city\":\"Abu Dhabi\",\"offset\":240,\"timezone\":\"Asia/Dubai\",\"id\":\"292968\"},{\"city\":\"Amman\",\"offset\":180,\"timezone\":\"Asia/Amman\",\"id\":\"250441\"},{\"city\":\"Anadyr\",\"offset\":780,\"timezone\":\"Asia/Anadyr\",\"id\":\"2127202\"},{\"city\":\"Ankara\",\"offset\":180,\"timezone\":\"Europe/Istanbul\",\"id\":\"323786\"},{\"city\":\"Antananarivo\",\"offset\":180,\"timezone\":\"Indian/Antananarivo\",\"id\":\"1070940\"},{\"city\":\"Baghdad\",\"offset\":240,\"timezone\":\"Asia/Baghdad\",\"id\":\"98182\"},{\"city\":\"Bangkok\",\"offset\":420,\"timezone\":\"Asia/Bangkok\",\"id\":\"1609350\"},{\"city\":\"Beijing\",\"offset\":480,\"timezone\":\"Asia/Shanghai\",\"id\":\"1816670\"},{\"city\":\"Beirut\",\"offset\":180,\"timezone\":\"Asia/Beirut\",\"id\":\"276781\"},{\"city\":\"Guangzhou\",\"offset\":480,\"timezone\":\"Asia/Shanghai\",\"id\":\"1809858\"},{\"city\":\"Chennai (Madras)\",\"offset\":330,\"timezone\":\"Asia/Calcutta\",\"id\":\"1264527\"},{\"city\":\"Colombo\",\"offset\":360,\"timezone\":\"Asia/Colombo\",\"id\":\"1248991\"},{\"city\":\"Dhaka\",\"offset\":360,\"timezone\":\"Asia/Dhaka\",\"id\":\"1185241\"},{\"city\":\"Damascus\",\"offset\":180,\"timezone\":\"Asia/Damascus\",\"id\":\"170654\"},{\"city\":\"Doha\",\"offset\":180,\"timezone\":\"Asia/Qatar\",\"id\":\"290030\"},{\"city\":\"Hanoi\",\"offset\":420,\"timezone\":\"Asia/Saigon\",\"id\":\"1581130\"},{\"city\":\"Hong Kong\",\"offset\":480,\"timezone\":\"Asia/Hong_Kong\",\"id\":\"1819729\"},{\"city\":\"Islamabad\",\"offset\":300,\"timezone\":\"Asia/Karachi\",\"id\":\"1176615\"},{\"city\":\"Jakarta\",\"offset\":420,\"timezone\":\"Asia/Jakarta\",\"id\":\"1642911\"},{\"city\":\"Jerusalem\",\"offset\":180,\"timezone\":\"Asia/Jerusalem\",\"id\":\"281184\"},{\"city\":\"Kabul\",\"offset\":270,\"timezone\":\"Asia/Kabul\",\"id\":\"1138958\"},{\"city\":\"Kathmandu\",\"offset\":345,\"timezone\":\"Asia/Katmandu\",\"id\":\"1283240\"},{\"city\":\"Kolkata (Calcutta)\",\"offset\":330,\"timezone\":\"Asia/Calcutta\",\"id\":\"1275004\"},{\"city\":\"Krasnoyarsk\",\"offset\":480,\"timezone\":\"Asia/Krasnoyarsk\",\"id\":\"1502026\"},{\"city\":\"Kuala Lumpur\",\"offset\":480,\"timezone\":\"Asia/Kuala_Lumpur\",\"id\":\"1735161\"},{\"city\":\"Kuwait\",\"offset\":180,\"timezone\":\"Asia/Kuwait\",\"id\":\"285787\"},{\"city\":\"Magadan\",\"offset\":720,\"timezone\":\"Asia/Magadan\",\"id\":\"2123628\"},{\"city\":\"Male\",\"offset\":300,\"timezone\":\"Indian/Maldives\",\"id\":\"1282027\"},{\"city\":\"Manama\",\"offset\":180,\"timezone\":\"Asia/Bahrain\",\"id\":\"290340\"},{\"city\":\"Manila\",\"offset\":480,\"timezone\":\"Asia/Manila\",\"id\":\"1701668\"},{\"city\":\"Mecca\",\"offset\":180,\"timezone\":\"Asia/Riyadh\",\"id\":\"104515\"},{\"city\":\"Mumbai (Bombay)\",\"offset\":330,\"timezone\":\"Asia/Calcutta\",\"id\":\"1275339\"},{\"city\":\"Muscat\",\"offset\":240,\"timezone\":\"Asia/Muscat\",\"id\":\"287286\"},{\"city\":\"New Delhi\",\"offset\":330,\"timezone\":\"Asia/Calcutta\",\"id\":\"1261481\"},{\"city\":\"Novosibirsk\",\"offset\":420,\"timezone\":\"Asia/Novosibirsk\",\"id\":\"1496747\"},{\"city\":\"Omsk\",\"offset\":420,\"timezone\":\"Asia/Omsk\",\"id\":\"1496153\"},{\"city\":\"Osaka\",\"offset\":540,\"timezone\":\"Asia/Tokyo\",\"id\":\"1853909\"},{\"city\":\"Phnom Penh\",\"offset\":420,\"timezone\":\"Asia/Phnom_Penh\",\"id\":\"1821306\"},{\"city\":\"Port Louis\",\"offset\":240,\"timezone\":\"Indian/Mauritius\",\"id\":\"934154\"},{\"city\":\"Pyongyang\",\"offset\":540,\"timezone\":\"Asia/Pyongyang\",\"id\":\"1871859\"},{\"city\":\"Rangoon\",\"offset\":390,\"timezone\":\"Asia/Rangoon\",\"id\":\"1298824\"},{\"city\":\"Riyadh\",\"offset\":180,\"timezone\":\"Asia/Riyadh\",\"id\":\"108410\"},{\"city\":\"Sanaa\",\"offset\":180,\"timezone\":\"Asia/Aden\",\"id\":\"71137\"},{\"city\":\"Seoul\",\"offset\":540,\"timezone\":\"Asia/Seoul\",\"id\":\"1835848\"},{\"city\":\"Shanghai\",\"offset\":480,\"timezone\":\"Asia/Shanghai\",\"id\":\"1796236\"},{\"city\":\"Singapore\",\"offset\":480,\"timezone\":\"Asia/Singapore\",\"id\":\"1880252\"},{\"city\":\"Taipei\",\"offset\":480,\"timezone\":\"Asia/Taipei\",\"id\":\"1668341\"},{\"city\":\"Tashkent\",\"offset\":300,\"timezone\":\"Asia/Tashkent\",\"id\":\"1512569\"},{\"city\":\"Tehran\",\"offset\":270,\"timezone\":\"Asia/Tehran\",\"id\":\"112931\"},{\"city\":\"Thanh Pho Ho Chi Minh\",\"offset\":420,\"timezone\":\"Asia/Saigon\",\"id\":\"1566083\"},{\"city\":\"Tianjin\",\"offset\":480,\"timezone\":\"Asia/Shanghai\",\"id\":\"1792947\"},{\"city\":\"Tokyo\",\"offset\":540,\"timezone\":\"Japan\",\"id\":\"1850147\"},{\"city\":\"Ulaanbaatar\",\"offset\":480,\"timezone\":\"Asia/Ulaanbaatar\",\"id\":\"2028462\"},{\"city\":\"Victoria\",\"offset\":240,\"timezone\":\"Indian/Mahe\",\"id\":\"241131\"},{\"city\":\"Vladivostok\",\"offset\":660,\"timezone\":\"Asia/Vladivostok\",\"id\":\"2013348\"},{\"city\":\"Yakutsk\",\"offset\":600,\"timezone\":\"Asia/Yakutsk\",\"id\":\"2013159\"},{\"city\":\"Yekaterinburg\",\"offset\":360,\"timezone\":\"Asia/Yekaterinburg\",\"id\":\"1486209\"}]},{\"name\":\"Atlantic\",\"array\":[{\"city\":\"Grytviken\",\"offset\":-120,\"timezone\":\"Atlantic/South_Georgia\",\"id\":\"611717\"},{\"city\":\"Ponta Delgada\",\"offset\":0,\"timezone\":\"Atlantic/Azores\",\"id\":\"3372783\"},{\"city\":\"Reykjavik\",\"offset\":0,\"timezone\":\"Atlantic/Reykjavik\",\"id\":\"3413829\"}]},{\"name\":\"Australia\",\"array\":[{\"city\":\"Adelaide\",\"offset\":570,\"timezone\":\"Australia/Adelaide\",\"id\":\"2078025\"},{\"city\":\"Brisbane\",\"offset\":600,\"timezone\":\"Australia/Brisbane\",\"id\":\"2174003\"},{\"city\":\"Canberra\",\"offset\":600,\"timezone\":\"Australia/Canberra\",\"id\":\"2172517\"},{\"city\":\"Darwin\",\"offset\":570,\"timezone\":\"Australia/Darwin\",\"id\":\"2073124\"},{\"city\":\"Hobart\",\"offset\":600,\"timezone\":\"Australia/Hobart\",\"id\":\"2163355\"},{\"city\":\"Melbourne\",\"offset\":600,\"timezone\":\"Australia/Melbourne\",\"id\":\"2158177\"},{\"city\":\"Perth\",\"offset\":480,\"timezone\":\"Australia/Perth\",\"id\":\"2063523\"},{\"city\":\"Sydney\",\"offset\":600,\"timezone\":\"Australia/Sydney\",\"id\":\"2147714\"}]},{\"name\":\"Europe\",\"array\":[{\"city\":\"Amsterdam\",\"offset\":120,\"timezone\":\"Europe/Amsterdam\",\"id\":\"2759794\"},{\"city\":\"Athens\",\"offset\":180,\"timezone\":\"Europe/Athens\",\"id\":\"264371\"},{\"city\":\"Belgrade\",\"offset\":180,\"timezone\":\"Europe/Belgrade\",\"id\":\"792680\"},{\"city\":\"Berlin\",\"offset\":120,\"timezone\":\"Europe/Berlin\",\"id\":\"2950159\"},{\"city\":\"Brussels\",\"offset\":120,\"timezone\":\"Europe/Brussels\",\"id\":\"2800866\"},{\"city\":\"Bucharest\",\"offset\":180,\"timezone\":\"Europe/Bucharest\",\"id\":\"683506\"},{\"city\":\"Budapest\",\"offset\":120,\"timezone\":\"Europe/Budapest\",\"id\":\"3054643\"},{\"city\":\"Cardiff\",\"offset\":60,\"timezone\":\"Europe/London\",\"id\":\"2653822\"},{\"city\":\"Copenhagen\",\"offset\":120,\"timezone\":\"Europe/Copenhagen\",\"id\":\"2618425\"},{\"city\":\"Cork\",\"offset\":60,\"timezone\":\"Europe/Dublin\",\"id\":\"2965140\"},{\"city\":\"Dublin\",\"offset\":60,\"timezone\":\"Europe/Dublin\",\"id\":\"2964574\"},{\"city\":\"Edinburgh\",\"offset\":60,\"timezone\":\"Europe/London\",\"id\":\"2650225\"},{\"city\":\"Geneva\",\"offset\":120,\"timezone\":\"Europe/Zurich\",\"id\":\"4893591\"},{\"city\":\"Helsinki\",\"offset\":180,\"timezone\":\"Europe/Helsinki\",\"id\":\"658225\"},{\"city\":\"Istanbul\",\"offset\":180,\"timezone\":\"Asia/Istanbul\",\"id\":\"745044\"},{\"city\":\"Kiev\",\"offset\":180,\"timezone\":\"Europe/Kiev\",\"id\":\"703448\"},{\"city\":\"Lisbon\",\"offset\":60,\"timezone\":\"Europe/Lisbon\",\"id\":\"2267057\"},{\"city\":\"Ljubljana\",\"offset\":120,\"timezone\":\"Europe/Ljubljana\",\"id\":\"3196359\"},{\"city\":\"London\",\"offset\":60,\"timezone\":\"Europe/London\",\"id\":\"2643743\"},{\"city\":\"Madrid\",\"offset\":120,\"timezone\":\"Europe/Madrid\",\"id\":\"3117735\"},{\"city\":\"Moscow\",\"offset\":240,\"timezone\":\"Europe/Moscow\",\"id\":\"524901\"},{\"city\":\"Munich\",\"offset\":120,\"timezone\":\"Europe/Berlin\",\"id\":\"2867714\"},{\"city\":\"Oslo\",\"offset\":120,\"timezone\":\"Europe/Oslo\",\"id\":\"3143244\"},{\"city\":\"Paris\",\"offset\":120,\"timezone\":\"Europe/Paris\",\"id\":\"2988507\"},{\"city\":\"Prague\",\"offset\":120,\"timezone\":\"Europe/Prague\",\"id\":\"3067696\"},{\"city\":\"Rome\",\"offset\":120,\"timezone\":\"Europe/Rome\",\"id\":\"3169070\"},{\"city\":\"Sofia\",\"offset\":180,\"timezone\":\"Europe/Sofia\",\"id\":\"727011\"},{\"city\":\"St. Petersburg\",\"offset\":240,\"timezone\":\"Europe/Moscow\",\"id\":\"498817\"},{\"city\":\"Stockholm\",\"offset\":120,\"timezone\":\"Europe/Stockholm\",\"id\":\"2673730\"},{\"city\":\"Vienna\",\"offset\":120,\"timezone\":\"Europe/Vienna\",\"id\":\"2761369\"},{\"city\":\"Volgograd\",\"offset\":240,\"timezone\":\"Europe/Moscow\",\"id\":\"472757\"},{\"city\":\"Warsaw\",\"offset\":120,\"timezone\":\"Europe/Warsaw\",\"id\":\"756135\"},{\"city\":\"Zagreb\",\"offset\":120,\"timezone\":\"Europe/Zagreb\",\"id\":\"3186886\"},{\"city\":\"Zurich\",\"offset\":120,\"timezone\":\"Europe/Zurich\",\"id\":\"2657896\"}]},{\"name\":\"North America\",\"array\":[{\"city\":\"Adak\",\"offset\":-540,\"timezone\":\"America/Adak\",\"id\":\"1253605\"},{\"city\":\"Anchorage\",\"offset\":-480,\"timezone\":\"America/Anchorage\",\"id\":\"5879400\"},{\"city\":\"Atlanta\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"4180439\"},{\"city\":\"Austin\",\"offset\":-300,\"timezone\":\"US/Central\",\"id\":\"4671654\"},{\"city\":\"Boston\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"4930956\"},{\"city\":\"Calgary\",\"offset\":-360,\"timezone\":\"Canada/Mountain\",\"id\":\"5913490\"},{\"city\":\"Chicago\",\"offset\":-300,\"timezone\":\"America/Chicago\",\"id\":\"4887398\"},{\"city\":\"Columbus\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"4509177\"},{\"city\":\"Cupertino\",\"offset\":-420,\"timezone\":\"US/Pacific\",\"id\":\"5341145\"},{\"city\":\"Dallas\",\"offset\":-300,\"timezone\":\"US/Central\",\"id\":\"4684888\"},{\"city\":\"Denver\",\"offset\":-360,\"timezone\":\"America/Denver\",\"id\":\"5419384\"},{\"city\":\"Detroit\",\"offset\":-240,\"timezone\":\"America/Detroit\",\"id\":\"4990729\"},{\"city\":\"Guatemala\",\"offset\":-360,\"timezone\":\"America/Guatemala\",\"id\":\"3598132\"},{\"city\":\"Halifax\",\"offset\":-180,\"timezone\":\"Canada/Atlantic\",\"id\":\"6324729\"},{\"city\":\"Havana\",\"offset\":-240,\"timezone\":\"America/Havana\",\"id\":\"3553478\"},{\"city\":\"Indianapolis\",\"offset\":-300,\"timezone\":\"America/Indianapolis\",\"id\":\"4259418\"},{\"city\":\"Knoxville\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"4634946\"},{\"city\":\"Los Angeles\",\"offset\":-420,\"timezone\":\"America/Los_Angeles\",\"id\":\"5368361\"},{\"city\":\"Managua\",\"offset\":-360,\"timezone\":\"America/Managua\",\"id\":\"3617763\"},{\"city\":\"Manchester\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"5089178\"},{\"city\":\"Memphis\",\"offset\":-300,\"timezone\":\"US/Central\",\"id\":\"4641239\"},{\"city\":\"Mexico City\",\"offset\":-300,\"timezone\":\"America/Mexico_City\",\"id\":\"3530597\"},{\"city\":\"Miami\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"4164138\"},{\"city\":\"Minneapolis\",\"offset\":-300,\"timezone\":\"US/Central\",\"id\":\"5037649\"},{\"city\":\"Montreal\",\"offset\":-240,\"timezone\":\"America/Montreal\",\"id\":\"6077243\"},{\"city\":\"New York\",\"offset\":-240,\"timezone\":\"America/New_York\",\"id\":\"5128581\"},{\"city\":\"Nuuk\",\"offset\":-120,\"timezone\":\"America/Godthab\",\"id\":\"3421319\"},{\"city\":\"Ottawa\",\"offset\":-240,\"timezone\":\"Canada/Eastern\",\"id\":\"6094817\"},{\"city\":\"Panama\",\"offset\":-300,\"timezone\":\"America/Panama\",\"id\":\"3703443\"},{\"city\":\"Philadelphia\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"4560349\"},{\"city\":\"Phoenix\",\"offset\":-420,\"timezone\":\"America/Phoenix\",\"id\":\"5308655\"},{\"city\":\"Port-au-Prince\",\"offset\":-300,\"timezone\":\"America/Port-au-Prince\",\"id\":\"3718426\"},{\"city\":\"Portland\",\"offset\":-420,\"timezone\":\"US/Pacific\",\"id\":\"5746545\"},{\"city\":\"Regina\",\"offset\":-360,\"timezone\":\"Canada/Saskatchewan\",\"id\":\"6119109\"},{\"city\":\"Salt Lake City\",\"offset\":-360,\"timezone\":\"US/Mountain\",\"id\":\"5780993\"},{\"city\":\"San Diego\",\"offset\":-420,\"timezone\":\"US/Pacific\",\"id\":\"5391811\"},{\"city\":\"San Francisco\",\"offset\":-420,\"timezone\":\"US/Pacific\",\"id\":\"5391959\"},{\"city\":\"San Jose\",\"offset\":-360,\"timezone\":\"America/Costa_Rica\",\"id\":\"3621849\"},{\"city\":\"San Salvador\",\"offset\":-360,\"timezone\":\"America/El_Salvador\",\"id\":\"3583361\"},{\"city\":\"Santo Domingo\",\"offset\":-240,\"timezone\":\"America/Santo_Domingo\",\"id\":\"3492908\"},{\"city\":\"Seattle\",\"offset\":-420,\"timezone\":\"US/Pacific\",\"id\":\"5809844\"},{\"city\":\"St. John's\",\"offset\":-150,\"timezone\":\"Canada/Newfoundland\",\"id\":\"6324733\"},{\"city\":\"St. Louis\",\"offset\":-300,\"timezone\":\"US/Central\",\"id\":\"4407066\"},{\"city\":\"Tegucigalpa\",\"offset\":-360,\"timezone\":\"America/Tegucigalpa\",\"id\":\"3600949\"},{\"city\":\"Toronto\",\"offset\":-240,\"timezone\":\"Canada/Eastern\",\"id\":\"6167865\"},{\"city\":\"Vancouver\",\"offset\":-420,\"timezone\":\"America/Vancouver\",\"id\":\"6173331\"},{\"city\":\"Washington, D.C.\",\"offset\":-240,\"timezone\":\"US/Eastern\",\"id\":\"4140963\"},{\"city\":\"Winnipeg\",\"offset\":-300,\"timezone\":\"America/Winnipeg\",\"id\":\"6183235\"}]},{\"name\":\"Pacific\",\"array\":[{\"city\":\"Guam\",\"offset\":600,\"timezone\":\"Pacific/Guam\",\"id\":\"4044012\"},{\"city\":\"Honolulu\",\"offset\":-600,\"timezone\":\"Pacific/Honolulu\",\"id\":\"5856195\"},{\"city\":\"Noumea\",\"offset\":660,\"timezone\":\"Pacific/Noumea\",\"id\":\"2139521\"},{\"city\":\"Pago Pago\",\"offset\":-660,\"timezone\":\"Pacific/Pago_Pago\",\"id\":\"5881576\"},{\"city\":\"Wellington\",\"offset\":720,\"timezone\":\"Pacific/Auckland\",\"id\":\"2179537\"}]},{\"name\":\"South America\",\"array\":[{\"city\":\"Asuncion\",\"offset\":-240,\"timezone\":\"America/Asuncion\",\"id\":\"3439389\"},{\"city\":\"Bogota\",\"offset\":-300,\"timezone\":\"America/Bogota\",\"id\":\"3688689\"},{\"city\":\"Brasalia\",\"offset\":-180,\"timezone\":\"Brazil/East\",\"id\":\"3469058\"},{\"city\":\"Buenos Aires\",\"offset\":-180,\"timezone\":\"America/Buenos_Aires\",\"id\":\"3435910\"},{\"city\":\"Caracas\",\"offset\":-240,\"timezone\":\"America/Caracas\",\"id\":\"3646738\"},{\"city\":\"Cayenne\",\"offset\":-180,\"timezone\":\"America/Cayenne\",\"id\":\"3382160\"},{\"city\":\"Georgetown\",\"offset\":-240,\"timezone\":\"America/Guyana\",\"id\":\"3378644\"},{\"city\":\"La Paz\",\"offset\":-240,\"timezone\":\"America/La_Paz\",\"id\":\"3911925\"},{\"city\":\"Lima\",\"offset\":-300,\"timezone\":\"America/Lima\",\"id\":\"3936456\"},{\"city\":\"Montevideo\",\"offset\":-180,\"timezone\":\"America/Montevideo\",\"id\":\"3441575\"},{\"city\":\"Paramaribo\",\"offset\":-180,\"timezone\":\"America/Paramaribo\",\"id\":\"3383330\"},{\"city\":\"Quito\",\"offset\":-300,\"timezone\":\"America/Guayaquil\",\"id\":\"3652462\"},{\"city\":\"Recife\",\"offset\":-180,\"timezone\":\"America/Recife\",\"id\":\"3390760\"},{\"city\":\"Rio de Janeiro\",\"offset\":-180,\"timezone\":\"Brazil/East\",\"id\":\"3451190\"},{\"city\":\"San Juan\",\"offset\":-240,\"timezone\":\"America/Puerto_Rico\",\"id\":\"4568127\"},{\"city\":\"Santiago\",\"offset\":-240,\"timezone\":\"America/Santiago\",\"id\":\"3871336\"},{\"city\":\"Sao Paulo\",\"offset\":-180,\"timezone\":\"America/Sao_Paulo\",\"id\":\"3448439\"}]}]";

@interface WorldClockViewController ()

@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSArray *cityPrefixes;
@property (nonatomic, strong) NSMutableArray *worldClocks;

@end

@implementation WorldClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = NSLocalizedString(@"World Clock", @"");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(chooseAndAddTimeZone:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kWatchRed, NSFontAttributeName: [UIFont systemFontOfSize:32]} forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
    self.tableView.contentInset = UIEdgeInsetsMake(-10.0f, 0.0f, 0.0f, 0.0);
    NSArray *continents = [NSJSONSerialization JSONObjectWithData:[timeZoneList dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    for (NSDictionary *continent in continents) {
        [cities addObjectsFromArray:[continent objectForKey:@"array"]];
    }
    
    self.cities = [cities sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDictionary *city1 = obj1;
        NSDictionary *city2 = obj2;
        NSString *city1name = [city1 objectForKey:@"city"];
        NSString *city2name = [city2 objectForKey:@"city"];
        
        return [city1name compare:city2name];
    }];
    
    NSMutableArray *cityPrefixes = [[NSMutableArray alloc] init];
    NSArray *cityNames = [self.cities valueForKey:@"city"];
    for (NSString *cityName in cityNames) {
        NSString *prefix = [cityName substringToIndex:1];
        if (![cityPrefixes containsObject:prefix]) {
            [cityPrefixes addObject:prefix];
        }
    };
    self.cityPrefixes = cityPrefixes;
    
    self.tableView.dataSetDelegate = self;
    self.tableView.dataSetSource = self;
    
    [self loadWorldClock];
    
}




- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self saveWorldClock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self saveWorldClock];
}

- (void)loadWorldClock{
    NSArray *savedClocks = [[NSUserDefaults standardUserDefaults] objectForKey:@"WorldClock"];
    self.worldClocks = savedClocks.mutableCopy;
    if (self.worldClocks == nil) {
        self.worldClocks = [[NSMutableArray alloc] init];
    }
    [self.tableView reloadData];
}

- (void)saveWorldClock{
    [[NSUserDefaults standardUserDefaults] setObject:self.worldClocks forKey:@"WorldClock"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    
    if(editing) {
        
    }
    
    else {
        //Do something for non-edit mode
        [self saveWorldClock];
    }
    
}

- (void)dealloc
{
    [self saveWorldClock];
    self.tableView.dataSetSource = nil;
    self.tableView.dataSetDelegate = nil;
}


- (IBAction)chooseAndAddTimeZone:(id)sender{
    self.editing = NO;
    [self performSegueWithIdentifier:@"ChooseTimeZone" sender:sender];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.worldClocks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reuseIdentifier = @"ClockRowAnalog";
    WorldClockTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *timeZoneDict = [self.worldClocks objectAtIndex:indexPath.row];
    NSString *cityName = [timeZoneDict objectForKey:@"city"];
    NSString *timeZoneName = [timeZoneDict objectForKey:@"timezone"];
    cell.timeZone  = [NSTimeZone timeZoneWithName:timeZoneName];
    cell.cityLabel.text = cityName;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0;
}

- (NSAttributedString *)titleForTableViewDataSet:(UITableView *)tableView {
    
    NSString *text = NSLocalizedString(@"No World Clock", @"");
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForTableViewDataSet:(UITableView *)tableView {
    
    NSString *text = NSLocalizedString(@"A list of world clocks.", @"");
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Detemine if it's in editing mode
    if (self.tableView.editing)
    {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.worldClocks removeObjectAtIndex:indexPath.row];
        [self saveWorldClock];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSUInteger oldIndex = fromIndexPath.row;
    NSUInteger newIndex = toIndexPath.row;
    
    NSDictionary *timeZoneDict = [self.worldClocks objectAtIndex:oldIndex];
    [self.worldClocks removeObjectAtIndex:oldIndex];
    [self.worldClocks insertObject:timeZoneDict atIndex:newIndex];
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ChooseTimeZone"]) {
        ChooseTimeZoneViewController *ctvc = segue.destinationViewController;
        NSMutableDictionary *citiesForTimeZone = [[NSMutableDictionary alloc] init];
        for (NSString *prefix in self.cityPrefixes) {
            [citiesForTimeZone setObject:[self.cities filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSDictionary *evaluatedObject, NSDictionary *bindings) {
                NSString *cityName = [evaluatedObject objectForKey:@"city"];
                return [cityName hasPrefix:prefix];
            }]] forKey:prefix];
        }
        ctvc.citiesForTimeZone = citiesForTimeZone;
        __weak typeof(self) myself = self;
        ctvc.didSelectTimeZone = ^(NSDictionary *timeZoneDict){
            if([[myself.worldClocks valueForKey:@"city"] containsObject:timeZoneDict[@"city"]]){
                return;
            }
            else{
                [myself.worldClocks addObject:timeZoneDict];
                [myself saveWorldClock];
                [myself.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            }
        };
    }
    else if([segue.identifier isEqualToString:@"DisplayBigClock"]){
        NSIndexPath *indexPath = [self.tableView indexPathsForSelectedRows].firstObject;
        NSDictionary *timeZoneDict = [self.worldClocks objectAtIndex:indexPath.row];
        
        BigClockViewController *bcvc = segue.destinationViewController;
        bcvc.cityName = [timeZoneDict objectForKey:@"city"];
        bcvc.timeZone = [NSTimeZone timeZoneWithName:[timeZoneDict objectForKey:@"timezone"]];
    }
}


@end
