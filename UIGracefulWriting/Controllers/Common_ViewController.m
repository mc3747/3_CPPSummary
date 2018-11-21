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
@property (nonatomic, assign) BOOL isSelfDefined;
@end

@implementation Common_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
#pragma mark -  数据源
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView= [UIView new];
    footView.backgroundColor = LBRandomColor;
    return footView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.subtitleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray *)self.subtitleArray[section]).count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*cell重用 */
    static NSString *cellIndentifier = @"LoginAndRegistContractVCCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    NSInteger sequenceNumber = [self getSequenceNumber:self.subtitleArray indexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld,%@",(long)sequenceNumber,self.subtitleArray[indexPath.section][indexPath.row]];
    cell.textLabel.textColor = [UIColor blackColor];
    /*cell设置 */
    cell.selectionStyle = UITableViewCellSelectionStyleGray;            // 点击阴影效果
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;   // 右侧小箭头显示
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
- (NSInteger )getSequenceNumber:(NSArray *)array indexPath:(NSIndexPath *)indexPath {
    
    if (array.count == 0) {
        return 1;
        
    }else if (array.count == 1) {
        return indexPath.row;
        
    }else  {
        NSInteger count = 0;
        for (int i = 0; i< indexPath.section; i++) {
             count += ((NSArray *)array[i]).count;
        }
        return count + indexPath.row;
    };
}

#pragma mark -  点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选中阴影消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_isSelfDefined) {
        if (self.clickBlock) {
            self.clickBlock(indexPath);
        };
        return;
    }
    
//    //跳转到Demo_ViewController
    NSString *className = self.vcNameArray[indexPath.section][indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _subtitleArray[indexPath.section][indexPath.row];
        ctrl.view.backgroundColor = [UIColor lavender];
        [self.navigationController pushViewController:ctrl animated:YES];
    };
}
- (void)getSelfDefinedBlock:(ClickCellBlock)clickBlock with:(BOOL)isSelfDefined{
    _clickBlock = clickBlock;
    _isSelfDefined = isSelfDefined;
}
#pragma mark - tableView懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.separatorStyle = UITableViewCellSelectionStyleGray;   // 灰色分割线
        _tableView.separatorColor = [UIColor lightGrayColor];             // 分割线的颜色
        
    }
    
    return _tableView;
}
@end
