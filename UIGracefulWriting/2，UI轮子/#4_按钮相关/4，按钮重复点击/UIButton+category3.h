//
//  UIButton+category3.h
//  UIGracefulWriting
//
//  Created by gjfax on 2018/7/24.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (category3)
@property (nonatomic, assign) NSTimeInterval cs_acceptEventInterval; // 重复点击的间隔

@property (nonatomic, assign) NSTimeInterval cs_acceptEventTime;
@end
