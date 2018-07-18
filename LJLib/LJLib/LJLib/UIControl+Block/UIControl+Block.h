//
//  UIControl+Block.h
//  类别和block
//
//  Created by heng on 14/7/9.
//  Copyright (c) 2014年 ChinaAuto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Block) <UITextFieldDelegate>
- (void)buttonBlock:(void(^)(UIButton * button))myBlock;
- (void)setNum:(int)num forState:(UIControlState)state;

- (void)isSelected:(void(^)(UIButton * button))selectedBlock;
- (void)disSelected:(void(^)(UIButton * button))disSelectedBlock;
- (void)segmentBlock:(void (^) (UISegmentedControl * segment))segmentBlock;

@end

