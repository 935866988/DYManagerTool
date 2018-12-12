//
//  UILabel+LineAndWordSpace.h
//  DyStudent
//
//  Created by 梁永升 on 2018/8/29.
//  Copyright © 2018年 梁永升. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (DYLineWordSpace)

/**
 *  改变行间距
 */
- (NSMutableAttributedString *)changeLineSpace:(float)space;

/**
 *  改变字间距
 */
- (NSMutableAttributedString *)changeWordSpace:(float)space;

/**
 *  改变行间距和字间距
 */
- (NSMutableAttributedString *)changeLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
