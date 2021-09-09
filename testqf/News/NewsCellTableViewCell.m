//
//  NewsCellTableViewCell.m
//  testqf
//
//  Created by qiaofang on 2021/9/8.
//

#import "NewsCellTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import "News.h"
@interface NewsCellTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *digestView;
@property (weak, nonatomic) IBOutlet UIImageView *defaultImg;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
//@property (nonatomic, strong) UIImageView *defaultImg;
@end
@implementation NewsCellTableViewCell

-(void)setNews:(News *)news{
//    self.defaultImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaultpic"]];
    [self.defaultImg setImage:[UIImage imageNamed:@"defaultpic"]];
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    self.titleView.text = news.title;
    self.digestView.text = news.digest;
    self.replyCount.text = [NSString stringWithFormat:@"%d人回帖",news.replyCount.intValue];
}

@end
