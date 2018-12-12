//
//  UITabBar+DYTabBarBtn.m
//  DyStudent
//
//  Created by sundaoran on 2018/11/21.
//  Copyright © 2018 梁永升. All rights reserved.
//
#import "UITabBar+DYTabBarBtn.h"
#import <objc/runtime.h>
@implementation UITabBar (DYTabBarBtn)

+ (void)load {
    if (@available(iOS 12.1, *)) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class originalClass = NSClassFromString(@"UITabBarButton");
            SEL originalSelector = @selector(setFrame:);
            SEL swizzledSelector = @selector(xp_setFrame:);
            
            Method originalMethod = class_getInstanceMethod(originalClass, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
            class_replaceMethod(originalClass,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            class_replaceMethod(originalClass,
                                originalSelector,
                                method_getImplementation(swizzledMethod),
                                method_getTypeEncoding(swizzledMethod));
        });
    }
}

- (void)xp_setFrame:(CGRect)frame {
    if (!CGRectIsEmpty(self.frame)) {
        // for iPhone 8/8Plus
        if (CGRectIsEmpty(frame)) {
            return;
        }
        // for iPhone XS/XS Max/XR
        frame.size.height = MAX(frame.size.height, 48.0);
    }
    [self xp_setFrame:frame];
}

@end
