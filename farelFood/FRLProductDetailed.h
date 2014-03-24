//
//  FRLProductDetailed.h
//  farelFood
//
//  Created by crestana on 24/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FRLProduct;

@interface FRLProductDetailed : UIViewController <UIScrollViewDelegate>
@property (nonatomic, weak) FRLProduct *product;
@property (nonatomic, strong) UIScrollView *view;

@end
