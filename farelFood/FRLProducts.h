//
//  FRLProducts.h
//  farelFood
//
//  Created by crestana on 14/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FRLProductGroup;

@interface FRLProducts : NSObject

+ (FRLProducts *)sharedDataBase;

- (void)loadXMLFile:(NSString *)xmlFile loadedSuccessfully:(BOOL *)status;
- (NSUInteger)countOfProducts;
- (NSMutableArray *)productsConformingTags:(NSMutableSet *)tags;
- (NSMutableArray *)productsConformingGroup:(FRLProductGroup *)group;

@end
