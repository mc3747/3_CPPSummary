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
    self.vcNameArray = @[@"UILabelRichTextVC",@"",@"",@"",@"HtmlViewController"];
    self.subtitleArray = @[@"1，UIlabel的富文本",@"2，YY系列",@"3，TT系列",@"4，自定义系列",@"5，html系列"];
}



@end
