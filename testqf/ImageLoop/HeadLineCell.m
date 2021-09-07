//
//  HeadLineCell.m
//  testqf
//
//  Created by qiaofang on 2021/9/2.
//
#import "HeadLineCell.h"
#import "HeadLine.h"
#import <UIImageView+AFNetworking.h>
#import "Masonry.h"
@interface HeadLineCell ()
@property (nonatomic,strong)UIImageView *imgsrcView;
@property (nonatomic,strong)UILabel *titleView;
@property (nonatomic,strong)UIPageControl *pageControl;
@end
@implementation HeadLineCell
-(void)setHeadline:(HeadLine *)headline{
    _headline = headline;
    self.imgsrcView.image = nil;
    self.titleView.text = nil;
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:headline.imgsrc]];
    self.titleView.text = headline.title;
    self.pageControl.currentPage = self.tag;
}
-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self initView];
    }
    return self;
}
-(void) initView{
    _imgsrcView = [[UIImageView alloc] init];
    //    _imgsrcView
    [self.contentView addSubview:_imgsrcView];
    [_imgsrcView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    _titleView = [[UILabel alloc] init];
    [self.contentView addSubview:_titleView];
    _titleView.font = [UIFont systemFontOfSize:12.0];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imgsrcView.mas_left).offset(10);
        make.top.equalTo(_imgsrcView.mas_bottom).offset(5);
    }];
    
    _pageControl = [[UIPageControl alloc] init];
    [self.contentView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(10);
        make.top.equalTo(self.imgsrcView.mas_bottom).offset(5);
        make.height.equalTo(_titleView);
    }];
    _pageControl.pageIndicatorTintColor=[UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor=[UIColor blackColor];
    _pageControl.numberOfPages = 4;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
