//
//  ViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-11.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UILabel *label;
@end

@implementation ViewController

- (void)loadView{
    [super loadView];
    
    UIView *view=[[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    view.alpha=0.5;
    view.backgroundColor=[UIColor cyanColor];
    self.view = view;
    
    self.label = [[UITextView alloc] initWithFrame:CGRectMake(10, 50, 300, 200)];
    [self.view addSubview:self.label];
    self.label.text = @"receving message.....";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        // 這裏判斷是否第一次
        UIAlertView * alert =[[UIAlertView alloc] initWithTitle:@"第一次"
                                                        message:@"進入App"
                                                       delegate:self
                                              cancelButtonTitle:@"我知道了"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
