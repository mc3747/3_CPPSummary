//
//  MCLabel.h
//  UILabel
//
//  Created by gjfax on 16/8/8.
//  Copyright © 2016年 macheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCLabel : UILabel

@property(nonatomic) UIEdgeInsets insets;
-(id) initWithFrame:(CGRect)frame andInsets: (UIEdgeInsets) insets;
-(id) initWithInsets: (UIEdgeInsets) insets;
@end
