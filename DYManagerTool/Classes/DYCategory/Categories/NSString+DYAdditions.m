//
//  NSString+Additions.m
//  iFramework
//
//  Created by JiangHaoyuan on 13-10-8.
//  Copyright (c) 2013年 JiangHaoyuan. All rights reserved.
//

#import "NSString+DYAdditions.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"
#import <CommonCrypto/CommonCryptor.h>

#define Interval @"Interval"  //距离当前时间的时间间隔
#define TimeStamp @"TimeStamp" //时间戳
#define DYFontName(Fsize)    ([[[UIDevice currentDevice] systemVersion] floatValue] <= 9.0)?([UIFont systemFontOfSize:Fsize]):([UIFont fontWithName:@"PingFangSC-Regular" size:Fsize])
@implementation NSString(DYAdditions)


+(NSString *)safeString:(NSString *)unSafeStr
{
    unSafeStr = [NSString stringWithFormat:@"%@",unSafeStr];
    if([unSafeStr isKindOfClass:[NSNull class]]){
        unSafeStr = @"";
    }else if ([unSafeStr isEqualToString:@"null"]){
        unSafeStr = @"";
    }
    else if ([unSafeStr isEqualToString:@"(null)"]){
        unSafeStr = @"";
    }
    else if ([unSafeStr isEqualToString:@"<null>"]){
        unSafeStr = @"";
    }
    else if (unSafeStr == nil){
        unSafeStr = @"";
    }else if (!unSafeStr.length){
        unSafeStr = @"";
    }
    return unSafeStr;
}

+(NSString *)safeStringBeNil:(NSString *)unSafeStr
{
    unSafeStr = [NSString stringWithFormat:@"%@",unSafeStr];
    if([unSafeStr isKindOfClass:[NSNull class]]){
        unSafeStr = nil;
    }else if ([unSafeStr isEqualToString:@"null"]){
        unSafeStr = nil;
    }
    else if ([unSafeStr isEqualToString:@"(null)"]){
        unSafeStr = nil;
    }else if ([unSafeStr isEqualToString:@"<null>"]){
        unSafeStr = nil;
    }
    else if (!unSafeStr.length){
        unSafeStr = nil;
    }
    return unSafeStr;
}


- (NSString *)trim{
    NSMutableString *mStr = [self mutableCopy];
    CFStringTrimWhitespace((CFMutableStringRef)mStr);
    NSString *result = [mStr copy];
    return result;
}


//动态获取高度
+(CGRect)getFramByString:(NSString *)string andattributes:(NSDictionary *)attributes
{
    CGRect rect;
    CGSize retSize;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        if(attributes)
        {
            NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]initWithDictionary:attributes];
            if(![tempDict objectForKey:NSParagraphStyleAttributeName])
            {
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
                paragraphStyle.lineSpacing=0;
                [tempDict setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
            }
            rect=[string boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:tempDict context:nil];
        }
        else
        {
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            paragraphStyle.lineSpacing=0;
            rect=[string boundingRectWithSize:CGSizeMake(200, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:DYFontName(17)} context:nil];
        }
        if(![string isEqualToString:@""])
        {
            return rect;
        }
        else
        {
            return CGRectMake(0, 0, rect.size.width, 0);
        }
        
    }
    else
    {
        if(attributes)
        {
            NSMutableParagraphStyle *paragraphStyle= [attributes objectForKey:NSParagraphStyleAttributeName];
            if(!paragraphStyle)
            {
                paragraphStyle=[[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            }
            retSize = [string sizeWithFont:[attributes objectForKey:NSFontAttributeName] constrainedToSize:CGSizeMake(200, 1000) lineBreakMode:paragraphStyle.lineBreakMode];
        }
        else
        {
            retSize = [string sizeWithFont:DYFontName(17) constrainedToSize:CGSizeMake(200, 1000) lineBreakMode:NSLineBreakByCharWrapping];
            
        }
        if(![string isEqualToString:@""])
        {
            return CGRectMake(0, 0, retSize.width, retSize.height);
        }
        else
        {
            return CGRectMake(0, 0, 0, 0);
        }
    }
}


+(CGRect)getFramByString:(NSString *)string andattributes:(NSDictionary *)attributes andCGSizeWidth:(CGFloat)width
{
    CGRect rect;
    CGSize retSize;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        if(attributes)
        {
            NSMutableDictionary *tempDict=[[NSMutableDictionary alloc]initWithDictionary:attributes];
            if(![tempDict objectForKey:NSParagraphStyleAttributeName])
            {
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
                paragraphStyle.lineSpacing=2;
                [tempDict setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
            }
            rect=[string boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:tempDict context:nil];
        }
        else
        {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            paragraphStyle.lineSpacing=2;
            rect=[string boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:DYFontName(17)} context:nil];
        }
        if(![string isEqualToString:@""])
        {
            return rect;
        }
        else
        {
            return CGRectMake(0, 0, rect.size.width+0.1, 0);
        }
        
    }
    else
    {
        if(attributes)
        {
            NSMutableParagraphStyle *paragraphStyle= [attributes objectForKey:NSParagraphStyleAttributeName];
            if(!paragraphStyle)
            {
                paragraphStyle=[[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode=NSLineBreakByCharWrapping;
            }
            retSize = [string sizeWithFont:[attributes objectForKey:NSFontAttributeName] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:paragraphStyle.lineBreakMode];
        }
        else
        {
            retSize = [string sizeWithFont:DYFontName(17) constrainedToSize:CGSizeMake(width, 1000) lineBreakMode:NSLineBreakByCharWrapping];
            
        }
        if(![string isEqualToString:@""])
        {
            return CGRectMake(0, 0, retSize.width+0.1, retSize.height+0.1);
        }
        else
        {
            return CGRectMake(0, 0, 0, 0);
        }
    }
}

+(NSString *)unitConversion:(NSInteger)num
{
    NSString *totalStr;
    if(num <=0)
    {
        totalStr=[NSString stringWithFormat:@"0"];
    }
    else if(num>=1000 && num <=9999)
    {
        
        totalStr=[NSString stringWithFormat:@"%.1fk",(num/1000.0)];
    }
    else if(num>=10000)
    {
        totalStr=[NSString stringWithFormat:@"%.1fw",(num/10000.0)];
    }
    else
    {
        totalStr=[NSString stringWithFormat:@"%d",(int)num];
    }
    return totalStr;
}



@end
