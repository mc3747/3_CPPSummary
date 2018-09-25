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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn setBackgroundColor:LBRandomColor forState:UIControlStateNormal];
    [maskView3 addSubview:btn];
    [self.view addSubview:maskView3];
    [self.view bringSubviewToFront:maskView3];
     self.navigationController.navigationBar.hidden = YES;

    [self performSelector:@selector(dismiss:) withObject:maskView3 afterDelay:3.f];
    _maskView = maskView3;
}

- (void)dismiss:(UIView *)view {
    GJWeakSelf;
//    [UIView animateWithDuration:2.0 animations:^{
//        weakSelf.navigationController.navigationBar.hidden = NO;
//        view.alpha = 0.f;
//        [view removeFromSuperview];
//    }];
    [UIView animateWithDuration:0.5f animations:^{
        view.alpha = 0.f;
//        view.center = CGPointMake(0, SCREEN_HEIGHT * 2.f);
        
    } completion:^(BOOL finished) {
       
        [view removeFromSuperview];
        weakSelf.navigationController.navigationBar.hidden = NO;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    maskView.backgroundColor = [UIColor blueColor];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pop)];
    [maskView addGestureRecognizer:gesture];
    [self.view addSubview:maskView];
    
    UIView *maskView2 = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 100, 100)];
    maskView2.backgroundColor = [UIColor orangeColor];
    UITapGestureRecognizer *gesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [maskView2 addGestureRecognizer:gesture2];
    [self.view addSubview:maskView2];
    
}

- (void)tap {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)pop
{
    
    CATransition* transition = [CATransition animation];
    
    transition.duration =0.4f;
    
    transition.type = kCATransitionReveal;
    
    transition.subtype = kCATransitionFromBottom;
    
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:_maskView];
}
@end
