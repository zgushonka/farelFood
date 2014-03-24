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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Tester";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
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
//    cell.image.frame = CGRectMake(0, 0, 160, 160);
    
    
    
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



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
