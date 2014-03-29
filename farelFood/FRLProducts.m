//
//  FRLProducts.m
//  farelFood
//
//  Created by crestana on 14/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLProducts.h"
#import "FRLProduct.h"
#import "RXMLElement.h"
#import "FRLProductGroup.h"

@interface FRLProducts ()
@property (strong, nonatomic) NSMutableArray *products;
@end

@implementation FRLProducts

+ (FRLProducts *)sharedDataBase
{
    static FRLProducts *_database;
    
    @synchronized (self)
    {
        if (!_database) {
            _database = [[FRLProducts alloc] init];
        }
        
        return _database;
    }
}

- (void)loadXMLFile:(NSString *)xmlFile loadedSuccessfully:(BOOL *)status
{
    
    RXMLElement *rootXML = [RXMLElement elementFromXMLFile:xmlFile];
    
    [rootXML iterate:@"products.product" usingBlock:^(RXMLElement *rxmlProduct){
        FRLProduct *newProduct = [[FRLProduct alloc] init];
    
        newProduct.id = [rxmlProduct attribute:@"id"];
        newProduct.name = [rxmlProduct child:@"name"].text;
        newProduct.description = [rxmlProduct child:@"description"].text;
        newProduct.image = [rxmlProduct child:@"image"].text;
        newProduct.status = [rxmlProduct child:@"status"].text;
        
        NSMutableSet *newProductTags = [[NSMutableSet alloc] init];
        
        [rxmlProduct iterate:@"tag" usingBlock:^(RXMLElement *rxmlProductTag){
            
            [newProductTags addObject:rxmlProductTag.text];
        }];
        newProduct.tags = newProductTags;
        
        [self.products addObject:newProduct];
    }];
}

- (NSMutableArray *)products
{
    if (!_products) {
        _products = [[NSMutableArray alloc] init];
    }
    return _products;
}

- (NSUInteger)countOfProducts
{
    return [self.products count];
}

- (NSMutableArray *)productsConformingTags:(NSMutableSet *)tags
{
    NSMutableArray *_conformingProducts = [[NSMutableArray alloc] init];
    for (FRLProduct *_currentProduct in self.products) {
        if ([tags isSubsetOfSet:_currentProduct.tags]) {
            [_conformingProducts addObject:_currentProduct];
        }
    }
    
    return _conformingProducts;
}

- (NSMutableArray *)productsConformingGroup:(FRLProductGroup *)group
{
    NSMutableArray *_conformingProducts = [[NSMutableArray alloc] init];
    for (FRLProduct *_currentProduct in self.products) {
        if ([group doesGroupContainTheProduct:_currentProduct]) {
            [_conformingProducts addObject:_currentProduct];
        }
    }
    
    return _conformingProducts;
}

@end
