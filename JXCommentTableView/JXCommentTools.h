//
//  JXCommentTools.h
//  JXCommentTableView
//
//  Created by JosephXuan on 2019/10/28.
//  Copyright © 2019 JosephXuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Masonry.h>
#import <SDWebImage.h>
#import <YYModel.h>
#import <YYText.h>
#import "UIColor+JXHex.h"


#define KAppColorRGB(R,G,B)             [UIColor colorWithRed:R / 255.0 green:G / 255.0  blue:B / 255.0  alpha:1.0]
//Window相关
#define KAppScreenWidth                 [UIScreen mainScreen].bounds.size.width
#define KAppScreenHeight                [UIScreen mainScreen].bounds.size.height
/// 是否 ipad
#define is_IPad [JXAVPlayerTools isIPad]
/// 是否全面屏设备
#define IS_NOTCHED_SCREEN [JXAVPlayerTools isNotchedScreen]

//判断iPhone5系列
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !is_IPad : NO)
//判断iPhone6系列
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !is_IPad : NO)
//判断iphone6+系列
#define iPhone7plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !is_IPad : NO)
//判断iPhoneX
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !is_IPad : NO)
//判断iPHoneXr iPhone 11
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !is_IPad : NO)
//判断iPhoneXs Phone 11 Pro
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !is_IPad : NO)
//判断iPhoneXs Max iPhone 11 Pro Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !is_IPad : NO)

// 状态栏高度
#define STATUS_BAR_HEIGHT (is_IPad ? (IS_NOTCHED_SCREEN ? 24 : 20) : ((iPhoneX==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0))
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (is_IPad ? (IS_NOTCHED_SCREEN ? 68 : 64) : ((iPhoneX==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0))
// tabBar高度
#define TAB_BAR_HEIGHT (is_IPad ? (IS_NOTCHED_SCREEN ? 65 : 50) : ((iPhoneX==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0))
// home indicator
#define HOME_INDICATOR_HEIGHT ((iPhoneX==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 34.0 : 0.0)

@interface JXCommentTools : NSObject
//伪造的本地数据
+(NSDictionary *)dataDicForExamList;
@end


