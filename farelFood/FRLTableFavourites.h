//
//  FRLTableFavourites.h
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRLProductList.h"
@class FRLProductGroup;
@class FRLProducts;

@interface FRLTableFavourites : FRLProductList
@property (nonatomic, strong) FRLProductGroup *favourites;
@property (nonatomic, strong) FRLProducts *productsDatabase;

@end
