//
//  HomeViewController.m
//  testqf
//
//  Created by qiaofang on 2021/9/1.
//
#import "HomeViewController.h"
#import "HeadLine.h"
#import "HeadLineCell.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSArray *headlines;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,assign)NSInteger currentIndex;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation HomeViewController
-(void)setHeadlines:(NSArray *)headlines{
    _headlines = headlines;
    [self.collectionView reloadData];
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:0 animated:NO];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self setNavBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBar];
    [self setUpNavigation];
    [self setupUI];
    [HeadLine headlinesWithSuccess:^(NSArray * _Nonnull array) {
        self.headlines = array;
    } error:^{
        
    }];
    
    // Do any additional setup after loading the view.
}

-(void)setupUI{
    //添加内容到视图上
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.collectionView;
//    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[HeadLineCell class] forCellWithReuseIdentifier:@"cell"];
}

-(UITableView *)tableView
{
    if(!_tableView){
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    }
    
    return _tableView;
}

-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kScreenW,200);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
//        _collectionVie;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 250) collectionViewLayout:layout];
//        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor cyanColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        
    }
    return _collectionView;
}

-(void)setNavBar{
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor  = [UIColor whiteColor];
}

-(void)setTabBar{
    self.title = @"我的";
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor orangeColor],NSFontAttributeName:[UIFont fontWithName:@"ArialMT" size:14.0]}            forState:UIControlStateNormal];
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabBar_profile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"tabBar_profile_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

-(void)setUpNavigation{
    UIImage *rightBtnImg = [UIImage imageNamed:@"btn_set_white"];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightBtnImg style:UIBarButtonItemStylePlain target:self action:@selector(clickNav:)];
    rightButton.tag = 1;
    [self.navigationItem setRightBarButtonItem:rightButton];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shouye_erweima"] style:UIBarButtonItemStylePlain target:self action:@selector(clickNav:)]];
}

-(void)clickNav:(UIBarButtonItem *)item {
    NSLog(@"--item---->%ld",(long)item.tag);
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.headlines.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headline" forIndexPath:indexPath];
    //    UICollectionViewCell *cell = []
    HeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //    cell.headline = nil;
    //    cell.tag = indexPath.row;
    //    cell.headline = self.headlines[indexPath.item];
    //    cell.backgroundColor = [UIColor greenColor];
    NSInteger index = (self.currentIndex +indexPath.item - 1 +self.headlines.count) % self.headlines.count;
    cell.tag = index;
    cell.headline = self.headlines[index];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int offset = scrollView.contentOffset.x / scrollView.bounds.size.width -1;
    self.currentIndex = (self.currentIndex + offset + self.headlines.count) % self.headlines.count;
   
    dispatch_async(dispatch_get_main_queue(), ^{
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:1 inSection:0];
        NSLog(@"---indexpath-->%@",indexpath);
        [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:0 animated:NO];

    });
}

@end
