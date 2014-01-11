//
//  GuideViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-11.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)loadView{
    
    [super loadView];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    [view setUserInteractionEnabled:YES];
    [view setScrollEnabled:YES];
    
    //NO 发送滚动的通知 但是就算手指移动 scroll也不会动了 YES 发送通知 scroo可以移动
    [view setCanCancelContentTouches:YES];
    [view setBounces:NO];
    // NO 立即通知touchesShouldBegin:withEvent:inContentView 看是否滚动 scroll
    [view setDelaysContentTouches:NO];
    [view setPagingEnabled:YES];
    [view setContentSize:CGSizeMake(960, self.view.frame.size.height)];
    
    self.view = view;
    
    UIView *contentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    contentView.backgroundColor = [UIColor redColor];

    [self.view addSubview:contentView];
    
    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height)];
    contentView2.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:contentView2];
    
    UIView *contentView3 = [[UIView alloc] initWithFrame:CGRectMake(640, 0, self.view.frame.size.width, self.view.frame.size.height)];
    contentView3.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:contentView3];
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
