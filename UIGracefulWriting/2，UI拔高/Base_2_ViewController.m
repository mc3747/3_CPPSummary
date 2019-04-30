//
//  Base_2_ViewController.m
//  UIGracefulWriting
//
//  Created by gjfax on 2019/3/13.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "Base_2_ViewController.h"

@interface Base_2_ViewController ()

@end

@implementation Base_2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UI高阶";
    
    self.vcNameArray = @[
  @[@"",@"NavigationSummaryVC",@"",@"",@"",@"PackageTableViewVC",@"PackageCollectionViewVC",@"",@"CommonToastVC",@"CommonLoadingVC",@"",@"",@"CommonCoverVC"],
  @[@"",@"",@"",@""],
  @[@"QQCornerViewController",@"EffectiveCornerVC"],
  @[@"",@"",@"",@"NotEquelCellHeightVC"],
  @[@"",@""]
  ];
    
    self.subtitleArray =
@[
@[@"通用TabBarController",@"通用NavigationController",@"通用UIViewController",@"通用UITableViewController",@"通用UICollectionViewController",@"封装的tableView",@"封装的collectionView",@"通用弹框",@"通用toast框",@"通用loading框",@"通用无数据页面",@"通用刷新控件",@"通用遮罩"],

@[@"工具类",@"分类",@"常用颜色",@"常用字体"],

@[@"高效处理圆角",@"高性能处理圆角"],

@[@"文本展示",@"label和tableViewCell不等高",@"TableView封装数据源",@"TableViewCell不等高的5种写法"],

@[@"UI封装",@"UI的优雅写法"],

@[@"MVC",@"MVVM"],
  ];
    
    self.sectionTitleArray = @[@"通用控件",@"常用资源",@"UI性能优化",@"常见难点",@"UI规范",@"架构"];
}




@end
