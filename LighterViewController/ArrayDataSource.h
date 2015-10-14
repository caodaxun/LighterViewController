//
//  ArrayDataSource.h
//  LighterViewController
//
//  Created by caodaxun_iMac on 15/10/14.
//  Copyright © 2015年 SWCM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (instancetype)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
