//
//  TextViewRichVC.m
//  UIGracefulWriting
//
//  Created by gjfax on 2019/2/20.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "TextViewRichVC.h"
#import "ClickTextView.h"

static const NSInteger textFont = 17;

@interface TextViewRichVC ()<UITextViewDelegate>
@property (weak, nonatomic)  UITextView *textview;
@property (assign, nonatomic) BOOL isSelect;
@end

@implementation TextViewRichVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addElementTextView];
    [self addTextView];
    
}
#pragma mark -  组件化的textView
- (void)addElementTextView {
    
    ClickTextView *clickTextView = [[ClickTextView alloc] initWithFrame:CGRectMake(50, 250, 300, 300)];
    [self.view addSubview:clickTextView];
    
    // 方便测试，设置textView的边框已经背景
    clickTextView.backgroundColor = [UIColor cyanColor];
    clickTextView.layer.borderWidth = 1;
    clickTextView.layer.borderColor = [UIColor redColor].CGColor;
    clickTextView.font = [UIFont systemFontOfSize:30];
    //    clickTextView.textColor = [UIColor redColor];
    
    
    NSString *content = @"1234567890承诺书都差不多岁尺布斗粟CBD死UC收不到催上半场低俗";
    // 设置文字
    clickTextView.text = content;
    
    // 设置期中的一段文字有下划线，下划线的颜色为蓝色，点击下划线文字有相关的点击效果
    NSRange range1 = [content rangeOfString:@"承诺书都差"];
    [clickTextView setUnderlineTextWithRange:range1 withUnderlineColor:[UIColor blueColor] withClickCoverColor:[UIColor greenColor] withBlock:^(NSString *clickText) {
        NSLog(@"clickText = %@",clickText);
    }];
    
    // 设置期中的一段文字有下划线，下划线的颜色没有设置，点击下划线文字没有点击效果
    NSRange range2 = [content rangeOfString:@"不到催上半场低俗"];
    [clickTextView setUnderlineTextWithRange:range2 withUnderlineColor:nil withClickCoverColor:nil withBlock:^(NSString *clickText) {
        NSLog(@"clickText = %@",clickText);
    }];
}
#pragma mark -  原生的textView
- (void)addTextView {
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 300, 100)];
    [self.view addSubview:textview];
    self.textview = textview;
    [self protocolIsSelect:self.isSelect];
}

- (void)protocolIsSelect:(BOOL)select {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"请遵守以下协议《支付宝协议》《微信协议》《建行协议》《招行协议》《中国银行协议》《上海银行协议》"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"zhifubao://"
                             range:[[attributedString string] rangeOfString:@"《支付宝协议》"]];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"weixin://"
                             range:[[attributedString string] rangeOfString:@"《微信协议》"]];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"jianhang://"
                             range:[[attributedString string] rangeOfString:@"《建行协议》"]];
    
    
    UIImage *image = [UIImage imageNamed:select == YES ? @"click-selected" : @"default-nonSelected"];
    CGSize size = CGSizeMake(textFont + 2, textFont + 2);
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    [image drawInRect:CGRectMake(0, 2, size.width, size.height)];
    UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = resizeImage;
    NSMutableAttributedString *imageString = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
    [imageString addAttribute:NSLinkAttributeName
                        value:@"checkbox://"
                        range:NSMakeRange(0, imageString.length)];
    [attributedString insertAttributedString:imageString atIndex:0];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:textFont] range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleNone) range:NSMakeRange(0, attributedString.length)];
    _textview.attributedText = attributedString;
    _textview.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor],
                                     NSUnderlineColorAttributeName: [UIColor redColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                     };
    
    _textview.delegate = self;
    _textview.editable = NO;        //必须禁止输入，否则点击将弹出输入键盘
    _textview.scrollEnabled = NO;
}
#pragma mark -  textView的代理
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"jianhang"]) {
        NSLog(@"建行支付---------------");
        return NO;
    } else if ([[URL scheme] isEqualToString:@"zhifubao"]) {
        NSLog(@"支付宝支付---------------");
        return NO;
    } else if ([[URL scheme] isEqualToString:@"weixin"]) {
        NSLog(@"微信支付---------------");
        return NO;
    } else if ([[URL scheme] isEqualToString:@"checkbox"]) {
        self.isSelect = !self.isSelect;
        [self protocolIsSelect:self.isSelect];
        return NO;
    }
    return YES;
}

@end
