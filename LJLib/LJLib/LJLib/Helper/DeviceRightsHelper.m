//
//  DeviceRightsHelper.m
//  XiaoGuanJia
//
//  Created by MGN on 2017/8/1.
//  Copyright © 2017年 Tony. All rights reserved.
//

#import "DeviceRightsHelper.h"
#import <AVFoundation/AVFoundation.h>

@implementation DeviceRightsHelper
+ (BOOL)hasRightToRecord
{
    __block BOOL bCanRecord = YES;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
    {
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
            [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
                bCanRecord = granted;
            }];
        }
    }
    return bCanRecord;
}
@end
