//
//  CustomView.m
//  自定义控件
//
//  Created by gjfax on 16/6/3.
//  Copyright © 2016年 macheng. All rights reserved.
//

#import "PureXibCustomView.h"
#import "PureXibCustomModel.h"

@interface PureXibCustomView()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;

@end

@implementation PureXibCustomView

+ (instancetype)customViewShow {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

- (void)setModel:(PureXibCustomModel *)model {
    // set方法里边，不能用self，即不能写成self.model,而要写成_model
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.imageName];
    self.iconLabel.text = model.labelName;
}
@end
