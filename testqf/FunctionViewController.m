//
//  FunctionViewController.m
//  testqf
//
//  Created by qiaofang on 2021/9/1.
//

#import "FunctionViewController.h"
#import "XLCycleCollectionView.h"
#import "HeadLine.h"
#import "News.h"

@interface FunctionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *headlines;
@property (nonatomic,strong)XLCycleCollectionView *cyleView;
@property (nonatomic,strong)NSArray *newsList;
@end

@implementation FunctionViewController

-(void)setHeadlines:(NSArray *)headlines{
    self.cyleView.data = headlines;
    [self.tableView reloadData];
}

-(void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)initData{
    [HeadLine headlinesWithSuccess:^(NSArray * _Nonnull array) {
        NSLog(@"--1-->%@",array);
        self.headlines = array;
    } error:^{
        NSLog(@"--2-->");
    }];
    [News newsListWithSuccessBlock:^(NSArray * _Nonnull array) {
        self.newsList = array;
        NSLog(@"--3-->%@",array);
    } errorBlock:^(NSError * _Nonnull error) {
        NSLog(@"--4-->%@",error);
    }];
}

-(UITableView *)tableView
{
    if(!_tableView){
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSString *CellIdentifier = [NSString stringWithFormat:@"Cell"];
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
         News *new =  self.newsList[indexPath.row];
         cell.textLabel.text =new.title;
     };
     return cell;
}
@end
