//
//  DateHelper.m
//  XiaoGuanJia
//
//  Created by ayang on 2018/1/17.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper
+ (NSString *)h5UpdateKey{
    NSDate *date = [NSDate date];//简书 FlyElephant
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *day = [formatter stringFromDate:date];
    NSString *key = [NSString stringWithFormat:@"upDateZip_%@",day];
    return key;
}
@end
