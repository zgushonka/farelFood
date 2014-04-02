//
//  FRLTableAllCategories.h
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FRLMainCategories;
@class FRLProducts;

@interface FRLTableAllCategories : UITableViewController <UISearchBarDelegate>
@property (nonatomic, strong) FRLMainCategories *mainCategoriesDatabase;
@property (nonatomic, strong) FRLProducts *productsDatabase;

@end
