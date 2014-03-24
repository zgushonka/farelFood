//
//  FRLProductDetailed.m
//  farelFood
//
//  Created by crestana on 24/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLProductDetailed.h"
#import "FRLProduct.h"

@interface FRLProductDetailed ()

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UITextView *description;
@property (nonatomic, strong) UILabel *status;
@property (nonatomic, strong) UIButton *favourites;

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
    self.view = [[UIScrollView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.contentSize = CGSizeMake(320, 3000);
    
    
    self.image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.product.image]];
    self.image.frame = CGRectMake(0, 0, 320, 200);

    
    self.description = [[UITextView alloc] initWithFrame:CGRectMake(15, 220, 300, 0)];
    self.description.text = self.product.description;
    [self.description sizeToFit];
    self.description.scrollEnabled = NO;
    self.description.editable = NO;
    
    [self.view addSubview:self.description];
    [self.view addSubview:self.image];
    
    CGFloat viewHeight = self.description.frame.origin.y + self.description.frame.size.height;
    self.view.contentSize = CGSizeMake(320, viewHeight);

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
