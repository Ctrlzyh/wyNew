//
//  NetworkTools.h
//  testqf
//
//  Created by qiaofang on 2021/9/2.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkTools : AFHTTPSessionManager
+(instancetype)sharedManager;
@end

NS_ASSUME_NONNULL_END
