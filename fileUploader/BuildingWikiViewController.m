//
//  BuildingWikiViewController.m
//  fileuploader
//
//  Created by Vaibhav Malpani on 5/9/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import "BuildingWikiViewController.h"
#import "mapViewController.h"

@interface BuildingWikiViewController ()

@end


@implementation BuildingWikiViewController

@synthesize BuildingName;
@synthesize Name;
@synthesize locationInfo;
@synthesize _webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *wikiLink;
    if([Name isEqualToString:@"Pupin Physics Lab"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Pupin_Hall";
    }
    else if([Name isEqualToString:@"North West Corner Building"]){
        wikiLink = @"http://www.library.columbia.edu/locations/science-library.html";
    }
    else if([Name isEqualToString:@"SIPA"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/School_of_International_and_Public_Affairs";
    }
    else if([Name isEqualToString:@"Law School"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Columbia_Law_School";
    }
    else if([Name isEqualToString:@"SEAS"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Columbia_School_of_Engineering_and_Applied_Science";
    }
    else if([Name isEqualToString:@"School of Arts"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Columbia_University_School_of_the_Arts";
    }
    else if([Name isEqualToString:@"Teacher's College"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Teachers_College,_Columbia_University";
    }
    else if([Name isEqualToString:@"School of Social Work"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Columbia_University_School_of_Social_Work";
    }
    else if([Name isEqualToString:@"School of Journalism"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Columbia_University_Graduate_School_of_Journalism";
    }
    else if([Name isEqualToString:@"Uris Hall"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Columbia_Business_School";
    }
    else if([Name isEqualToString:@"Butler Library"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Butler_Library";
    }
    else if([Name isEqualToString:@"Low Library"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Low_Memorial_Library";
    }
    else if([Name isEqualToString:@"Barnard College"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Barnard_College";
    }
    else if([Name isEqualToString:@"Avery"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Avery_Architectural_and_Fine_Arts_Library";
    }
    else if([Name isEqualToString:@"Lerner Hall"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/Alfred_Lerner_Hall";
    }
    else if([Name isEqualToString:@"John Jay Hall"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/John_Jay_Hall";
    }
    else if([Name isEqualToString:@"St Paul's Chapel"]){
        wikiLink = @"http://www.en.wikipedia.org/wiki/St._Paul's_Chapel_(Columbia_University)";
    }
    else{
        wikiLink = @"http://www.en.wikipedia.org/wiki/Columbia_University";
    }
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:wikiLink]];
    self._webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [_webView loadRequest:urlRequest];
    [self.view addSubview:self._webView];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"toMapView"]){
        mapViewController *_mapViewController = (mapViewController *)segue.destinationViewController;
        CLLocationCoordinate2D tmp;
        CLLocationCoordinate2D nearbyLoc1;
        CLLocationCoordinate2D nearbyLoc2;
        
        NSString* nearby1;
        NSString* nearby2;
        
        if([Name isEqualToString:@"Pupin Physics Lab"]){
            tmp.latitude = 40.810065 ;
            tmp.longitude = -73.961457;
            
            nearbyLoc1.latitude = 40.809996;
            nearbyLoc1.longitude = -73.962133;
            
            nearbyLoc2.latitude = 40.810171;
            nearbyLoc2.longitude = -73.960658;
            
            nearby1 = @"North West Corner Building";
            nearby2 = @"Teacher's College";
        }
        else if([Name isEqualToString:@"North West Corner Building"]){
            tmp.latitude = 40.809996;
            tmp.longitude = -73.962133;
            
            nearbyLoc1.latitude = 40.810171;
            nearbyLoc1.longitude = -73.960658;
            
            nearbyLoc2.latitude = 40.808821;
            nearbyLoc2.longitude = -73.961433;
            
            nearby1 = @"Teacher's College";
            nearby2 = @"Uris Hall";
        }
        else if([Name isEqualToString:@"SIPA"]){
            tmp.latitude = 40.807660;
            tmp.longitude = -73.959714;
            
            nearbyLoc1.latitude = 40.807010;
            nearbyLoc1.longitude = -73.960412;
            
            nearbyLoc2.latitude = 40.808342;
            nearbyLoc2.longitude = -73.961079;
            
            nearby1 = @"Law School";
            nearby2 = @"Avery";
        }
        else if([Name isEqualToString:@"Law School"]){
            tmp.latitude = 40.807010;
            tmp.longitude = -73.960412;
            
            nearbyLoc1.latitude = 40.808269;
            nearbyLoc1.longitude = -73.961879;
            
            nearbyLoc2.latitude = 40.807660;
            nearbyLoc2.longitude = -73.959714;
            
            nearby1 = @"Low Library";
            nearby2 = @"SIPA";
        }
        else if([Name isEqualToString:@"SEAS"]){
            tmp.latitude = 40.809391;
            tmp.longitude = -73.960339;
            
            nearbyLoc1.latitude = 40.809996;
            nearbyLoc1.longitude = -73.962133;
            
            nearbyLoc2.latitude = 40.808821;
            nearbyLoc2.longitude = -73.961433;
            
            nearby1 = @"North West Corner Building";
            nearby2 = @"Uris Hall";
        }
        else if([Name isEqualToString:@"School of Arts"]){
            tmp.latitude = 40.807995;
            tmp.longitude = -73.963150;
            
            nearbyLoc1.latitude = 40.808821;
            nearbyLoc1.longitude = -73.961433;
            
            nearbyLoc2.latitude = 40.808269;
            nearbyLoc2.longitude = -73.959714;
            
            nearby1 = @"Uris Hall";
            nearby2 = @"Low Library";
        }
        else if([Name isEqualToString:@"Teacher's College"]){
            tmp.latitude = 40.810171;
            tmp.longitude = -73.960658;
            
            nearbyLoc1.latitude = 40.809996;
            nearbyLoc1.longitude = -73.962133;
            
            nearbyLoc2.latitude = 40.809391;
            nearbyLoc2.longitude = -73.960339;
            
            nearby1 = @"North West Corner Building";
            nearby2 = @"SEAS";
        }
        else if([Name isEqualToString:@"School of Social Work"]){
            tmp.latitude = 40.810256;
            tmp.longitude = -73.958223;
            
            nearbyLoc1.latitude = 40.809996;
            nearbyLoc1.longitude = -73.962133;
            
            nearbyLoc2.latitude = 40.808821;
            nearbyLoc2.longitude = -73.961433;
            
            nearby1 = @"North West Corner Building";
            nearby2 = @"Uris Hall";
        }
        else if([Name isEqualToString:@"School of Journalism"]){
            tmp.latitude = 40.807507;
            tmp.longitude = -73.963493;
            
            nearbyLoc1.latitude = 40.806592;
            nearbyLoc1.longitude = -73.963032;
            
            nearbyLoc2.latitude = 40.808269;
            nearbyLoc2.longitude = -73.961879;
            
            nearby1 = @"Butler Library";
            nearby2 = @"Low Library";
        }
        else if([Name isEqualToString:@"Uris Hall"]){
            tmp.latitude = 40.808821;
            tmp.longitude = -73.961433;
            
            nearbyLoc1.latitude = 40.809996;
            nearbyLoc1.longitude = -73.962133;
            
            nearbyLoc2.latitude = 40.808342;
            nearbyLoc2.longitude = -73.961079;
            
            nearby1 = @"North West Corner Building";
            nearby2 = @"Avery";
        }
        else if([Name isEqualToString:@"Butler Library"]){
            tmp.latitude = 40.806592;
            tmp.longitude = -73.963032;
            
            nearbyLoc1.latitude = 40.805966;
            nearbyLoc1.longitude = -73.962356;
            
            nearbyLoc2.latitude = 40.807018;
            nearbyLoc2.longitude = -73.964175;
            
            nearby1 = @"John Jay";
            nearby2 = @"Lerner Hall";
        }
        else if([Name isEqualToString:@"Low Library"]){
            tmp.latitude = 40.808269;
            tmp.longitude = -73.961879;
            
            nearbyLoc1.latitude = 40.807010;
            nearbyLoc1.longitude = -73.960412;
            
            nearbyLoc2.latitude = 40.807995;
            nearbyLoc2.longitude = -73.963150;
            
            nearby1 = @"Law School";
            nearby2 = @"School of Arts";
        }
        else if([Name isEqualToString:@"Barnard College"]){
            tmp.latitude = 40.809487;
            tmp.longitude = -73.963418;
            
            nearbyLoc1.latitude = 40.810171;
            nearbyLoc1.longitude = -73.960658;
            
            nearbyLoc2.latitude = 40.809996;
            nearbyLoc2.longitude = -73.962133;
            
            nearby1 = @"Teacher's College";
            nearby2 = @"North West Corner Building";
        }
        else if([Name isEqualToString:@"Avery"]){
            tmp.latitude = 40.808342;
            tmp.longitude = -73.961079;
            
            nearbyLoc1.latitude = 40.809391;
            nearbyLoc1.longitude = -73.960339;
            
            nearbyLoc2.latitude = 40.808821;
            nearbyLoc2.longitude = -73.961433;
            
            nearby1 = @"SEAS";
            nearby2 = @"Uris Hall";
        }
        else if([Name isEqualToString:@"Lerner Hall"]){
            tmp.latitude = 40.807018;
            tmp.longitude = -73.964175;
            
            nearbyLoc1.latitude = 40.806592;
            nearbyLoc1.longitude = -73.963032;
            
            nearbyLoc2.latitude = 40.807507;
            nearbyLoc2.longitude = -73.963493;
            
            nearby1 = @"Butler Library";
            nearby2 = @"School of Journalism";
        }
        else if([Name isEqualToString:@"John Jay Hall"]){
            tmp.latitude = 40.805966;
            tmp.longitude = -73.962356;
            
            nearbyLoc1.latitude = 40.807018;
            nearbyLoc1.longitude = -73.964175;
            
            nearbyLoc2.latitude = 40.806592;
            nearbyLoc2.longitude = -73.963032;
            
            nearby1 = @"Lerner Hall";
            nearby2 = @"Butler Library";
        }
        else if([Name isEqualToString:@"St Paul's Chapel"]){
            tmp.latitude = 40.807881;
            tmp.longitude = -73.960964;
            
            nearbyLoc1.latitude = 40.808269;
            nearbyLoc1.longitude = -73.961879;
            
            nearbyLoc2.latitude = 40.808342;
            nearbyLoc2.longitude = -73.961079;
            
            nearby1 = @"Low Library";
            nearby2 = @"Avery";
        }
        else{
            tmp.latitude = 40.807426;
            tmp.longitude = -73.962445;
            
            nearbyLoc1.latitude = 40.808269;
            nearbyLoc1.longitude = -73.961879;
            
            nearbyLoc2.latitude = 40.806592;
            nearbyLoc2.longitude = -73.963032;
            
            nearby1 = @"Low Library";
            nearby2 = @"Butler Library";
        }
        _mapViewController.destName = Name;
        _mapViewController.location = tmp;
        
        _mapViewController.nearbyLocation1 = nearbyLoc1;
        _mapViewController.nearbyLocation2 = nearbyLoc2;
        
        _mapViewController.nearbyLocName1 = nearby1;
        _mapViewController.nearbyLocName2 = nearby2;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
