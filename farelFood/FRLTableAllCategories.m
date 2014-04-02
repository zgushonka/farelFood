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
@property (nonatomic, strong) UISearchBar *bar;
@end

@implementation FRLTableAllCategories

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"FRLTableViewCell" bundle:nil] forCellReuseIdentifier:@"CategoryIdentifier"];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
  //!-- REWRITE THIS
    self.bar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    self.bar.placeholder = @"Type product name or description here";
    self.bar.searchBarStyle = UISearchBarStyleProminent;
    self.bar.delegate = self;
    self.tableView.tableHeaderView = self.bar;
  //----!
}


//!-- THIS BLOCK IS USED FOR TRAINING PURPOSES ONLY
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"Text %@ has been entered", searchText);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"Search bar clicked");
    [self.bar resignFirstResponder];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"Clear bar clicked");
    [self.bar resignFirstResponder];
    self.bar.text = @"";
}
//--!

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mainCategoriesDatabase count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryIdentifier"];
    if (cell == nil) {
        cell = [[FRLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CategoryIdentifier"];
    }
    
    FRLMainCategory *currentCategory = [self.mainCategoriesDatabase categoryAtIndex:indexPath.row];
    
    NSAttributedString *currentCategoryAttributedName = [[NSAttributedString alloc] initWithString:currentCategory.name attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleBody]}];
    [cell.name setAttributedText:currentCategoryAttributedName];
    
    NSAttributedString *currentCategoryAttributedDescription = [[NSAttributedString alloc] initWithString:currentCategory.description attributes:@{ NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1], NSForegroundColorAttributeName : [UIColor grayColor]}];
    [cell.description setAttributedText:currentCategoryAttributedDescription];
    
    [cell.preview setImage:[UIImage imageNamed:currentCategory.image]];    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FRLMainCategory *selectedCategory = [self.mainCategoriesDatabase categoryAtIndex:indexPath.row];
    [self showControllerWithCategory:selectedCategory];
}

- (void)showControllerWithCategory:(FRLMainCategory *)category
{
    NSArray *productsInSelectedCategory = [self.productsDatabase productsConformingTags:category.tags];
    FRLProductList *productsController = [[FRLProductList alloc] init];
    productsController.productsToDisplay = productsInSelectedCategory;
    productsController.title = category.name;    
    [self.navigationController pushViewController:productsController animated:YES];
}

@end
