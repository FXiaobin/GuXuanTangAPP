//
//  MBProgressHUD+Alert.h
//  WealthCloud
//
//  Created by fanxiaobin on 2017/4/19.
//  Copyright © 2017年 caifumap. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>
#define ShowView            [MBProgressHUD showView];

#define ShowSuccessAlert(text)  [MBProgressHUD showAlert:text image:@"finish"]
#define ShowInfoAlert(text)     [MBProgressHUD showAlert:text image:@""]
#define ShowErrorAlert(text)    [MBProgressHUD showAlert:text image:@"error"]
#define ShowTextAlert(text)     [MBProgressHUD showAlert:text image:nil]
#define ShowLoading(text)       [MBProgressHUD showLoadingWithText:text]
#define HiddenLoading           [MBProgressHUD hiddenHUD]

@interface MBProgressHUD (Alert)


+(MBProgressHUD *)showLoadingWithText:(NSString *)text;

+(MBProgressHUD *)showAlert:(NSString *)text image:(NSString *)imageName;

+ (void)hiddenHUD;

@end
