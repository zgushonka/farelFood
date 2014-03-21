//
//  FRLProductDetailed.m
//  farelFood
//
//  Created by crestana on 21/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLProductDetailed.h"
#import "FRLProduct.h"

@interface FRLProductDetailed ()

@end

@implementation FRLProductDetailed

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.status.text = self.product.status;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
