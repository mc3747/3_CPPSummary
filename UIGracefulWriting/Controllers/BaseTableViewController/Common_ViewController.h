//
//  Common_ViewController.h
//  ReactNativeDemo
//
//  Created by gjfax on 2018/7/31.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickCellBlock) (NSIndexPath *indexPath);

@interface Common_ViewController : UIViewController
@property (nonatomic, copy) NSArray *vcNameArray;
@property (nonatomic, strong) NSArray *subtitleArray;
@property (nonatomic, copy) ClickCellBlock clickBlock;

- (void)getSelfDefinedBlock:(ClickCellBlock)clickBlock with:(BOOL)isSelfDefined;

@end
