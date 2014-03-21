//
//  FRLProductDetailed.h
//  farelFood
//
//  Created by crestana on 21/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FRLProduct;

@interface FRLProductDetailed : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *status;



@property (nonatomic, strong) FRLProduct *product;

@end
