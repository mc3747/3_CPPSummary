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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    NSArray *buttonArray = @[_btn1,_btn2,_btn3,_btn4,_btn5,_btn6];
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

#pragma mark -  push出通用控制器
- (void)pushVCWithView:(UIView *)view {
    CommonViewController *vc = [[CommonViewController alloc] init];
    [vc.view addSubview:view];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
