//
//  FRLMainCategories.h
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FRLMainCategory;

@interface FRLMainCategories : NSObject
//@property (strong, nonatomic) NSMutableArray *categories;

+ (instancetype)sharedDataBase;

- (void)loadXMLFile:(NSString *)xmlFile loadedSuccessfully:(BOOL *)status;
- (NSUInteger)count;
- (FRLMainCategory *)categoryAtIndex:(NSUInteger)index;

@end
