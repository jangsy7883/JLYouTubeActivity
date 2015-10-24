//
//  ViewController.m
//  KMYoutubeActivityDemo
//
//  Created by IM049 on 2015. 10. 21..
//  Copyright © 2015년 Jangsy7883. All rights reserved.
//

#import "ViewController.h"
#import "KMYoutubeActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://youtu.be/_NMQl74qrR8"]]];
}


- (IBAction)pressedShareButton:(id)sender
{
    NSURL *URL = self.webView.request.URL;
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL]
                                                                                         applicationActivities:@[[KMYoutubeActivity new]]];
    
    activityViewController.popoverPresentationController.barButtonItem = sender;
    [self presentViewController:activityViewController animated:YES completion:nil];
}

@end
