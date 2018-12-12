//
//  UIImage+Utilities.h
//  WoxTeacher
//
//  Created by 梁永升 on 2018/2/5.
//  Copyright © 2018年 梁永升. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FHColorGradientType) {
    FHGradientTypeTopToDown = 0,
    FHGradientTypeLiftToRight,
    FHGradientTypeDiagonal,
};

@interface UIImage (DYUtilities)

/**
 *  颜色渐变图片
 *
 *  @param colors 渐变色
 *  @param frame  frame
 *  @param type   渐变方式
 *
 *  @return 渐变图片
 */
+ (UIImage *)imageFromColors:(NSArray *)colors
                   withFrame:(CGRect)frame
        andColorGradientType:(FHColorGradientType)type;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end
