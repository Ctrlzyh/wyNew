//
//  NewsCellTableViewCell.h
//  testqf
//
//  Created by qiaofang on 2021/9/8.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class News;

@interface NewsCellTableViewCell : UITableViewCell
@property (nonatomic,strong) News *news;

@end

NS_ASSUME_NONNULL_END
