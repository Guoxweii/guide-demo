//
//  FirstTabViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-15.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "FirstTabViewController.h"

@interface FirstTabViewController ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
