//
//  TestViewController.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/9/25.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "TestViewController.h"
#import "Test1ViewController.h"
#import "Test2ViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"模拟webview的切换实现";
    
    UIStackView *containerView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 200)];
    containerView.axis = UILayoutConstraintAxisHorizontal;
    containerView.distribution = UIStackViewDistributionFillEqually;
    containerView.spacing = 10;
    containerView.alignment = UIStackViewAlignmentFill;
    NSArray *array = @[@"覆盖view",@"重写push",@"present"];
    for (NSInteger i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
        label.text = array[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 100 + i;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addGesture:)];
        [label addGestureRecognizer:gesture];
        label.userInteractionEnabled = YES;
        [containerView addArrangedSubview:label];
    }
    
    [self.view addSubview:containerView];
    
}

- (void)addGesture:(UITapGestureRecognizer *)sender {
    
    if (sender.view.tag == 100) {
        Test1ViewController *vc = [[Test1ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if(sender.view.tag == 101){
        Test2ViewController *vc = [[Test2ViewController alloc] init];
        
        CATransition* transition = [CATransition animation];
        
        transition.duration =0.4f;
        
        transition.type = kCATransitionMoveIn;
        
        transition.subtype = kCATransitionFromTop;
        
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        
        [self.navigationController pushViewController:vc animated:NO];
        
    }else {
        
    }
}


@end
