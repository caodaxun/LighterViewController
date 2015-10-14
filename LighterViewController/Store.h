//
//  Store.h
//  LighterViewController
//
//  Created by caodaxun_iMac on 15/10/14.
//  Copyright © 2015年 SWCM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

+ (instancetype)store;

@property (readonly, nonatomic, strong) NSArray* photos;
@property (readonly, nonatomic, strong) NSArray* users;

- (NSArray*)sortedPhotos;

@end
