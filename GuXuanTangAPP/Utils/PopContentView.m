//
//  PopContentView.m
//  CustomPopContentView
//
//  Created by fanxiaobin on 2017/4/6.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "PopContentView.h"
#import "KLCPopup.h"

@implementation PopContentView

+ (KLCPopup *)showPopContentViewForPay:(UIView *)contentView{
    
    KLCPopupLayout layout = KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter, KLCPopupVerticalLayoutAboveCenter);
    
    KLCPopup *popup = [KLCPopup popupWithContentView:contentView showType:KLCPopupShowTypeBounceIn dismissType:KLCPopupDismissTypeBounceOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    [popup showWithLayout:layout];
    
    return popup;
}

+ (KLCPopup *)showPopContentView:(UIView *)contentView{
 
    return [self showPopContentView:contentView duration:0.0];
}

+ (KLCPopup *)showPopContentView:(UIView *)contentView duration:(CGFloat)duration{
    
    KLCPopupLayout layout = KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter, KLCPopupVerticalLayoutCenter);
    
    KLCPopup *popup = [KLCPopup popupWithContentView:contentView showType:KLCPopupShowTypeBounceIn dismissType:KLCPopupDismissTypeBounceOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    
    [popup showWithLayout:layout duration:duration];
    
    return popup;
}

+ (KLCPopup *)showPopContentViewFormBottom:(UIView *)contentView center:(CGPoint)center{
   
    
    KLCPopup *popup = [KLCPopup popupWithContentView:contentView showType:KLCPopupShowTypeSlideInFromBottom dismissType:KLCPopupDismissTypeSlideOutToBottom maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    [popup showAtCenter:center inView:[UIApplication sharedApplication].keyWindow];
    
    return popup;
}

+ (KLCPopup *)showLoadingPopContentView:(UIView *)contentView{
    
    KLCPopupLayout layout = KLCPopupLayoutMake(KLCPopupHorizontalLayoutCenter, KLCPopupVerticalLayoutCenter);
    
    KLCPopup *popup = [KLCPopup popupWithContentView:contentView showType:KLCPopupShowTypeFadeIn dismissType:KLCPopupDismissTypeFadeOut maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:NO dismissOnContentTouch:NO];
    
    [popup showWithLayout:layout];
    
    return popup;
}


@end
