//
//  FRLTableAllCategories.m
//  farelFood
//
//  Created by crestana on 18/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLTableAllCategories.h"
#import "FRLTableViewCell.h"
#import "FRLMainCategory.h"
#import "FRLMainCategories.h"
#import "FRLProducts.h"
#import "FRLProductList.h"

@interface FRLTableAllCategories ()

@end

@implementation FRLTableAllCategories

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FRLTableViewCell" bundle:nil] forCellReuseIdentifier:@"CategoryIdentifier"];
    
  //!-- REWRITE THIS
    UISearchBar *new = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 420, 30)];
    self.tableView.tableHeaderView = new;
  //----!
    
    
  
    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.mainCategoriesDatabase countOfMainCategories];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    FRLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryIdentifier"];
    if (cell == nil) {
        cell = [[FRLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CategoryIdentifier"];
    }
    
    FRLMainCategory *currentCategory = [self.mainCategoriesDatabase categoryAtIndex:indexPath.row];
    
    NSAttributedString *currentCategoryAttributedName = [[NSAttributedString alloc] initWithString:currentCategory.name attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];

    
    NSAttributedString *currentCategoryAttributedDescription = [[NSAttributedString alloc] initWithString:currentCategory.description attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1], NSForegroundColorAttributeName : [UIColor grayColor]}];
    
    [cell.name setAttributedText:currentCategoryAttributedName];
    [cell.description setAttributedText:currentCategoryAttributedDescription];
    

    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRLMainCategory *selectedCategory = [self.mainCategoriesDatabase categoryAtIndex:indexPath.row];
    NSArray *foundProducts = [self.productsDatabase productsConformingTags:selectedCategory.tags];
    
    FRLProductList *foundProductsController = [[FRLProductList alloc] init];
    foundProductsController.productsToDisplay = foundProducts;
    foundProductsController.title = selectedCategory.name;
    
    [self.navigationController pushViewController:foundProductsController animated:YES];
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
