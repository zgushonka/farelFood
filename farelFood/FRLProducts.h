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

+ (instancetype)sharedDataBase;

- (void)loadXMLFile:(NSString *)xmlFile loadedSuccessfully:(BOOL *)status;
- (NSUInteger)count;
- (NSArray *)productsConformingTags:(NSMutableSet *)tags;
- (NSArray *)productsConformingGroup:(FRLProductGroup *)group;

@end
