//
//  AppDelegate.h
//  guide-demo
//
//  Created by gxw on 14-1-11.
//  Copyright (c) 2014年 gxw. All rights reserved.
//

#define PrintRect(frame) NSLog(@"X:%f,Y:%f,W:%f,H:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
