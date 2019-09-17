//
//  BaseInputView.m
//  UIGracefulWriting
//
//  Created by gjfax on 2019/9/17.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "BaseInputView.h"
@interface BaseInputView()
@property (nonatomic, assign) CGSize  originalSize;
@end
@implementation BaseInputView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _originalSize = frame.size;
        [self addSubview:self.titleLabel];
        [self addSubview:self.textField];
        [self addSubview:self.triangleView];
        [self addSubview:self.errorTipsLabel];
        self.titleLabel.text = @"测试";
        self.textField.backgroundColor = [UIColor grayColor];
        
    }
    return self;
}
- (void)showTips:(NSString *)tips{
    GJWeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.height += 30;
        weakSelf.triangleView.hidden = NO;
        weakSelf.errorTipsLabel.hidden = NO;
        weakSelf.errorTipsLabel.text = tips;
    }];
    
    
}
- (void)removeTips{
    GJWeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.height -= 30;
        weakSelf.triangleView.hidden = YES;
        weakSelf.errorTipsLabel.hidden = YES;
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 0, 100, _originalSize.height);
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}
- (UITextField *)textField
{
    if (!_textField) {
        UITextField *textField = [[UITextField alloc] init];
        textField.frame = CGRectMake(100, 0, _originalSize.height - 120, _originalSize.height);
        _textField = textField;
    }
    return _textField;
}
- (CustomTriangleView *)triangleView
{
    if (!_triangleView) {
        CustomTriangleView *triangleView = [[CustomTriangleView alloc] initWithFrame:CGRectMake(0, _originalSize.height - 20, _originalSize.width, _originalSize.height)];
        triangleView.backgroundColor = [UIColor redColor];
        [triangleView setMaskWithPath:[UIBezierPath triangleShape:CGRectMake(0, 0, 13, 6)]];
        triangleView.hidden = YES;
        _triangleView = triangleView;
    }
    return _triangleView;
}
- (MCLabel *)errorTipsLabel
{
    if (!_errorTipsLabel) {
        MCLabel *errorTipsLabel = [[MCLabel alloc] init];
        errorTipsLabel.frame = CGRectMake(0, _originalSize.height, _originalSize.width, 30);
        errorTipsLabel.contentInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        errorTipsLabel.hidden = YES;
        _errorTipsLabel = errorTipsLabel;
    }
    return _errorTipsLabel;
}
@end
