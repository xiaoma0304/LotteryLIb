//
//  FilePathHelper.m
//  XiaoGuanJia
//
//  Created by ayang on 2018/1/29.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "FilePathHelper.h"

@implementation FilePathHelper

+ (NSString *)configFilePath:(NSString *)fileName{
    NSString *p = [NSString stringWithFormat:@"Library/H5/config/%@",fileName];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:p];
    return path;
}

@end
