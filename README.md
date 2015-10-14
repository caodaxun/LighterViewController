# LighterViewController
slim down your view controller

<https://www.objc.io/issues/1-view-controllers/lighter-view-controllers/>

![alt text](http://cl.ly/dWWG/IMG_1224.PNG)

##### PhotosViewController
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

##### ArrayDataSource
	- (instancetype)init {
    	return nil;
	}

	- (instancetype)initWithItems:(NSArray *)anItems
    		   	    cellIdentifier:(NSString *)aCellIdentifier
 	 			configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    
    	self = [super init];
    	if (self) {
    	    _items = anItems;
        	_cellIdentifier = aCellIdentifier;
        	_configureCellBlock = [aConfigureCellBlock copy];
    	}
    	return self;
	}

	- (instancetype)itemAtIndexPath:(NSIndexPath *)indexPath {
    	return _items[indexPath.row];
	}



	- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    	return self.items.count;
	}

	- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier
                                                            forIndexPath:indexPath];
    	id item = [self itemAtIndexPath:indexPath];
    	_configureCellBlock(cell, item);
    	return cell;
	}
##### PhotoCell
	+ (UINib *)nib {
    	return [UINib nibWithNibName:@"PhotoCell" bundle:nil];
	}

	- (void)configureForPhoto:(Photo *)photo {
    	_photoTitleLabel.text = photo.name;
    	_photoDateLabel.text = [self.dateFormatter stringFromDate:photo.creationDate];
	}
	
	
	

