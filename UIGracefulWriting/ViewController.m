//
//  ViewController.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/6/13.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "ViewController.h"
#import "CommonViewController.h"

#import "CustomBannerScrollView.h"
#import "BannerDemoVC.h"
#import "SDViewController.h"

#import "LeftViewController.h"
#import "RightViewController.h"
#import "SWRevealViewController.h"
#import "Demo1ViewController.h"
#import "ClickableLabel.h"
#import "CommonUnderlineButton.h"
#import "TextViewViewController.h"

#import "TabView_1_ViewController.h"
#import "TabView_2_ViewController.h"
#import "TabView_3_ViewController.h"
#import "TabView_4_ViewController.h"
#import "TabView_5_ViewController.h"
#import "TabView_6_ViewController.h"

#import "Common_ViewController.h"
#import "SGEventVC.h"
#import "SGCountdownVC.h"
#import "SGImagePositionVC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btn10;
@property (weak, nonatomic) IBOutlet UIButton *btn11;
@property (weak, nonatomic) IBOutlet UIButton *btn12;
@property (weak, nonatomic) IBOutlet UIButton *btn13;
@property (weak, nonatomic) IBOutlet UIButton *btn14;
@property (weak, nonatomic) IBOutlet UIButton *btn15;
@property (weak, nonatomic) IBOutlet UIButton *btn16;
@property (weak, nonatomic) IBOutlet UIButton *btn17;
@property (weak, nonatomic) IBOutlet UIButton *btn18;
@property (weak, nonatomic) IBOutlet UIButton *btn19;
@property (weak, nonatomic) IBOutlet UIButton *btn20;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    NSArray *buttonArray = @[_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12,_btn13,_btn14,_btn15,_btn16,_btn17,_btn18,_btn19,_btn20];
    [buttonArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton*)obj;
        NSString *selName = [NSString stringWithFormat:@"test%li",idx + 1];
        SEL sel = NSSelectorFromString(selName);
        [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    }];
}


#pragma mark -   普通滚动图片
- (void)test1 {
    UIViewController *VC = [[UIViewController alloc] init];
    VC.view.backgroundColor = [UIColor blueColor];
    CustomBannerScrollView *bannerView = [[CustomBannerScrollView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 150) ];
    [bannerView configPictures:@[@"home_ad_1",@"home_ad_2",@"home_ad_3"]];
    [VC.view addSubview:bannerView];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark -  循环滚动
- (void)test2 {
    SDViewController *vc = [[SDViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -  复杂滚动
- (void)test3 {
    BannerDemoVC *vc = [[BannerDemoVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -  collectionView
- (void)test4 {
    
    //左侧菜单栏
    LeftViewController *leftViewController = [[LeftViewController alloc] init];
    
    //首页
    Demo1ViewController *centerView1Controller = [[Demo1ViewController alloc] init];
    
    //右侧菜单栏
    RightViewController *rightViewController = [[RightViewController alloc] init];
    
    SWRevealViewController *revealViewController = [[SWRevealViewController alloc] initWithRearViewController:leftViewController frontViewController:centerView1Controller];
    revealViewController.rightViewController = rightViewController;
    
    //浮动层离左边距的宽度
    revealViewController.rearViewRevealWidth = 230;
    //    revealViewController.rightViewRevealWidth = 230;
    
    //是否让浮动层弹回原位
    //mainRevealController.bounceBackOnOverdraw = NO;
    [revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    
    [self.navigationController pushViewController:revealViewController animated:YES];
}
#pragma mark -  5,label可以点击和带下划线
- (void)test5 {
//常见属性
    ClickableLabel *ybLabel2 = [[ClickableLabel alloc] initWithFrame:CGRectMake(10, 200, self.view.bounds.size.width - 20, 40)];
    ybLabel2.backgroundColor = [UIColor whiteColor];
    ybLabel2.numberOfLines = 2;
    
//富文本显示属性
    NSString *label_text2 = @"我已阅读 借款协议 和 风险及禁止性行为提示 并同意签署";
    NSArray *stringArray = @[@"借款协议",@"风险及禁止性行为提示"];
    NSArray <NSNumber *> *elementfonts = @[@14,@14];
    NSArray <UIColor *> *elementcolors = @[[UIColor redColor],[UIColor grayColor]];
    NSArray <UIColor *> *elementunderLineColors = @[[UIColor redColor],[UIColor grayColor]];
    [ybLabel2 gjs_addAttributeString:label_text2 totalFont:@14 totalColor:[UIColor grayColor] elementStrings:stringArray elementFonts:elementfonts elementColors:elementcolors elementUnderLineColors:elementunderLineColors];
    
//点击属性
    [ybLabel2 gjs_addAttributeTapActionWithStrings:stringArray enabledTapEffect:YES clickTextColor:[UIColor blueColor] clickBackgroundColor:[UIColor clearColor] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSString *message = [NSString stringWithFormat:@"点击了“%@”字符\nrange: %@\nindex: %ld",string,NSStringFromRange(range),index];
        NSLog(@"%@",message);
    }];

    [self pushVCWithView:ybLabel2];
    
   
}
#pragma mark -  6，textfield相关见storyboard
//直接在stroyboard中跳转展示

#pragma mark -  7，button相关
- (void)test6 {
    
    CommonUnderlineButton *btn = [[CommonUnderlineButton alloc]
                                                initWithButtonFrame: CGRectMake(10, 100, 200, 50)
                                                    textNormalColor:[UIColor yellowColor]
                                  textHighlightColor:[UIColor blueColor]
                                  lineNormalColor:[UIColor yellowColor]
                                  lineHighlightColor:[UIColor redColor]
                                  underDistance:5.f clickBlock:^(CommonUnderlineButton *button) {
        NSLog(@"点击了");
    }];
    
    [btn setTitle:@"带下划线的button" forState:UIControlStateNormal];
    
    [self pushVCWithView:btn];
}
#pragma mark -  8，文字图片组合按钮
- (void)test7 {
    SGImagePositionVC *vc = [[SGImagePositionVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  9,重复点击时间按钮
- (void)test8 {
    SGEventVC *vc = [[SGEventVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  10,倒计时按钮
- (void)test9 {
    SGCountdownVC *vc = [[SGCountdownVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  11,textView相关
- (void)test10 {
    TextViewViewController *vc = [[TextViewViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  12,tableView常用设置
- (void)test11 {
    TabView_1_ViewController *vc = [[TabView_1_ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  13,tableView自定义等高
- (void)test12 {
    TabView_2_ViewController *vc = [[TabView_2_ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  14,tableView自定义不等高
- (void)test13 {
    TabView_3_ViewController *vc = [[TabView_3_ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  15,tableView优雅地写
- (void)test14 {
    TabView_4_ViewController *vc = [[TabView_4_ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  16,炫酷效果
- (void)test15 {
    
}
#pragma mark -  17,性能优化
- (void)test16 {
    
}
#pragma mark -  18,备用
- (void)test17 {
   
}
#pragma mark -  19,备用
- (void)test18 {
  
}

#pragma mark -  20,备用
- (void)test19 {
    
}
#pragma mark -  21,其他
- (void)test20 {
    Common_ViewController *vc = [[Common_ViewController alloc] init];
    
    vc.title = @"其他UI效果";
    
    vc.vcNameArray = @[@"ShadeEffectVC",@"MoneyAnimationVC",@"CQFilterViewController",@"CQJigsawViewController",@"DimImageViewController",@"Switch1_ViewController",@"Switch2_ViewController",@"IconFontViewController",@"ScreenShotVC",@"RichTextVC",@"MemoTableViewController",@"DemosViewController",@"DropDownViewController",@"YZDropViewController",@"Switch3_ViewController",@"AlertViewController",@"AlertTableViewController",@"ActionSheetTableViewController",@"ShowViewController",@"FatherAndSonVC",@"WonderfulColorVC"];
    
    vc.subtitleArray = @[@"1，渐变效果",@"2，金额跳动效果",@"3，模态弹窗",@"4，比例拼图",@"5，模糊效果",@"6，横向切换1",@"7，横向切换2",@"8，IconFont的使用",@"9，截屏展示",@"10，富文本总结",@"11，便签效果",@"12，IGListKit的Demo",@"13，美团下拉二级菜单",@"14，袁崢二级菜单",@"15，SGPagingView横向切换",@"16，系统alert和sheet",@"17，LEE的alert",@"18，LEE的sheet",@"19，JXT的Alert汇总",@"20，父子控制器",@"21，完美颜色"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -  push出通用控制器
- (void)pushVCWithView:(UIView *)view {
    CommonViewController *vc = [[CommonViewController alloc] init];
    [vc.view addSubview:view];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
