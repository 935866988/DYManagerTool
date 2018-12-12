//
//  UIImage+Utilities.m
//  WoxTeacher
//
//  Created by 梁永升 on 2018/2/5.
//  Copyright © 2018年 梁永升. All rights reserved.
//

#import "UIImage+DYUtilities.h"

@implementation UIImage (DYUtilities)

+ (UIImage *)imageFromColors:(NSArray *)colors
                   withFrame:(CGRect)frame
        andColorGradientType:(FHColorGradientType)type {
    
    NSMutableArray *ar = [NSMutableArray array];
    for (UIColor *c in colors) {
        [ar addObject:(id) c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) ar, NULL);
    CGPoint start;CGPoint end;
    switch (type) {
        case FHGradientTypeLiftToRight:{
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(frame.size.width, 0.0);
            break;
        }
        case FHGradientTypeTopToDown:{
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, frame.size.height);
            break;
        }
        case FHGradientTypeDiagonal:{
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(frame.size.width, frame.size.height);
            break;
        }
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    //    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
