//
//  FRLProduct.h
//  farelFood
//
//  Created by crestana on 14/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRLProduct : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSMutableSet *tags;

- (instancetype) initWithName:(NSString *)name andDescription:(NSString *)description andTags:(NSMutableSet *)tags;
- (void)addTag:(NSString *)tag;
- (void)removeTag:(NSString *)tag;




@end
