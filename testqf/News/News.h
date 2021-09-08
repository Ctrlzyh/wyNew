//
//  News.h
//  testqf
//
//  Created by qiaofang on 2021/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *digest;
@property (nonatomic,copy) NSString *replyCount;
@property (nonatomic,copy) NSString *imgsrc;

+(instancetype)newWithDic:(NSDictionary *)dic;
+(void)newsListWithSuccessBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock;
@end

NS_ASSUME_NONNULL_END
