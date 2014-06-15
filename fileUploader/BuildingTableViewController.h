//
//  BuildingTableViewController.h
//  fileuploader
//
//  Created by Vaibhav Malpani on 5/8/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuildingTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain) NSArray *cellIconNames;

@end
