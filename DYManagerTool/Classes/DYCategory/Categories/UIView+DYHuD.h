//
//  UIView+HuD.h
//  WoxTeacher
//
//  Created by 梁永升 on 2018/2/5.
//  Copyright © 2018年 梁永升. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DYHuD)
/**
 转圈
 */
- (void)showLoading;

/**
 带文本的转圈
 
 @param msg 显示的文本
 */
- (void)showLoadingWithMsg:(NSString *)msg;

/**
 只显示文本
 
 @param message 内容
 */
- (void)showMessage:(NSString *)message;

/**
 隐藏 showLoading 和 showLoadingWithMsg，不能隐藏别的
 */
- (void)hideHUD;
@end
