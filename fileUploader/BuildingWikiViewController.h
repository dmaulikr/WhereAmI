//
//  BuildingWikiViewController.h
//  fileuploader
//
//  Created by Vaibhav Malpani on 5/9/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuildingWikiViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *BuildingName;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *locationInfo;
@property (strong, nonatomic) NSString *Name;

@property (retain, nonatomic) IBOutlet UIWebView *_webView;


@end
