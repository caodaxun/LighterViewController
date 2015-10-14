//
//  AppDelegate.m
//  LighterViewController
//
//  Created by caodaxun_iMac on 15/10/14.
//  Copyright (c) 2015年 SWCM. All rights reserved.
//

#import "AppDelegate.h"
#import "PhotosViewController.h"
#import "Store.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (instancetype)sharedDelegate {
    
    return [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    PhotosViewController *photosViewController = [[PhotosViewController alloc] initWithNibName:@"PhotosViewController"bundle:nil];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:photosViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@synthesize store = _store;

- (Store *)store {
    
    if (_store == nil) {
        _store = [Store store];
    }
    return _store;
}


@end
