//
//  NewsDetail.h
//  testqf
//
//  Created by qiaofang on 2021/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetail : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *source;

@property (nonatomic,copy) NSString *ptime;

@property (nonatomic,copy) NSString *body;

@end

NS_ASSUME_NONNULL_END
