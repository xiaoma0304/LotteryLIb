//
//  StringHelper.m
//  yifuzhen_doctor_iphone
//
//  Created by 赵洋 on 16/6/24.
//  Copyright © 2016年 赵洋. All rights reserved.
//

#import "StringHelper.h"
//#import "CountryCodeHelper.h"
@implementation StringHelper
//判断string是否为空
//判断string是否为空
+(BOOL) isNotBlankString:(id)string {
    
    if (string == nil || string == NULL) {
        
        return NO;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        
        return NO;
    }
    
    if ([string isKindOfClass:[NSString class]]) {
        if ([string isEqualToString:@"<null>"]) {
            return NO;
        }
        if ([string isEqualToString:@"(null)"]) {
            return NO;
        }
        if ([string isEqualToString:@"null"]) {
            return NO;
        }
        if ([string isEqualToString:@"<nil>"]) {
            return NO;
        }
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([string length]==0 ) {
            return NO;
        }
    }
    return YES;
    
}
+(NSString *)getNotNullString:(id)string
{
    if (string == nil || string == NULL) {
        
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        
        return @"";
    }
    
    if ([string isKindOfClass:[NSString class]]) {
        if ([string isEqualToString:@"<null>"]) {
            return @"";
        }
        if ([string isEqualToString:@"(null)"]) {
            return @"";
        }
        if ([string isEqualToString:@"null"]) {
            return @"";
        }
        if ([string isEqualToString:@"<nil>"]) {
            return @"";
        }
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([string length] == 0) {
            return @"";
        }
    }
    return string;
}

+(BOOL)validateString:(NSString *)string;
{
    if(string.length == 0)
        return NO;
    NSString *stringWordRegex = @"^[a-zA-Z0-9 \u4E00-\u9FA5]{2,30}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",stringWordRegex];
    return [passWordPredicate evaluateWithObject:string];
}
+(NSString *)getJsonString:(id)obj
{
    //    NSArray *keys=[dic allKeys];
    //
    //    NSMutableArray * resultArray=[[NSMutableArray alloc]initWithCapacity:keys.count];
    //    for (NSString *key in keys) {
    //        [resultArray addObject:[NSString stringWithFormat:@"{\"Name\":\"@%@\",\"Value\":\"%@\"}",key,dic[key]]];
    //    }
    //    //将数组合并为字符串
    //    NSString *result=[NSString stringWithFormat:@"[%@]",[resultArray componentsJoinedByString:@","]];
    
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    NSString *json =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //    NSLog(@"json data:%@",json);
    json = [json stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    
    json = [json stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    json = [json stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return json;
}

+ (CGSize)boundingRectWithSize:(CGSize)size withText:(NSString *)text fontSize:(UIFont *)font
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize retSize = [text boundingRectWithSize:size
                                             options:
                      NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attribute
                                             context:nil].size;
//    NSRegularExpression *numberRegular = [NSRegularExpression regularExpressionWithPattern:@"[\n]" options:NSRegularExpressionCaseInsensitive error:nil];
//    NSInteger count = [numberRegular numberOfMatchesInString:text options:NSMatchingReportProgress range:NSMakeRange(0, text.length)];
    retSize.height = retSize.height;
    return retSize;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (NSUInteger)unicodeLengthOfString:(NSString *)text{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < text.length; i++) {
        
        
        unichar uc = [text characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    //    NSUInteger unicodeLength = asciiLength / 2;
    
    //    if(asciiLength % 2) {
    //        unicodeLength++;
    //    }
    
    return asciiLength;
}

+ (NSMutableDictionary *)getDicFromUrlString:(NSString *)strMeapUrl{
    [strMeapUrl componentsSeparatedByString:@"&"];
    //获取问号的位置，问号后是参数列表
    NSRange range = [strMeapUrl rangeOfString:@"?"];
    NSLog(@"参数列表开始的位置：%d", (int)range.location);
    //获取参数列表
    NSString *propertys = [strMeapUrl substringFromIndex:(int)(range.location+1)];
    NSLog(@"截取的参数列表：%@", propertys);
    NSArray *subArray = [propertys componentsSeparatedByString:@"&"];
    NSLog(@"把每个参数列表进行拆分，返回为数组：/n%@", subArray);
    //把subArray转换为字典
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:4];
    for(int j = 0 ; j < subArray.count; j++)
    {
        //在通过=拆分键和值
        NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];
        NSLog(@"再把每个参数通过=号进行拆分：/n%@", dicArray);
        //给字典加入元素
        [tempDic setObject:dicArray[1] forKey:dicArray[0]];
    }
    return tempDic;
}

@end
