//
//  FirstTabViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-15.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "FirstTabViewController.h"
#import "webViewController.h"

@interface FirstTabViewController ()
@property (nonatomic,retain) webViewController *webController;

- (void)redirect;
@end

@implementation FirstTabViewController

- (void)loadView
{
    [super loadView];
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.navigationItem.title = @"my view";
    
    UIViewController *other_view = [[UIViewController alloc] init];
    other_view.title = @"gxw test";
    
    [self.navigationController pushViewController:other_view animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    //给定button在view上的位置
    
    button.frame = CGRectMake(110, 200, 100, 25);
    [button setTitle:@"百度" forState: UIControlStateNormal];
    
    
    //button背景色
    CALayer *layer = button.layer;
    layer.backgroundColor = [[UIColor clearColor] CGColor];
    layer.borderColor = [[UIColor darkGrayColor] CGColor];
    layer.cornerRadius = 4.0f;
    layer.borderWidth = 0.5f;
    
    
    [button addTarget:self action:@selector(redirect) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)redirect
{
    _webController = [[webViewController alloc] init];
    [self.navigationController pushViewController:_webController animated:YES];
}

@end
