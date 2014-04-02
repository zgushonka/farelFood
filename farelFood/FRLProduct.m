//
//  FRLProduct.m
//  farelFood
//
//  Created by crestana on 14/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLProduct.h"

@implementation FRLProduct

- (id)initWithCoder:(NSCoder *)decoder //deprecated
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [decoder decodeObjectForKey:@"name"];
    self.description = [decoder decodeObjectForKey:@"description"];
    self.tags = [decoder decodeObjectForKey:@"tags"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder //deprecated
{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.description forKey:@"description"];
    [encoder encodeObject: self.tags forKey:@"tags"];
}

- (instancetype)initWithName:(NSString *)name andDescription:(NSString *)description andTags:(NSMutableSet *)tags
{
    self = [super init];
    if (self) {
        self.name = name;
        self.description = description;
        self.tags = tags;
    }
    return self;
}

- (NSMutableSet *)tags
{
    if (!_tags) {
        _tags = [[NSMutableSet alloc] init];
    }
    return _tags;
}

- (void)addTag:(NSString *)tag
{
    [self.tags addObject:tag];
}

- (void)removeTag:(NSString *)tag
{
    [self.tags removeObject:tag];
}


@end
