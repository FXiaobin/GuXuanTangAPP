//
//  NSString+YG.h
//  WealthCloud
//
//  Created by caifumap on 2017/3月/31.
//  Copyright © 2017年 caifumap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YG)
+(NSString *)jsonStringWithObject:(id)obj;
/// 给当前文件追加文档路径
- (NSString *)cz_appendDocumentDir;

/// 给当前文件追加缓存路径
- (NSString *)cz_appendCacheDir;

/// 给当前文件追加临时路径
- (NSString *)cz_appendTempDir;

- (BOOL)isSixNumber;
- (BOOL)isFourNumber;
- (BOOL)isMobilePhone;
-(BOOL)isCode;
-(BOOL)isPassword;
///是否是最多两位小数
-(BOOL)isTwoFloat;
///是否是正整数
- (BOOL)isPlusNum;
// 判断是否是身份证号码
+(BOOL)validateIdCard:(NSString *)idCard;

@end
