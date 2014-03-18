//
//  FRLTableViewCell.h
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRLTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *description;



@end
