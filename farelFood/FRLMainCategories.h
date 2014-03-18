//
//  FRLMainCategories.h
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//






// Must be totally rewritten for XML support. Now it's a dumb class for testing support only.


#import <Foundation/Foundation.h>
#import "FRLMainCategory.h"

@interface FRLMainCategories : NSObject
@property (strong, nonatomic) NSMutableArray *categories;

- (FRLMainCategory *)categoryAtIndex:(NSUInteger)index;
- (NSUInteger)count;

@end
