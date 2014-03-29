//
//  FRLProductGroup.m
//  farelFood
//
//  Created by crestana on 25/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLProductGroup.h"
#import "FRLProduct.h"

@interface FRLProductGroup ()
@property (nonatomic, strong) NSMutableOrderedSet *members;
@end


@implementation FRLProductGroup

+ (FRLProductGroup *)singleInstance
{
    static FRLProductGroup *_instance;
    
    @synchronized (self)
    {
        if (!_instance) {
            _instance = [[FRLProductGroup alloc] init];
        }
        
        return _instance;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSData *_archive = [[NSUserDefaults standardUserDefaults] objectForKey:@"FRLProductGroup"];
        if (!_archive) {
            _members = [[NSMutableOrderedSet alloc] init];
            [self syncInstance];
        }
        
        else {
            _members = [NSKeyedUnarchiver unarchiveObjectWithData:_archive];
        }
    }
    return self;
}


- (void)syncInstance
{
    NSData *_archive = [NSKeyedArchiver archivedDataWithRootObject:self.members];
    [[NSUserDefaults standardUserDefaults] setObject:_archive forKey:@"FRLProductGroup"];
}

- (void)addProduct:(FRLProduct *)product
{
    [self.members addObject:product.id];
    [self syncInstance];
}

- (void)removeProduct:(FRLProduct *)product
{
    [self.members removeObject:product.id];
    [self syncInstance];
}

- (BOOL)doesGroupContainTheProduct:(FRLProduct *)product
{
    return [self.members containsObject:product.id];
}

@end
