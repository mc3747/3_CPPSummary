//
//  MoreAlertManageVC.m
//  UIGracefulWriting
//
//  Created by gjfax on 2019/4/12.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "MoreAlertManageVC.h"
#import "MoreAlertManageTableVC.h"

@interface MoreAlertManageVC ()
@property (strong, nonatomic) UIButton *normalButton;
@property (strong, nonatomic) UIButton *pushButton;
@property (strong, nonatomic) UIButton *presentButton;
@end

@implementation MoreAlertManageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.normalButton];
    [self.view addSubview:self.pushButton];
    [self.view addSubview:self.presentButton];
    
    self.normalButton.frame = CGRectMake(50, 100, 100, 50);
    self.pushButton.frame = CGRectMake(50, 200, 100, 50);
    self.presentButton.frame = CGRectMake(50, 300, 100, 50);
}
#pragma mark -  普通加锁
- (void)onNormalButtonClicked:(UIButton *)button {
    //创建一个队列，串行并行都可以，主要为了操作信号量
    dispatch_queue_t queue = dispatch_queue_create("com.se7en.alert", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        //创建一个初始为0的信号量
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        //第一个弹框，UI的创建和显示，要在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"弹框1" message:@"第一个弹框" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //点击Alert上的按钮，我们发送一次信号。
                dispatch_semaphore_signal(sema);
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        });
        
        //等待信号触发，注意，这里是在我们创建的队列中等待
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        //上面的等待到信号触发之后，再创建第二个Alert
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"弹框2" message:@"第二个弹框" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                dispatch_semaphore_signal(sema);
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        });
        
        //同理，创建第三个Alert
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"弹框3" message:@"第三个弹框" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                dispatch_semaphore_signal(sema);
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        });
    });
   
}
#pragma mark -  push更多
- (void)onPushButtonClicked:(UIButton *)button {
    MoreAlertManageTableVC *vc = [MoreAlertManageTableVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -  present更多
- (void)onPresentButtonClicked:(UIButton *)button {
    MoreAlertManageTableVC *vc = [MoreAlertManageTableVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (UIButton *)normalButton {
    if (!_normalButton) {
        _normalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_normalButton setTitle:@"普通加锁" forState:UIControlStateNormal];
        _normalButton.backgroundColor = [UIColor blackColor];
        [_normalButton addTarget:self action:@selector(onNormalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _normalButton;
}
- (UIButton *)pushButton {
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushButton setTitle:@"Push更多" forState:UIControlStateNormal];
        _pushButton.backgroundColor = [UIColor blackColor];
        [_pushButton addTarget:self action:@selector(onPushButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

- (UIButton *)presentButton {
    if (!_presentButton) {
        _presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_presentButton setTitle:@"Present更多" forState:UIControlStateNormal];
        _presentButton.backgroundColor = [UIColor blackColor];
        [_presentButton addTarget:self action:@selector(onPresentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _presentButton;
}


@end
