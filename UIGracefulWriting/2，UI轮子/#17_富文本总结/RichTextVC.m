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
    self.vcNameArray = @[@[@"UILabelRichTextVC",@"HtmlViewController",@"",@"TYLabelViewController",@"MYCoreTextViewController",@"",@""]];
    self.subtitleArray = @[@[@"UIlabel的富文本",@"html系列",@"TextKit系列",@"TY系列",@"注释完备系列",@"YY系列",@"TT系列"]];
}



@end
