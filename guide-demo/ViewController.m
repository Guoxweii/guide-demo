//
//  ViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-11.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "ViewController.h"
#import "GuideViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) GuideViewController *scrollController;
@end

@implementation ViewController

- (void)loadView{
    [super loadView];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];

    UIView *view=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor=[UIColor whiteColor];
    self.view = view;
    
    self.label = [[UITextView alloc] initWithFrame:CGRectMake(0, 130, self.view.frame.size.width-100, 50)];
    [self.label setText:@"the main view content"];
    
    [self.view addSubview:self.label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"the value is: %@", [[NSUserDefaults standardUserDefaults] stringForKey:@"APP_VERSION"]);
    
    
    if (![[[NSUserDefaults standardUserDefaults] stringForKey:@"APP_VERSION"] isEqualToString:APP_VERSION]) {
        NSLog(@"step into here!");
        [[NSUserDefaults standardUserDefaults] setValue:APP_VERSION forKey:@"APP_VERSION"];
        
        _scrollController = [[GuideViewController alloc] init];
        [self.view addSubview:_scrollController.view];
    }
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"%@", APP_VERSION);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
