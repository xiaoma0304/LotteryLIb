//
//  LJLocalUrlTools.h
//  rrslj
//
//  Created by MGN on 2018/1/11.
//  Copyright © 2018年 RRSLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJUrlTools : NSObject

/**
 获取library 中 H5 包中的全路径

 @param subPath html 非全路径
 @return 全路径
 */
+ (NSString *)localLibraryUrlPath:(NSString *)subPath;

/**
 获取打包在工程中的文件

 @param fileName 文件名字
 @param type 文件类型->后缀
 @return 文件路径
 */
+ (NSString *)localBoundleUrlPath:(NSString *)fileName type:(NSString *)type;

@end
