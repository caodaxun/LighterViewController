//
//  PhotoCell.m
//  LighterViewController
//
//  Created by caodaxun_iMac on 15/10/14.
//  Copyright © 2015年 SWCM. All rights reserved.
//

#import "PhotoCell.h"
#import "Photo.h"

@implementation PhotoCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"PhotoCell" bundle:nil];
}

- (void)configureForPhoto:(Photo *)photo {
    _photoTitleLabel.text = photo.name;
    _photoDateLabel.text = [self.dateFormatter stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}

@end
