//
//  UIView+ViewController.m
//  WeiBo_TYH
//
//  Created by IOS on 14-7-4.
//  Copyright (c) 2014年 www.iphonetrain.com. All rights reserved.
//

#import "UIView+DYViewController.h"

@implementation UIView (DYViewController)

- (UIViewController *)viewController
{
    
    id next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    if(next == nil){
        next = [[UIApplication sharedApplication] delegate].window.rootViewController;
        if([next isKindOfClass:[UINavigationController class]]){
            next = ((UINavigationController *)next).topViewController;
        }
        return next;
    }
    return nil;
}

@end
