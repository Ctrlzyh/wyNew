//
//  HeadLine.m
//  testqf
//
//  Created by qiaofang on 2021/9/2.
//

#import "HeadLine.h"
#import "NetworkTools.h"
@implementation HeadLine
+(instancetype)headlineWithDic:(NSDictionary *)dic{
    HeadLine *headline = [self new];
    [headline setValuesForKeysWithDictionary:dic];
    return headline;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+(void)headlinesWithSuccess:(void(^)(NSArray *array))success error:(void(^)(void))error{
    [[NetworkTools sharedManager] GET:@"ad/headline/0-4.html" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
            NSLog(@"%@",responseObject);
            NSString *rootKey = responseObject.keyEnumerator.nextObject;
            NSArray *array = responseObject[rootKey];
            
            NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:4];
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            HeadLine *headline = [self headlineWithDic:obj];
                            [mArray addObject:headline];
            }];
            if(success){
                success(mArray.copy);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
            if(error){
                error();
            }
        }];
}
@end
