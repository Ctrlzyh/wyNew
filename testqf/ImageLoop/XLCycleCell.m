
#import "XLCycleCell.h"
#import "HeadLine.h"
#import "Masonry.h"
#import <UIImageView+AFNetworking.h>

@interface XLCycleCell ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic,strong)UIImageView *imgsrcView;

@end

@implementation XLCycleCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    _imgsrcView = [[UIImageView alloc] init];
    //    _imgsrcView
    [self.contentView addSubview:_imgsrcView];
    [_imgsrcView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    self.textLabel = [[UILabel alloc] init];
//    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:14];
    self.textLabel.backgroundColor= [UIColor whiteColor];
    [self addSubview:self.textLabel];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imgsrcView.mas_left).offset(10);
        make.top.equalTo(_imgsrcView.mas_bottom).offset(-25);
    }];
    
}

//- (void)setTitle:(HeadLine *)HeadLine {
////    self.textLabel.text = title;
//}
-(void)setHeadline:(HeadLine *)headline{
    _headline = headline;
    self.imgsrcView.image = nil;
    self.textLabel.text = nil;
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:headline.imgsrc]];
    self.textLabel.text = headline.title;
//    self.pageControl.currentPage = self.tag;
}

@end
