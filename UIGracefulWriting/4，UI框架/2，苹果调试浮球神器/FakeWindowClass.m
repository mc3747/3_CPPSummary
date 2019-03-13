//
//  FakeWindowClass.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/10/16.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "FakeWindowClass.h"
#import "UIWindow+PrivateMethods.h"

@implementation FakeWindowClass
- (instancetype)initSwizzled {
    self = [super init];
    if (self) {
        [self _setWindowControlsStatusBarOrientation:NO];
    }
    return self;
}

@end
