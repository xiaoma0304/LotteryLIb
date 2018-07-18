//
//  LJIntroduce.m
//  Pods
//
//  Created by MGN on 2018/6/19.
//

#import "LJIntroduce.h"

@interface LJIntroduce() <UIScrollViewDelegate>
/** 主滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 翻页标志 */
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation LJIntroduce
#pragma mark - 系统覆盖
- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self addViews];
    }
    return self;
}

#pragma mark - 自定义方法
/** 添加控件 */
- (void)addViews {
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = scrollView.frame.size.width;
    float offset = scrollView.contentOffset.x;
    int p = (offset + width/2) / width;
    self.pageControl.currentPage = p;

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = scrollView.frame.size.width;
    float offset = scrollView.contentOffset.x;
//    page = (offset + width/2) / width;
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 4;
    }
    return _pageControl;

}

@end
