//
//  HeadLine.h
//  testqf
//
//  Created by qiaofang on 2021/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadLine : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imgsrc;

+(instancetype)headlineWithDic:(NSDictionary *)dic;
+(void)headlinesWithSuccess:(void(^)(NSArray *array))success error:(void(^)(void))error;
@end

NS_ASSUME_NONNULL_END
