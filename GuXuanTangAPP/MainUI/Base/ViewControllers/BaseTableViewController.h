//
//  BaseTableViewController.h
//  WYShareAndLive
//
//  Created by fanxiaobin on 2017/10/12.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

/*
 注意 ： 本类默认是UITableViewStyleGrouped风格的tableView，因为UITableViewStyleGrouped风格的会有一个默认高度（44.0）的头和尾， 所以要注意头尾视图的高度，重新设置一下
 */

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,assign) NSInteger currentPage;

@property (nonatomic,assign) BOOL isRefreshing;

///顶部的偏移量 - 需要减去的高度 - 默认高度是：（SCREEN_HEIGHT - 64.0）
@property (nonatomic,assign) CGFloat topMargin;

@property (nonatomic,assign) CGFloat bottomMargin;
///是否隐藏刷新控件
@property (nonatomic,assign) BOOL isHiddenRefreshControl;
///只隐藏加载更多
@property  (nonatomic) BOOL hiddenLoadMoreRefreshControl;

-(instancetype)initWithTableViewStyle:(UITableViewStyle)style;

- (void)endRefresh;

@end
