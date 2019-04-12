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
    self.vcNameArray = @[@[],@[],@[@"QQCornerViewController"],@[]];
    self.subtitleArray =
@[
@[@"通用TabBarController",@"通用NavigationController",@"通用弹框",@"通用loading框",@"通用无数据页面",@"通用刷新控件",@"通用UIViewController",@"通用UITableViewController"],

@[@"工具类",@"分类",@"常用颜色",@"常用字体"],

@[@"高效处理圆角"],

@[@"文本展示",@"label和tableViewCell不等高",@"TableView"]

  ];
    
    self.sectionTitleArray = @[@"通用控件",@"常用资源",@"UI性能优化",@"常见难点"];
}




@end
