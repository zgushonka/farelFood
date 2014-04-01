//
//  FRLTableFavourites.m
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLTableFavourites.h"
#import "FRLProductGroup.h"
#import "FRLProducts.h"
#import "FRLProduct.h"
#import "FRLTableViewCell.h"
#import "FRLProductDetailed.h"

@interface FRLTableFavourites ()

@end

@implementation FRLTableFavourites

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"FRLTableViewCell" bundle:nil] forCellReuseIdentifier:@"ProductIdentifier"];
    self.favourites = [FRLProductGroup singleInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.productsToDisplay = [self.productsDatabase productsConformingGroup:self.favourites];
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //!
    self.productsToDisplay = [self.productsDatabase productsConformingGroup:self.favourites];
    //!
    return [self.productsToDisplay count];
    NSLog (@"There are: %d", [self.productsToDisplay count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductIdentifier"];
    if (cell == nil) {
        cell = [[FRLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProductIdentifier"];
    }
    
    //!
    self.productsToDisplay = [self.productsDatabase productsConformingGroup:self.favourites];
    //!
    FRLProduct *currentProduct = [self.productsToDisplay objectAtIndex:indexPath.row];
    
    NSAttributedString *currentProductAttributedName = [[NSAttributedString alloc] initWithString:currentProduct.name attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
    [cell.name setAttributedText:currentProductAttributedName];
    
    NSAttributedString *currentProductAttributedDescription = [[NSAttributedString alloc] initWithString:currentProduct.description attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1], NSForegroundColorAttributeName : [UIColor grayColor]}];
    [cell.description setAttributedText:currentProductAttributedDescription];
    
    [cell.preview setImage:[UIImage imageNamed:currentProduct.image]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRLProduct *selectedProduct = [self.productsToDisplay objectAtIndex:indexPath.row];
    [self showDetailsForProduct:selectedProduct];
}

- (void)showDetailsForProduct:(FRLProduct *)product
{
    FRLProductDetailed *detailedProductController = [[FRLProductDetailed alloc] init];
    detailedProductController.product = product;
    detailedProductController.title = product.name;
    [self.navigationController pushViewController:detailedProductController animated:YES];
}



@end
