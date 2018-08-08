//
//  Common_ViewController.m
//  ReactNativeDemo
//
//  Created by gjfax on 2018/7/31.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "Common_ViewController.h"


@interface Common_ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation Common_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"其他UI效果";
    [self.view addSubview:self.tableView];
}
#pragma mark -  数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.subtitleArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*cell重用 */
    static NSString *cellIndentifier = @"LoginAndRegistContractVCCell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.textLabel.text = self.subtitleArray[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    /*cell设置 */
    cell.selectionStyle = UITableViewCellSelectionStyleGray;            // 点击阴影效果
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;   // 右侧小箭头显示
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark -  点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选中阴影消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //跳转到Demo_ViewController
    NSString *className = self.vcNameArray[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _subtitleArray[indexPath.row];
        ctrl.view.backgroundColor = [UIColor lightGrayColor];
        [self.navigationController pushViewController:ctrl animated:YES];
    };
}

#pragma mark - tableView懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleGray;   // 灰色分割线
        _tableView.separatorColor = [UIColor lightGrayColor];             // 分割线的颜色
        
    }
    
    return _tableView;
}
@end
