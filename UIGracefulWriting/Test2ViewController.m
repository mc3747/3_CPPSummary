//
//  Test2ViewController.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/9/21.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()
@property (nonatomic, weak) UIView *maskView;
@end

@implementation Test2ViewController
- (void)loadView {
    [super loadView];
    UIView *maskView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    maskView3.backgroundColor = [UIColor redColor];
    [self.view addSubview:maskView3];
    [self.view bringSubviewToFront:maskView3];
    [self performSelector:@selector(dismiss:) withObject:maskView3 afterDelay:2.f];
    _maskView = maskView3;
}

- (void)dismiss:(UIView *)view {
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 0.f;
        [view removeFromSuperview];
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    maskView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:maskView];
    
    UIView *maskView2 = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 100, 100)];
    maskView2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:maskView2];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:_maskView];
}
@end
