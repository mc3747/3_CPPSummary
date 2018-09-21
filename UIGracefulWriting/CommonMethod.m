//
//  CommonMethod.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/9/21.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "CommonMethod.h"
#import <sys/sysctl.h>
#import <sys/utsname.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation CommonMethod


// 获取 device model/machine name 的方法一
+ (NSString *)machineName1 {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    if (machine == NULL) {
        return nil;
    }
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

// 获取 device model/machine name 的方法二
+ (NSString *)machineName2 {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

#pragma mark -  device model判断是否是iphoneX
+ (BOOL)isiPhoneX_1 {
    static BOOL isiPhoneX = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#if TARGET_IPHONE_SIMULATOR
        // 获取模拟器所对应的 device model
        NSString *model = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
#else
        // 获取真机设备的 device model
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
#endif
        // 判断 device model 是否为 "iPhone10,3" 和 "iPhone10,6" 或者以 "iPhone11," 开头
        // 如果是，就认为是 iPhone X
        isiPhoneX = [model isEqualToString:@"iPhone10,3"] || [model isEqualToString:@"iPhone10,6"] || [model hasPrefix:@"iPhone11,"];
    });
    
    return isiPhoneX;
}

#pragma mark -  顶部statusBar的高度来判断
+ (BOOL)isiPhoneX_2 {
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    if (statusBarFrame.size.height == 44.0f) {
        return YES;
    }
    return NO;
}

#pragma mark -  底部安全高度来判断
+ (BOOL)isiPhoneX_3 {
    if (@available(iOS 11.0, *)) {
        UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
        // 获取底部安全区域高度，iPhone X 竖屏下为 34.0，横屏下为 21.0，其他类型设备都为 0
        CGFloat bottomSafeInset = keyWindow.safeAreaInsets.bottom;
        if (bottomSafeInset == 34.0f || bottomSafeInset == 21.0f) {
            return YES;
        }
    }
    return NO;
}

#pragma mark -  faceId来判断
+ (BOOL)isiPhoneX_4 {
    if (@available(iOS 11.0, *)) {
        // will fail if user denies `canEvaluatePolicy:error:`
        LAContext *context = [[LAContext alloc] init];
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil]) {
            return (context.biometryType == LABiometryTypeFaceID);
        }
    }
    return NO;
}
@end
