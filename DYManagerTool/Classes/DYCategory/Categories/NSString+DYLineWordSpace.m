//
//  UILabel+LineAndWordSpace.m
//  DyStudent
//
//  Created by 梁永升 on 2018/8/29.
//  Copyright © 2018年 梁永升. All rights reserved.
//

#import "NSString+DYLineWordSpace.h"

@implementation NSString (DYLineWordSpace)

- (NSMutableAttributedString *)changeLineSpace:(float)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}

- (NSMutableAttributedString *)changeWordSpace:(float)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}

- (NSMutableAttributedString *)changeLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    return attributedString;
}

@end
