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
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
@end
@implementation NewsCellTableViewCell

-(void)setNews:(News *)news{
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    self.titleView.text = news.title;
    self.digestView.text = news.digest;
    self.replyCount.text = [NSString stringWithFormat:@"%d人回帖",news.replyCount.intValue];
}


@end
