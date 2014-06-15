//
//  WebViewController.h
//  fileuploader
//
//  Created by Vaibhav Malpani on 5/8/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (retain, nonatomic) IBOutlet UIWebView *_webView;

@property (strong, nonatomic) NSString *searchString;

@end
