//
//  NSString+Utilities.m
//  DyStudent
//
//  Created by 梁永升 on 2018/9/29.
//  Copyright © 2018年 梁永升. All rights reserved.
//

#import "NSString+DYUtilities.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (DYUtilities)
- (NSString *)md5Hash {
    const char *str = [self UTF8String];
    if (str == NULL) {
        str = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    
    return filename;
}
@end
