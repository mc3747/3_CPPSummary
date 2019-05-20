//
//  CustomView.m
//  自定义控件
//
//  Created by gjfax on 16/6/3.
//  Copyright © 2016年 macheng. All rights reserved.
//

#import "PureCodeCustomView.h"
#import "PureCodeCustomModel.h"

@interface PureCodeCustomView()
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *iconLabel;
@end

@implementation PureCodeCustomView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        self.iconImageView = imageView;
        [self addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        self.iconLabel = label;
        [self addSubview:label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat iconImageViewX = 0;
    CGFloat iconImageViewY = 0;
    CGFloat iconImageViewW = self.bounds.size.width;
    CGFloat iconImageViewH = 80;
    self.iconImageView.frame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
    
    CGFloat nameLabelX = 0;
    CGFloat nameLabelY = iconImageViewH;
    CGFloat nameLabelW = iconImageViewW;
    CGFloat nameLabelH = self.bounds.size.height - iconImageViewH;
    self.iconLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
}

- (void)setModel:(PureCodeCustomModel *)model {
    // set方法里边，不能用self，即不能写成self.model,而要写成_model
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.imageName];
    self.iconLabel.text = model.labelName;
}
@end
