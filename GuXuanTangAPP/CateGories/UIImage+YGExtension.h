//
//  UIImage+YGExtension.h
//  WealthCloud
//
//  Created by caifumap on 2017/3月/24.
//  Copyright © 2017年 caifumap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YGExtension)
/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//这两个方法都是剪裁为圆形image
- (UIImage *)roundedRect;
- (UIImage *)circleImage;

@end
