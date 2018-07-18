//
//  UIControl+Block.m
//  类别和block
//
//  Created by heng on 14/7/9.
//  Copyright (c) 2014年 ChinaAuto. All rights reserved.
//

#import "UIControl+Block.h"
#import <objc/runtime.h>
static char BLOCK;
static char COLOR_BOOL;
static char IS_Selected;
static char DIS_Selectec;

static char Segment_Block;

@implementation UIControl (Block)
- (void)buttonBlock:(void(^)(UIButton * button))myBlock
{
    self.exclusiveTouch = YES;
    objc_setAssociatedObject(self, &BLOCK, myBlock, OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonPress:(UIButton*)button
{
    changeColor (button);
    void (^block) (UIButton *bb) = objc_getAssociatedObject(self, &BLOCK);
    if(block){
        block(button);
    }
}
void changeColor (UIButton * button)
{
    if([objc_getAssociatedObject(button, &COLOR_BOOL) boolValue]){
        objc_setAssociatedObject(button, &COLOR_BOOL, [NSNumber numberWithBool:NO], OBJC_ASSOCIATION_RETAIN);
        void (^block) (UIButton *buton) = objc_getAssociatedObject(button, &DIS_Selectec);
        if(block){
            block((UIButton*)button);
        }
    }else{
        objc_setAssociatedObject(button, &COLOR_BOOL, [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_RETAIN);
        void (^block) (UIButton *buton) = objc_getAssociatedObject(button, &IS_Selected);
        if(block){
            block((UIButton*)button);
        }
    }
}
- (void)isSelected:(void(^)(UIButton * button))selectedBlock
{
    objc_setAssociatedObject(self, &IS_Selected, selectedBlock, OBJC_ASSOCIATION_RETAIN);
}
- (void)disSelected:(void(^)(UIButton * button))disSelectedBlock
{
    objc_setAssociatedObject(self, &DIS_Selectec, disSelectedBlock, OBJC_ASSOCIATION_RETAIN);
}
- (void)setNum:(int)num forState:(UIControlState)state
{
    [(UIButton*)self setTitle:[NSString stringWithFormat:@"%d",num] forState:UIControlStateNormal];
}



- (void)segmentBlock:(void (^) (UISegmentedControl * segment))segmentBlock
{
    objc_setAssociatedObject(self, &Segment_Block, segmentBlock, OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
}
- (void)segmentClick:(UISegmentedControl*)segment
{
    void (^block) (UISegmentedControl *s) = objc_getAssociatedObject(self, &Segment_Block);
    if(block){
        block(segment);
    }
}






@end



