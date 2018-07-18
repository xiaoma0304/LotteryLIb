//
//  StringHelper.h
//  yifuzhen_doctor_iphone
//
//  Created by 赵洋 on 16/6/24.
//  Copyright © 2016年 赵洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringHelper : NSObject

+(BOOL) isNotBlankString:(id)string;
+(NSString *)getNotNullString:(id)string;
+(NSString *)getJsonString:(id)obj;

//+ (CGSize)boundingRectWithSize:(CGSize)size withText:(NSString *)text fontSize:(UIFont *)font;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSUInteger)unicodeLengthOfString:(NSString *)text;

+ (NSMutableDictionary *)getDicFromUrlString:(NSString *)strMeapUrl;

@end
