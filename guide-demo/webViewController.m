//
//  webViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-18.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) MBProgressHUD *loadingView;
@end

@implementation webViewController

- (void) loadView
{
    [super loadView];
    
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com.hk"]];
    self.view = _webView;
    _webView.delegate = self;
    
    [_webView loadRequest:request];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
        
        NSDate *now=[NSDate new];
        notification.fireDate=[now dateByAddingTimeInterval:6]; //触发通知的时间
        notification.repeatInterval=0; //循环次数，kCFCalendarUnitWeekday一周一次
        
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.soundName = UILocalNotificationDefaultSoundName;
        notification.alertBody=@"该去吃晚饭了！";
        
        notification.alertAction = @"打开";  //提示框按钮
        notification.hasAction = YES; //是否显示额外的按钮，为no时alertAction消失
        
        notification.applicationIconBadgeNumber = 1; //设置app图标右上角的数字
        
        //下面设置本地通知发送的消息，这个消息可以接受
        NSDictionary* infoDic = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
        notification.userInfo = infoDic;
        //发送通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
    
    _loadingView = NULL;
    _loadingView = [[MBProgressHUD alloc] initWithView:self.view];
    _loadingView.mode =  MBProgressHUDAnimationFade;
    
    [self.view addSubview:_loadingView];
    _loadingView.labelText = @"Loading";
    [_loadingView show:YES];
}
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    
    if (_loadingView != NULL) {
        [_loadingView removeFromSuperview];
        _loadingView = NULL;
    }
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    NSLog(@"didFailLoadWithError:%@", error);
    if (_loadingView != NULL) {
        [_loadingView removeFromSuperview];
        _loadingView = NULL;
    }
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"request is: %@", request.URL);
//    NSLog(@"navigationType is: %@", navigationType);
    return YES;
}
@end
