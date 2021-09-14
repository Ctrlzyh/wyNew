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
#import "NewsCellTableViewCell.h"
#import "ViewController.h"

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

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barTintColor =  ssRGBHex(0xc63520);
    self.navigationController.navigationBar.tintColor  = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self initData];
    [self setupRefresh];
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

- (void)setupRefresh {
    NSLog(@"setupRefresh -- 下拉刷新");
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshClick:) forControlEvents:UIControlEventValueChanged];
    refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新"];
    //刷新图形时的颜色，即刷新的时候那个菊花的颜色
    refreshControl.tintColor = [UIColor redColor];
    [self.tableView addSubview:refreshControl];
    [refreshControl beginRefreshing];
    [self refreshClick:refreshControl];
}

- (void)refreshClick:(UIRefreshControl *)refreshControl {
    NSLog(@"refreshClick: -- 刷新触发");
    //    。。。// 此处添加刷新tableView数据的代码
    //    查询数据库
//    self.dbCtrl=[[FMVC1 alloc]init];
//    self.datasource=[self.dbCtrl select_data];
    [self initData];
    [refreshControl endRefreshing];
    [self.tableView reloadData];// 刷新tableView即可
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
     NSString *CellIdentifier = [NSString stringWithFormat:@"news"];
    NewsCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil] lastObject];
     };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.news = self.newsList[indexPath.row];
     return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    News *newRow = self.newsList[indexPath.row];
    NSString *docid = newRow.docid;
    NSLog(@"---->%@",docid);
    
    
    ViewController *vc = [[ViewController alloc] init];
    vc.docid = docid;
    [vc.view setBackgroundColor:[UIColor whiteColor]];
//    vc.navigationController.navigationBar.barTintColor =  ssRGBHex(0xc63520);
    vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    [vc setTitle:@"新闻详情"];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] init];
    back.title = @"返回";
    self.navigationItem.backBarButtonItem = back;
//    NSString *docid = self.newsList[indexPath.row];
 
    [self.navigationController pushViewController:vc animated:YES];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
@end
