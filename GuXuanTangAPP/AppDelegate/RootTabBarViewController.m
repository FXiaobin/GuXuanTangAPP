//
//  RootTabBarViewController.m
//  FF_CustomBarAppearence
//
//  Created by fanxiaobin on 2017/9/27.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "UITabBarController+Init.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customNavigationBarAppearence];
    
    NSArray *titles = @[@"首页",@"直播",@"自选",@"头条新闻",@"我的"];
    NSArray *imageArr = @[@"tabBar_home",@"tabBar_play",@"自选",@"tabBar_news",@"tabBar_my"];
    NSArray *selectImageArr = @[@"tabBar_home_selected",@"tabBar_play_selected",@"自选",@"tabBar_news_selected",@"tabBar_my_selected"];
    NSArray *viewControllerNames = @[@"HomeViewController",@"LiveViewController",@"StockChooseViewController",@"NewsViewController",@"PersonalViewController"];
    
    [self setupTabBarControllerWithViewControllerNames:viewControllerNames titles:titles normalImages:imageArr selectedImages:selectImageArr];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
