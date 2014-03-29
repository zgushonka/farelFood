//
//  FRLProductDetailed.m
//  farelFood
//
//  Created by crestana on 24/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLProductDetailed.h"
#import "FRLProduct.h"

//!---------TEMP

#import "FRLProductGroup.h"

//-------------!

@interface FRLProductDetailed ()

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UITextView *description;
@property (nonatomic, strong) UILabel *status;
@property (nonatomic, strong) UIButton *favButton;
@property (nonatomic, strong) UIView *statusView;

@property (nonatomic, strong) FRLProductGroup *favourites;

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
    [self.image setFrame:CGRectMake(0, 0, 320, 200)];
    [self.view addSubview:self.image];
}

- (void)setupProductStatus
{
    self.status = [[UILabel alloc] initWithFrame:CGRectMake(20, 205, 150, 50)];
    [self.status setText:self.product.status];
    [self.status setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    
    if ([self.product.status isEqualToString:@"Allowed"]) {
        [self.status setTextColor:[UIColor greenColor]];
    }
    
    if ([self.product.status isEqualToString:@"Not recommended"]) {
        [self.status setTextColor:[UIColor redColor]];
    }
    
    [self.view addSubview:self.status];
}

- (void)setupFavouritesButton
{
    self.favButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.favButton setFrame:CGRectMake(200, 205, 50, 50)];
    [self.favButton addTarget:self action:@selector(favButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self refreshFavouritesButtonState];
    [self.view addSubview:self.favButton];
}

- (void)refreshFavouritesButtonState
{
    if ([self.favourites doesGroupContainTheProduct:self.product]) {
        [self.favButton setImage:[UIImage imageNamed:@"favButtonFavourited.png"] forState:UIControlStateNormal];
    }
    
    else {
        [self.favButton setImage:[UIImage imageNamed:@"favButtonUnfavourited.png"] forState:UIControlStateNormal];
    }
}

- (void)favButtonPressed
{
    if ([self.favourites doesGroupContainTheProduct:self.product]) {
        [self.favourites removeProduct:self.product];
    }

    else {
        [self.favourites addProduct:self.product];
    }
    
    [self refreshFavouritesButtonState];
}

- (void)setupProductDescription
{
    self.description = [[UITextView alloc] initWithFrame:CGRectMake(15, 250, 300, 0)];
    [self.description setText:self.product.description];
    [self.description sizeToFit];
    [self.description setScrollEnabled:NO];
    [self.description setEditable:NO];
    [self.view addSubview:self.description];
}



- (void)setupViewSizeToFitContent
{
    self.view.contentSize = CGSizeMake(320, self.description.frame.origin.y + self.description.frame.size.height);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.favourites = [FRLProductGroup singleInstance];
    self.view = [[UIScrollView alloc] init];
    [self.view setDelegate:self];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setupProductImage];
    [self setupProductDescription];
    [self setupProductStatus];
    [self setupFavouritesButton];
    [self setupViewSizeToFitContent];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
