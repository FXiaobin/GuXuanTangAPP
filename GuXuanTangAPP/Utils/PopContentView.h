//
//  PopContentView.h
//  CustomPopContentView
//
//  Created by fanxiaobin on 2017/4/6.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KLCPopup;

@interface PopContentView : NSObject

+ (KLCPopup *)showPopContentView:(UIView *)contentView;
+ (KLCPopup *)showPopContentViewForPay:(UIView *)contentView; ///支付
+ (KLCPopup *)showPopContentView:(UIView *)contentView duration:(CGFloat)duration;
+ (KLCPopup *)showPopContentViewFormBottom:(UIView *)contentView center:(CGPoint)center;

+ (KLCPopup *)showLoadingPopContentView:(UIView *)contentView;

@end
