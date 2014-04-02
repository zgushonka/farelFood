//
//  FRLMainCategories.m
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLMainCategories.h"
#import "FRLMainCategory.h"
#import "RXMLElement.h"

@interface FRLMainCategories ()
@property (strong, nonatomic) NSMutableArray *categories;
@end

@implementation FRLMainCategories

+ (instancetype)sharedDataBase
{
    static FRLMainCategories *_database;
    @synchronized (self)
    {
        if (!_database) {
            _database = [[FRLMainCategories alloc] init];
        }
        return _database;
    }
}

- (void)loadXMLFile:(NSString *)xmlFile loadedSuccessfully:(BOOL *)status
{
    RXMLElement *rootXML = [RXMLElement elementFromXMLFile:xmlFile];
    
    [rootXML iterate:@"categories.category" usingBlock:^(RXMLElement *rxmlCategory){
        FRLMainCategory *newCategory = [[FRLMainCategory alloc] init];
        newCategory.name = [rxmlCategory child:@"name"].text;
        newCategory.description = [rxmlCategory child:@"description"].text;
        newCategory.image = [rxmlCategory child:@"image"].text;
        
        NSMutableSet *newCategoryTags = [[NSMutableSet alloc] init];
        [rxmlCategory iterate:@"tag" usingBlock:^(RXMLElement *rxmlCategoryTag){
            [newCategoryTags addObject:rxmlCategoryTag.text];
        }];
        newCategory.tags = newCategoryTags;
        [self.categories addObject:newCategory];
    }];
}

- (NSMutableArray *)categories
{
    if (!_categories) {
        _categories = [[NSMutableArray alloc] init];
    }
    return _categories;
}

- (NSUInteger)count;
{
    return [self.categories count];
}

- (FRLMainCategory *)categoryAtIndex:(NSUInteger)index
{
    return [self.categories objectAtIndex:index];
}

@end