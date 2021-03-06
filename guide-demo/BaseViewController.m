//
//  BaseViewController.m
//  guide-demo
//
//  Created by gxw on 14-1-15.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#import "BaseViewController.h"
#import "FirstTabViewController.h"
#import "AFNetworking.h"
#import "Toast+UIView.h"

@interface BaseViewController ()
@property (nonatomic, retain) AFHTTPRequestOperationManager *manager;
@end

@implementation BaseViewController

- (void)loadView
{
    [super loadView];
    NSMutableArray *controllers = [NSMutableArray array];
    
    NSArray *item = [NSArray arrayWithObjects:@"雨松MOMO",@"若若娃",@"小可爱",@"哇咔咔",@"小老虎",@"学苹果",@"快乐乐",@"寿司卷", nil];
    
    //数组数量
    long count = [item count];
    
    for (int i = 0; i < count; i++)
    {
        UIViewController *controller = [[FirstTabViewController alloc] init];
        controller.title = [item objectAtIndex:i];
        controller.tabBarItem=[[UITabBarItem alloc] initWithTitle:[item objectAtIndex:i] image:[UIImage imageNamed:@"triller-32"] tag:0];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: controller];
        
        
        [controllers addObject:nav];
    }
    
    //创建UITabBarController，将显示的内容添加进去
    self.viewControllers = controllers;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [_manager GET:@"http://211.167.101.143/api/v2/live/channels.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        [self.view makeToast:@"http api request success."
                    duration:3.0
                    position:@"center"
                       title:@"Toast Title"];
    } failure:^(AFHTTPRequestOperation *operation,  NSError *error) {
        NSLog(@"%@", error);
        [self.view makeToast:@"http api request failed."
                    duration:3.0
                    position:@"center"
                       title:@"Toast Title"];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
