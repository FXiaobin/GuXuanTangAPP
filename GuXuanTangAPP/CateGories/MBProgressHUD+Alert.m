//
//  MBProgressHUD+Alert.m
//  WealthCloud
//
//  Created by fanxiaobin on 2017/4/19.
//  Copyright © 2017年 caifumap. All rights reserved.
//

#import "MBProgressHUD+Alert.h"

#define kMBProgressHUDDelayTimeInterval     2.0



@implementation MBProgressHUD (Alert)

+ (UIWindow *)keyWindow{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil) {
        window = [UIApplication sharedApplication].windows.firstObject;
    }
   
    return window;
}

///提示显示
+(MBProgressHUD *)showAlert:(NSString *)text image:(NSString *)imageName{
    HiddenLoading;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[MBProgressHUD keyWindow] animated:YES];
    hud.label.text = text;
    hud.label.font = kFont(kSCALE(30.0));
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color = kHexColor(0x333333);
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    
    if (imageName.length > 0) {
        hud.mode = MBProgressHUDModeCustomView;
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSCALE(80), kSCALE(80))];
        icon.image = [UIImage imageNamed:imageName];
        hud.customView = icon;
        
    }else{
        hud.mode = MBProgressHUDModeText;
    }
    
    [hud hideAnimated:YES afterDelay:kMBProgressHUDDelayTimeInterval];
    
    return hud;
    
}

///加载提示...
+(MBProgressHUD *)showLoadingWithText:(NSString *)text{
    HiddenLoading;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[MBProgressHUD keyWindow] animated:YES];
    hud.label.text = text;
    hud.label.font = kFont(kSCALE(30.0));
    //默认是菊花加载 MBProgressHUDModeIndeterminate
    //hud.mode = MBProgressHUDModeText;
    
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color = kHexColor(0x333333);
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;

    return hud;
}

+ (void)hiddenHUD{
   [MBProgressHUD hideHUDForView:[MBProgressHUD keyWindow] animated:YES];
}

@end
