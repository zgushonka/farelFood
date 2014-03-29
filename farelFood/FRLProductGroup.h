//
//  FRLProductGroup.h
//  farelFood
//
//  Created by crestana on 25/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FRLProduct;

@interface FRLProductGroup : NSObject

+ (FRLProductGroup *)singleInstance;
- (void)syncInstance;

- (void)addProduct:(FRLProduct *)product;
- (void)removeProduct:(FRLProduct *)product;
- (BOOL)doesGroupContainTheProduct:(FRLProduct *)product;

@end
