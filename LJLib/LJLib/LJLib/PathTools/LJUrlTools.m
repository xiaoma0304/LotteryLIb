//
//  LJLocalUrlTools.m
//  rrslj
//
//  Created by MGN on 2018/1/11.
//  Copyright © 2018年 RRSLJ. All rights reserved.
//

#import "LJUrlTools.h"

@implementation LJUrlTools

+ (NSString *)localLibraryUrlPath:(NSString *)subPath {
    return [NSString stringWithFormat:@"%@/%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Library/"],subPath];
}

+ (NSString *)localBoundleUrlPath:(NSString *)fileName type:(NSString *)type {
    return [[NSBundle mainBundle]pathForResource:fileName ofType:type];
}

@end
