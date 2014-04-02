//
//  FRLAppDelegate.m
//  farelFood
//
//  Created by crestana on 14/03/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "FRLAppDelegate.h"
#import "FRLProducts.h"
#import "FRLTableAllCategories.h"
#import "FRLTableFavourites.h"
#import "FRLMainCategories.h"


@implementation FRLAppDelegate

- (void)setupControllers
{
    FRLTableAllCategories *categoriesController = [[FRLTableAllCategories alloc] init];
    categoriesController.mainCategoriesDatabase = [FRLMainCategories sharedDataBase];
    [categoriesController.mainCategoriesDatabase loadXMLFile:@"Main Categories.xml" loadedSuccessfully:nil];
    categoriesController.productsDatabase = [FRLProducts sharedDataBase];
    [categoriesController.productsDatabase loadXMLFile:@"Products.xml" loadedSuccessfully:nil];
    categoriesController.title = @"Categories";
    
    

    FRLTableFavourites *favouritesController = [[FRLTableFavourites alloc] init];
    
    

    UINavigationController *categoriesNavigationController = [[UINavigationController alloc] initWithRootViewController:categoriesController];
    categoriesNavigationController.title = @"All products";
//    categoriesNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:252/255.0f green:142/255.0f blue:0/255.0f alpha:0.0001f];
    
    

    UINavigationController *favouritesNavigationController = [[UINavigationController alloc] initWithRootViewController:favouritesController];
    favouritesNavigationController.title = @"Favourites";
    favouritesNavigationController.tabBarItem.image = [UIImage imageNamed:@"favButtonFavourited.png"];
    
    

    UITabBarController *mainTabController = [[UITabBarController alloc] init];
//    mainTabController.tabBar.barTintColor = [UIColor colorWithRed:252/255.0f green:142/255.0f blue:0/255.0f alpha:0.0001f];
    [mainTabController addChildViewController:categoriesNavigationController];
    [mainTabController addChildViewController:favouritesNavigationController];
    
    
    
    self.window.rootViewController = mainTabController;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self setupControllers];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
