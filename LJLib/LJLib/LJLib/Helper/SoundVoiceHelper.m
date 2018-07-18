//
//  SoundVoiceHelper.m
//  XiaoGuanJia
//
//  Created by 赵洋 on 2018/5/17.
//  Copyright © 2018年 Tony. All rights reserved.
//

#import "SoundVoiceHelper.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation SoundVoiceHelper
+(void)playScaSuceesSound{
    
    //注册系统id
    
    //不超过三十秒的短音频
    
    SystemSoundID ID;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"di" withExtension:@"wav"];
    
    //创建系统音频
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &ID);
    
    //播放 系统声音id从1000开始
    
    AudioServicesPlaySystemSound(ID);
    
//    //振动vibrate
//
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    
}

@end
