//
//  WebViewController.m
//  fileuploader
//
//  Created by Vaibhav Malpani on 5/8/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@end

@implementation WebViewController
@synthesize searchString;
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
    NSLog(@"4. %@", searchString);
    NSLog(@"in webview");
//    UIWebView *webView=[[UIWebView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,460.0)];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:searchString]];
//    [webview setDelegate:self];
    self._webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [_webView loadRequest:urlRequest];
    [self.view addSubview:self._webView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
