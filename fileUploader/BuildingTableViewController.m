//
//  BuildingTableViewController.m
//  fileuploader
//
//  Created by Arihant Kochhar on 5/8/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import "BuildingTableViewController.h"
#import "BuildingWikiViewController.h"

@interface BuildingTableViewController ()

@end

@implementation BuildingTableViewController{
    NSArray *Buildings;
}

@synthesize tableView;

@synthesize cellIconNames;

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
    Buildings = [NSArray arrayWithObjects:@"Pupin Physics Lab",@"North West Corner Building", @"Uris Hall", @"Butler Library", @"Low Library", @"SIPA", @"Law School", @"SEAS", @"School of Arts", @"Teacher's College", @"School of Social Work", @"School of Journalism", @"Barnard College", @"Avery", @"Lerner Hall", @"John Jay Hall", @"St Paul's Chapel", nil];
    
    cellIconNames = [NSArray arrayWithObjects:@"pupin.jpg", @"norwest_corner.jpg", @"uris_hall.jpg", @"butler-library.jpg", @"low_library.jpg", @"sipa.jpg", @"law-school.jpg", @"seas.jpg", @"arts.jpg", @"teachers_college.jpg", @"social_work.jpg", @"journalism.jpg", @"bc.jpg", @"avery.jpg", @"alfred-lerner-hall.jpg", @"john-jay.jpg", @"chapel.jpg", nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"BuildingWiki"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BuildingWikiViewController *destViewController = segue.destinationViewController;
        destViewController.Name = [Buildings objectAtIndex:indexPath.row];
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Buildings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"BuildingCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [Buildings objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[cellIconNames objectAtIndex:indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
