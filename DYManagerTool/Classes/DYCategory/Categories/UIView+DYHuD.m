//
//  UIView+HuD.m
//  WoxTeacher
//
//  Created by 梁永升 on 2018/2/5.
//  Copyright © 2018年 梁永升. All rights reserved.
//

#import "UIView+DYHuD.h"
#import "MBProgressHUD.h"
@implementation UIView (HuD)
- (void)showLoading {
    [self hideHUD];
    
    [self showLoadingWithMsg:nil];
}

- (void)showLoadingWithMsg:(NSString *)msg {
    [self hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.label.text = msg;
    hud.label.numberOfLines = 0;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:17 / 255. alpha:.7];
    hud.contentColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = YES;
    
//    hud.offset = CGPointMake(0, -100);
}

- (void)showMessage:(NSString *)message {
    [self hideHUD];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.offset = CGPointMake(0, -20);
    hud.label.text = message;
    hud.label.numberOfLines = 0;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:17 / 255. alpha:.7];
    hud.contentColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    
    [hud hideAnimated:YES afterDelay:1];
}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

@end
