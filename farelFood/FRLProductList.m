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

@interface FRLProductList ()

@end

@implementation FRLProductList

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"FRLTableViewCell" bundle:nil] forCellReuseIdentifier:@"ProductIdentifier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Tester";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.productsToDisplay count];
    NSLog (@"There are: %d", [self.productsToDisplay count]);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    FRLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductIdentifier"];
    if (cell == nil) {
        cell = [[FRLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProductIdentifier"];
    }
    
    FRLProduct *currentProduct = [self.productsToDisplay objectAtIndex:indexPath.row];
    
    NSAttributedString *currentProductAttributedName = [[NSAttributedString alloc] initWithString:currentProduct.name attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
    
    
    NSAttributedString *currentProductAttributedDescription = [[NSAttributedString alloc] initWithString:currentProduct.description attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1], NSForegroundColorAttributeName : [UIColor grayColor]}];
    
    [cell.name setAttributedText:currentProductAttributedName];
    [cell.description setAttributedText:currentProductAttributedDescription];
    [cell.preview setImage:[UIImage imageNamed:currentProduct.image]];
    
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRLProduct *selectedProduct = [self.productsToDisplay objectAtIndex:indexPath.row];
    FRLProductDetailed *detailedProductController = [[FRLProductDetailed alloc] init];
    
    detailedProductController.product = selectedProduct;
    detailedProductController.title = selectedProduct.name;
    
    [self.navigationController pushViewController:detailedProductController animated:YES];
}

@end
