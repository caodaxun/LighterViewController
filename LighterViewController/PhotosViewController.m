//
//  PhotosViewController.m
//  LighterViewController
//
//  Created by caodaxun_iMac on 15/10/14.
//  Copyright © 2015年 SWCM. All rights reserved.
//

#import "PhotosViewController.h"
#import "AppDelegate.h"
#import "Store.h"
#import "ArrayDataSource.h"
#import "PhotoCell.h"
#import "Photo.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";

@interface PhotosViewController ()

@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"Photos";
    [self setupTableView];
}

- (void)setupTableView {
    
    TableViewCellConfigureBlock configureCell = ^(PhotoCell *cell, Photo *photo){
        [cell configureForPhoto:photo];
    };
    
    NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
    _photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
                                                     cellIdentifier:PhotoCellIdentifier
                                                 configureCellBlock:configureCell];
    self.tableView.dataSource = _photosArrayDataSource;
    [self.tableView registerNib:[PhotoCell nib] forCellReuseIdentifier:PhotoCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    PhotoViewController *photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController"
//                                                                                     bundle:nil];
//    photoViewController.photo = [self.photosArrayDataSource itemAtIndexPath:indexPath];
//    [self.navigationController pushViewController:photoViewController animated:YES];
}


@end
