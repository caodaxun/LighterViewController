# LighterViewController
slim down your view controller

Clean Table View Code <https://www.objc.io/issues/1-view-controllers/table-views/>

<https://www.objc.io/issues/1-view-controllers/lighter-view-controllers/>

更轻量的 view Controller <http://objccn.io/issue-1-1/>

更整洁的 tableView代码 <http://objccn.io/issue-1-2/>

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
	
##### Handling Multiple Cell Types
	- (UITableViewCell *)tableView:(UITableView *)tableView  
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
	{
    	NSString *key = self.keys[(NSUInteger) indexPath.row];
    	id value = [self.photo valueForKey:key];
    	UITableViewCell *cell;
    	if ([key isEqual:PhotoRatingKey]) {
        	cell = [self cellForRating:value indexPath:indexPath];
    	} else {
        	cell = [self detailCellForKey:key value:value];
    	}
    	return cell;
	}

	- (RatingCell *)cellForRating:(NSNumber *)rating
                    	 indexPath:(NSIndexPath *)indexPath
	{
  	  // ...
	}

	- (UITableViewCell *)detailCellForKey:(NSString *)key
                                value:(id)value
	{
    	// ...
	}
	
#####把网络请求逻辑移到 Model 层
	不要在 view controller 中做网络请求的逻辑。取而代之，你应该将它们封装到另一个类中。这样，你的 view controller 就可以在之后通过使用带有回调（比如一个 completion 的 block）来请求网络了。这样的好处是，缓存和错误控制也可以在这个类里面完成。
	
	
	

