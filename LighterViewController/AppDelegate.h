//
//  AppDelegate.h
//  LighterViewController
//
//  Created by caodaxun_iMac on 15/10/14.
//  Copyright (c) 2015年 SWCM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (instancetype)sharedDelegate;

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) Store *store;

@end

