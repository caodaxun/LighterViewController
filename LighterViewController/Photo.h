//
//  Photo.h
//  LighterViewController
//
//  Created by caodaxun_iMac on 15/10/14.
//  Copyright © 2015年 SWCM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Photo : NSObject <NSCoding>

@property (nonatomic) int64_t identifier;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong) NSDate* creationDate;
@property (nonatomic) double rating;

@property (nonatomic, weak) User* user;

- (NSString*)authorFullName;
- (double)adjustedRating;

@end
