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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    [cell.preview setImage:[UIImage imageNamed:currentCategory.image]];
    

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

@end
