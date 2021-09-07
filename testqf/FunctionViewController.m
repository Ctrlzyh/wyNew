//
//  FunctionViewController.m
//  testqf
//
//  Created by qiaofang on 2021/9/1.
//

#import "FunctionViewController.h"
#import "XLCycleCollectionView.h"
#import "HeadLine.h"

@interface FunctionViewController ()
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *headlines;
@property (nonatomic,strong)XLCycleCollectionView *cyleView;
@end

@implementation FunctionViewController

-(void)setHeadlines:(NSArray *)headlines{
    self.cyleView.data = headlines;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self initData];
    // Do any additional setup after loading the view.
}

-(void)createUI{
    self.cyleView = [[XLCycleCollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 200)];
    
//    self.cyleView.data = @[@"Hello",@"world",@"!"];
//    self.cyleView.data = self.headlines;
    self.cyleView.autoPage = YES;
//    [self.view addSubview:cyleView];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.cyleView;
}

-(void)initData{
    [HeadLine headlinesWithSuccess:^(NSArray * _Nonnull array) {
        NSLog(@"--1-->%@",array);
        self.headlines = array;
    } error:^{
        NSLog(@"--2-->");
    }];
}

-(UITableView *)tableView
{
    if(!_tableView){
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    }
    
    return _tableView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
