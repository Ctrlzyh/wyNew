//
//  NetworkTools.m
//  testqf
//
//  Created by qiaofang on 2021/9/2.
//

#import "NetworkTools.h"

@implementation NetworkTools
+(instancetype)sharedManager{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"https://c.m.163.com/nc"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 15;
        instance = [[self alloc] initWithBaseURL:baseURL sessionConfiguration:config];
    });
    return instance;
}
@end
