//
//  FourElementViewController.m
//  UIGracefulWriting
//
//  Created by gjfax on 2019/9/17.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "FourElementViewController.h"
#import "BaseInputView.h"

/*
 1，银行卡
 2，姓名
 3，身份证
 4，预留手机号
 验证码
 */

/*
 1，输入空格展示
 2，失去焦点后，判断格式是否正确：前端验证
 3，错误提示在输入框下，整个坐标向下移
 4，每种textField对应不同的安全键盘
 */
@interface FourElementViewController ()
@property (nonatomic, strong) BaseInputView *inputView;
@property (nonatomic, assign) BOOL clickState;
@end

@implementation FourElementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseInputView *view = [[BaseInputView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 50)];
    [self.view addSubview:view];
    _inputView = view;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, view.bottom + 50, 100, 50)];
    [button setTitle:@"切换" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)clickAction{
    if (_clickState) {
         [_inputView removeTips];
    }else{
        [_inputView showTips:@"错误提示"];
    };
    _clickState = !_clickState;
}

@end
