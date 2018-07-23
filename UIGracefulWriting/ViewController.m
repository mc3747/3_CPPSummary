//
//  ViewController.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/6/13.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "ViewController.h"
#import "CustomBannerScrollView.h"
#import "BannerDemoVC.h"
#import "SDViewController.h"

#import "LeftViewController.h"
#import "RightViewController.h"
#import "SWRevealViewController.h"
#import "Demo1ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    NSArray *buttonArray = @[_btn1,_btn2,_btn3,_btn4];
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

@end
