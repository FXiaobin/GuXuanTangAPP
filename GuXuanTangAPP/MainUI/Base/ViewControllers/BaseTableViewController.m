//
//  BaseTableViewController.m
//  WYShareAndLive
//
//  Created by fanxiaobin on 2017/10/12.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "BaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "UIScrollView+IOS11.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface BaseTableViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic,assign) UITableViewStyle tableViewStyle;

@end

@implementation BaseTableViewController

-(instancetype)init{
    if (self = [super init]) {
        self.tableViewStyle = UITableViewStyleGrouped;
    }
    return self;
}

-(instancetype)initWithTableViewStyle:(UITableViewStyle)style{
    if (self = [super init]) {
        self.tableViewStyle = style;
        if ((style != UITableViewStylePlain) && (style != UITableViewStyleGrouped)) {
            self.tableViewStyle = UITableViewStylePlain;
        }
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    self.isRefreshing = YES;
    self.currentPage = 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    self.currentPage = 1;
    [self tableView];
    
}

-(NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)queryData{
    //子类重写此方法
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    });
    
}

- (void)endRefresh{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
 
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarHeight - kSafeAreaBottomHeight) style:self.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [_tableView configIOS11];

        [self.view addSubview:_tableView];
        
      
        __weak typeof(self) weakSelf = self;
        //头刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakSelf.isRefreshing = YES;
            weakSelf.currentPage = 1;
            [weakSelf queryData];
        }];
        header.lastUpdatedTimeLabel.hidden = YES;
        _tableView.mj_header = header;
        
       
        //3. 尾刷新
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weakSelf.isRefreshing = NO;
            weakSelf.currentPage++;
            [weakSelf queryData];
        }];
        
        _tableView.mj_footer = footer;
    }
    
    return _tableView;
}

-(void)setIsHiddenRefreshControl:(BOOL)isHiddenRefreshControl{
    if (isHiddenRefreshControl) {
        self.tableView.mj_header = nil;
        self.tableView.mj_footer = nil;
    }
}

-(void)setHiddenLoadMoreRefreshControl:(BOOL)hiddenLoadMoreRefreshControl{
    if (hiddenLoadMoreRefreshControl) {
        self.tableView.mj_footer = nil;
    }
}

- (void)setTopMargin:(CGFloat)topMargin{
    _topMargin = topMargin;
    self.tableView.frame = CGRectMake(0, topMargin, kScreenWidth, kScreenHeight - kNavigationBarHeight - topMargin - kSafeAreaBottomHeight);
}

-(void)setBottomMargin:(CGFloat)bottomMargin{
    _bottomMargin = bottomMargin;
    self.tableView.frame = CGRectMake(0, self.topMargin, kScreenWidth, kScreenHeight - kNavigationBarHeight - self.topMargin - bottomMargin  - kSafeAreaBottomHeight);
}

#pragma mark --- 子类重写 UITableViewDelegate , UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

///去掉ios11出现的头尾留白现象
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"BaseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- 无数据提示
//提示图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        return [UIImage imageNamed:@"empty_net"];
    }
    return [UIImage imageNamed:@"empty_page"];
}
//提示标题
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"暂无数据内容";
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        text = @"暂无网络连接";
    }
    NSDictionary *attributes = @{NSFontAttributeName: kFont(kSCALE(32.0)),
                                 NSForegroundColorAttributeName: kTitleColor};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return -kNavigationBarHeight/2.0;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView{
    return kSCALE(40.0);
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
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
