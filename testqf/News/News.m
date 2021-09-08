//
//  News.m
//  testqf
//
//  Created by qiaofang on 2021/9/8.
//

#import "News.h"
#import "NetworkTools.h"
@implementation News

+(instancetype)newWithDic:(NSDictionary *)dic{
    News *news = [self new];
    [news setValuesForKeysWithDictionary:dic];
    return news;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+(void)newsListWithSuccessBlock:(void(^)(NSArray *array))successBlock errorBlock:(void(^)(NSError *error))errorBlock{
    [[NetworkTools sharedManager] GET:@"article/headline/T1348647853363/0-40.html" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *array = responseObject[rootKey];
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    News *news = [self newWithDic:obj];
                    [mArray addObject:news];
        }];
        if(successBlock){
            successBlock(mArray.copy);
        }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(errorBlock){
                errorBlock(error);
            }
        }];
}
@end
