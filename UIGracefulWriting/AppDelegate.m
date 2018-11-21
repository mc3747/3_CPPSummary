//
//  AppDelegate.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/6/13.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ScreenBlurry.h"
#import "AppDelegate+LaunchView.h"
#import "WCYADImageView.h"
#import "CHD_ListView_Structure.h"
 /*1,毛玻璃效果：
    1，加载完毕后初始化visualEffectView
    2，进入后台后
    3，进入前台
  2，高斯模糊：
  */

@interface AppDelegate ()
@property (nonatomic, strong, nullable) UIVisualEffectView *visualEffectView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *VC = [storyboard instantiateInitialViewController];
//    ViewController *VC = [[ViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:VC];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = naviVC;
    [self.window makeKeyAndVisible];

//    启动图片：采用分类的形式
//    [self initLaunchView:application WithOption:launchOptions];
    
//    毛玻璃效果：加载
    if (!self.visualEffectView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        self.visualEffectView.frame = self.window.frame;
    };
    

    
#if DEBUG
    id overlayClass = NSClassFromString(@"UIDebuggingInformationOverlay");
    [overlayClass performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];
#endif
  
//显示list
//    [CHD_ListView_Structure openStructureShow_TableV:YES collectionV:YES];
    return YES;
}


//以下两组搭配使用（推荐使用）
- (void)applicationWillResignActive:(UIApplication *)application {
    //    self.visualEffectView.alpha = 0;
    //    [self.window addSubview:self.visualEffectView];
    //    [UIView animateWithDuration:0.1 animations:^{
    //        self.visualEffectView.alpha = 1;
    //    }];
    //添加模糊效果
    [ScreenBlurry addBlurryScreenImage];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    //    [UIView animateWithDuration:0.1 animations:^{
    //        self.visualEffectView.alpha = 0;
    //    } completion:^(BOOL finished) {
    //        [self.visualEffectView removeFromSuperview];
    //    }];
    //去除模糊效果
    [ScreenBlurry removeBlurryScreenImage];
}

//以下两组搭配使用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    //        self.visualEffectView.alpha = 1.0;
    //        [self.window addSubview:self.visualEffectView];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    //    [UIView animateWithDuration:0.2 animations:^{
    //        self.visualEffectView.alpha = 0;
    //
    //    } completion:^(BOOL finished) {
    //        [self.visualEffectView removeFromSuperview];
    //
    //    }];
}





- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
