//
//  RichTextVC.m
//  UIGracefulWriting
//
//  Created by gjfax on 2018/8/31.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import "RichTextVC.h"

@interface RichTextVC ()

@end

@implementation RichTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"富文本总结";
    self.vcNameArray = @[@"UILabelRichTextVC",@"HtmlViewController",@"",@"TYLabelViewController",@"MYCoreTextViewController",@"",@""];
    self.subtitleArray = @[@"1，UIlabel的富文本",@"2，html系列",@"3，TextKit系列",@"4，TY系列",@"5，注释完备系列",@"6，YY系列",@"7，TT系列"];
}



@end
