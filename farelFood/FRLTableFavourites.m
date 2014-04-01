//
//  FRLTableFavourites.m
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLTableFavourites.h"
#import "FRLProductGroup.h"
#import "FRLProducts.h"

@interface FRLTableFavourites ()
@property BOOL isFirstAppear;
@end

@implementation FRLTableFavourites

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isFirstAppear = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.favourites = [FRLProductGroup singleInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.productsToDisplay = [self.productsDatabase productsConformingGroup:self.favourites];
    if (!self.isFirstAppear) {
        [self.tableView reloadData];
    }
    self.isFirstAppear = NO;
}
@end
