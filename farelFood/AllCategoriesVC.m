//
//  AllCategoriesVC.m
//  farelFood
//
//  Created by oleksandr.buravlyov on 4/2/14.
//  Copyright (c) 2014 farel. All rights reserved.
//

#import "AllCategoriesVC.h"

#define BUTTON_SIZE 88.0
#define SCREEN_BORDER 20.0
#define BUTTON_SPACE 8.0

@interface AllCategoriesVC ()

@end

@implementation AllCategoriesVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create categories buttons
    NSInteger categoriesCount = [self getCategoriesCount];
    NSInteger buttonsInLine = [self getButtonsCountInLine];
    
    NSInteger buttonLinesCount = [self calcButtonLinesCount];
    
    for (int line=  0; line < buttonLinesCount; line++) {
        for (int row = 0; row < buttonsInLine; row++) {
            int buttonIndex = (line * buttonsInLine) +  row;
            if (buttonIndex == categoriesCount) break;  //  stop ctrate buttons
            
            CGFloat originX = SCREEN_BORDER + (BUTTON_SIZE * row) + (BUTTON_SPACE * row);
            CGFloat originY = SCREEN_BORDER + (BUTTON_SIZE * line) + (BUTTON_SPACE * line);
            CGRect buttonRect = CGRectMake(originX, originY, BUTTON_SIZE, BUTTON_SIZE);
            
            UIButton *button = [[UIButton alloc] initWithFrame:buttonRect];
            button.tag = buttonIndex + 1;
            button.backgroundColor = [UIColor grayColor];
            //  set button image
            //  set button lable
            
            [self.view addSubview:button];
        }
    }
}

- (NSInteger)calcButtonLinesCount
{
    NSInteger categoriesCount = [self getCategoriesCount];
    NSInteger buttonsInLine = [self getButtonsCountInLine];
    
    int fullLines = (categoriesCount / buttonsInLine);
    int remain = (categoriesCount % buttonsInLine);
    int partialLines = (remain > 0) ? 1 : 0;
    NSInteger buttonLinesCount = fullLines + partialLines;
    return buttonLinesCount;
}

- (NSInteger)getCategoriesCount
{
    return 5;
}

- (NSInteger)getButtonsCountInLine
{
    return 3;
}

- (CGFloat)getScreenWidth
{
    return 320.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
