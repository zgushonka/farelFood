//
//  FRLProductList.m
//  farelFood
//
//  Created by crestana on 19/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLProductList.h"
#import "FRLTableViewCell.h"
#import "FRLProduct.h"
#import "FRLProductDetailed.h"

@implementation FRLProductList

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"FRLTableViewCell" bundle:nil] forCellReuseIdentifier:@"ProductIdentifier"];
}

#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Tester";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.productsToDisplay count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductIdentifier"];
    if (cell == nil) {
        cell = [[FRLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProductIdentifier"];
    }
    
    FRLProduct *currentProduct = [self.productsToDisplay objectAtIndex:indexPath.row];
    
    NSAttributedString *currentProductAttributedName = [[NSAttributedString alloc] initWithString:currentProduct.name attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
    [cell.name setAttributedText:currentProductAttributedName];
    
    NSAttributedString *currentProductAttributedDescription = [[NSAttributedString alloc] initWithString:currentProduct.description attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1], NSForegroundColorAttributeName : [UIColor grayColor]}];
    [cell.description setAttributedText:currentProductAttributedDescription];
    
    [cell.preview setImage:[UIImage imageNamed:currentProduct.image]];
    return cell;
}

#pragma mark - Table view delegate
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
