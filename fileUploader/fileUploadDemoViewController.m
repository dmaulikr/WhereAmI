//
//  fileUploadDemoViewController.m
//  fileUploader
//
//  Created by Michael Roling on 5/7/12.
//  Copyright (c) 2012 NA. All rights reserved.
//

#import "WebViewController.h"
#import "fileUploadDemoViewController.h"

@interface fileUploadDemoViewController ()

@end

@implementation fileUploadDemoViewController

@synthesize flUploadEngine = _flUploadEngine;
@synthesize flOperation = _flOperation;
@synthesize progressLabel;
@synthesize progressView;
@synthesize myTimer;
@synthesize backImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view sendSubviewToBack:backImage];
    self.view.opaque = NO;
    backImage.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.uploadingLabel.text = @" ";
    self.uploadingLabel.hidden = YES;
//
//    //progress view
    self.progressView.progress = 0;
    self.progressView.hidden = YES;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (IBAction)uploadPhoto:(id)sender {
    UIActionSheet *photoSourcePicker = [[UIActionSheet alloc] initWithTitle:nil
                                        delegate:self cancelButtonTitle:@"Cancel"
                                        destructiveButtonTitle:nil
                                        otherButtonTitles:	@"Take Photo",
                                        @"Choose from Library",
                                        nil,
                                        nil];
    
    [photoSourcePicker showInView:self.view];   
}


- (void)actionSheet:(UIActionSheet *)modalView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (buttonIndex)
	{
		case 0:
		{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
                imagePicker.delegate = self;
                imagePicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
                imagePicker.allowsEditing = NO;
                [self presentModalViewController:imagePicker animated:YES];
            }
            else {
                UIAlertView *alert;
                alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                   message:@"This device doesn't have a camera." 
                                                  delegate:self cancelButtonTitle:@"Ok" 
                                         otherButtonTitles:nil];
                [alert show];                
            }
			break;
		}            
		case 1:
		{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
                imagePicker.delegate = self;
                imagePicker.allowsEditing = NO;
                [self presentModalViewController:imagePicker animated:YES];
            }
            else {
                UIAlertView *alert;
                alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                   message:@"This device doesn't support photo libraries." 
                                                  delegate:self cancelButtonTitle:@"Ok" 
                                         otherButtonTitles:nil];
                [alert show];                
            }            
			break;
		}
	}
}

- (void)updateUI:(NSTimer *)timer
{
    static int count =0; count++;
    
    if (count <=10)
    {
        self.uploadingLabel.text = @"Uploading Image...";
        self.progressLabel.text = [NSString stringWithFormat:@"%d %%",count*10];
        self.progressView.progress = (float)count/10.0f;
    } else
    {
        self.uploadingLabel.text = @"Processing Image...";
        NSLog(@"Processing Image: %f", progressView.progress);
        count = 0;
        self.progressView.progress = 0;
        [self.myTimer invalidate];
        self.myTimer = nil;
    } 
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:YES];
    
    NSData *image = UIImageJPEGRepresentation([info objectForKey:UIImagePickerControllerOriginalImage], 0.1);
    self.progressView.progress = 0;
    NSLog(@"Picked Image: %f", progressView.progress);
    self.progressView.hidden = NO;
    self.uploadingLabel.hidden = NO;
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];

    //    self.flUploadEngine = [[fileUploadEngine alloc] initWithHostName:@"209.2.219.64:5000" customHeaderFields:nil];
//    self.flUploadEngine = [[fileUploadEngine alloc] initWithHostName:@"160.39.253.145:5000" customHeaderFields:nil];
    self.flUploadEngine = [[fileUploadEngine alloc] initWithHostName:@"192.168.1.32:5000" customHeaderFields:nil];
    NSMutableDictionary *postParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       @"testApp", @"appID",
                                       nil];
    self.flOperation = [self.flUploadEngine postDataToServer:postParams path:@"upload"];

    [self.flOperation addData:image forKey:@"file" mimeType:@"image/jpeg" fileName:@"test.jpg"];

    [self.flOperation addCompletionHandler:^(MKNetworkOperation* operation) {
        NSLog(@"In Completion Handler: %f", progressView.progress);
        self.uploadingLabel.text = @" ";
        self.uploadingLabel.hidden = YES;
//        self.progressView.progress = 0;
        self.progressView.hidden = YES;
        NSLog(@"%@\n", [operation responseString]);
        NSMutableString *searchText = [[NSMutableString alloc] initWithString:@"http://www.google.com/search?q=columbia%20university%20"];

        if ([operation.responseString isEqualToString:@"uris"]){
        [searchText appendString:@"business%20school%20"];
        }
        [searchText appendString:[operation responseString]];
    
        WebViewController* webViewController =[[WebViewController alloc] initWithNibName:nil bundle:nil];
        webViewController.searchString = searchText;
        
        [self.navigationController pushViewController:webViewController animated:YES];
    }     
    errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        NSLog(@"%@", error);
        self.uploadingLabel.text = @" ";
        self.uploadingLabel.hidden = YES;
        self.progressView.progress = 0;
        self.progressView.hidden = YES;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];        
    }];
    
    [self.flUploadEngine enqueueOperation:self.flOperation ];  
    
}



@end
