//
//  FRLMainCategories.m
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLMainCategories.h"

@implementation FRLMainCategories

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.categories = [[NSMutableArray alloc] init];
        
        FRLMainCategory *currentCategory;
        
        currentCategory = [[FRLMainCategory alloc] initWithName:@"Fruits" andDescription:@"Juicy fruits are there" andTags:[NSMutableSet setWithObjects:@"fruits", nil]];
        
        [self.categories addObject:currentCategory];
        
        
        currentCategory = [[FRLMainCategory alloc] initWithName:@"Vegetables" andDescription:@"Healthy vegetables are here" andTags:[NSMutableSet setWithObjects:@"vegetables", nil]];
        
        [self.categories addObject:currentCategory];
        
        currentCategory = [[FRLMainCategory alloc] initWithName:@"Bread" andDescription:@"Nice bread and wheat" andTags:[NSMutableSet setWithObjects:@"bread", nil]];
        
        [self.categories addObject:currentCategory];
    }
    return self;
}

- (FRLMainCategory *)categoryAtIndex:(NSUInteger)index
{
    return [self.categories objectAtIndex:index];
}

- (NSUInteger)count;
{
    return [self.categories count];
}



@end
