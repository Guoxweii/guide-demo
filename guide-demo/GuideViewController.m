//
//  GuideViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-11.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"
#import "Toast+UIView.h"

@interface GuideViewController ()
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIScrollView *scrollview;
@end

@implementation GuideViewController

- (void)loadView{
    
    [super loadView];
    
//    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollview = view;
    
    [view setUserInteractionEnabled:YES];
    [view setScrollEnabled:YES];
    
    //NO 发送滚动的通知 但是就算手指移动 scroll也不会动了 YES 发送通知 scroo可以移动
    [view setCanCancelContentTouches:YES];
    [view setBounces:NO];
    // NO 立即通知touchesShouldBegin:withEvent:inContentView 看是否滚动 scroll
    [view setDelaysContentTouches:NO];
    [view setPagingEnabled:YES];
    view.delegate = self;
    [view setContentSize:CGSizeMake(960, self.view.frame.size.height)];
    
    self.view = view;
    
    UIView *contentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    contentView.backgroundColor = [UIColor redColor];

    [self.view addSubview:contentView];
    
    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height)];
    contentView2.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:contentView2];
    
    UIView *contentView3 = [[UIView alloc] initWithFrame:CGRectMake(640, 0, self.view.frame.size.width, self.view.frame.size.height)];
    contentView3.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    //给定button在view上的位置
    
    button.frame = CGRectMake(240, 40, 35, 20);
    [button setTitle:@"返回" forState: UIControlStateNormal];
    
    
    //button背景色
    button.backgroundColor = [UIColor orangeColor];
    
    [button addTarget:self action:@selector(removeGuideView) forControlEvents:UIControlEventTouchDown];
    [contentView3 addSubview:button];
    
    [self.view addSubview:contentView3];
    
    CGRect framePageControl = CGRectMake(50, 400, 250, 30);
    _pageControl = [[UIPageControl alloc] initWithFrame:framePageControl];
    _pageControl.hidesForSinglePage = YES;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.numberOfPages = 3;
    
    [self.view addSubview:_pageControl];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view makeToast:@"This is a piece of toast with a title."
                duration:3.0
                position:@"center"
                   title:@"Toast Title"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"Scrolling...");
}

// 滚动停止时，触发该函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating  -   End of Scrolling.");
    int page = _scrollview.contentOffset.x / 320; //通过滚动的偏移量来判断目前页面所对应的小白点
    _pageControl.currentPage = page; //pagecontroll响应值的变化
    _pageControl.frame = CGRectMake(50 + 320*page, 430, _pageControl.frame.size.width, _pageControl.frame.size.height);
}

- (void)removeGuideView
{
    NSLog(@"123");
    [self.view removeFromSuperview];
}
@end
