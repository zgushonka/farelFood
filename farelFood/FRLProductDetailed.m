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
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"Content offset X = %f and Y = %f", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

- (void)setupProductImage
{
    self.image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.product.image]];
    self.image.frame = CGRectMake(0, 0, 320, 200);
    [self.view addSubview:self.image];
}

- (void)setupProductStatus
{
    self.status = [[UILabel alloc] initWithFrame:CGRectMake(20, 205, 100, 50)];
//    self.status.backgroundColor = [UIColor blackColor];
    self.status.text = self.product.status;
    self.status.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    if ([self.product.status isEqualToString:@"Allowed"]) {
        self.status.textColor = [UIColor greenColor];
    }
    
    if ([self.product.status isEqualToString:@"Not recommended"]) {
        self.status.textColor = [UIColor redColor];
    }
    
    [self.view addSubview:self.status];
}

- (void)setupProductDescription
{
    self.description = [[UITextView alloc] initWithFrame:CGRectMake(15, 250, 300, 0)];
    self.description.text = self.product.description;
    [self.description sizeToFit];
    self.description.scrollEnabled = NO;
    self.description.editable = NO;
    [self.view addSubview:self.description];
}



- (void)setupViewSizeToFitContent
{
    self.view.contentSize = CGSizeMake(320, self.description.frame.origin.y + self.description.frame.size.height);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[UIScrollView alloc] init];
    self.view.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupProductImage];
    [self setupProductDescription];
    [self setupProductStatus];
    [self setupViewSizeToFitContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
