//
//  FRLTableFavourites.h
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FRLProducts;
@class FRLProductGroup;

@interface FRLTableFavourites : UITableViewController
@property (nonatomic, strong) FRLProductGroup *favourites;
@property (nonatomic, strong) FRLProducts *productsDatabase;
@property (nonatomic, strong) NSArray *productsToDisplay;

@end
