#import <UIKit/UIKit.h>

@interface XLCycleCollectionView : UIView

@property (nonatomic, strong) NSArray<NSString *> *data;

/**
 自动翻页 默认 NO
 */
@property (nonatomic, assign) BOOL autoPage;

@end
