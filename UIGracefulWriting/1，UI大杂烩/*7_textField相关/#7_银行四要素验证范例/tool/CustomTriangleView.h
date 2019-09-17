//
//  CustomTriangleView.h
//  UIGracefulWriting
//
//  Created by gjfax on 2019/9/17.
//  Copyright © 2019 macheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTriangleView : UIView
- (id)initWithFrame:(CGRect)frame UIBezierPath:(UIBezierPath*)path;

- (void)setMaskWithPath:(UIBezierPath*)path;

- (void)setMaskWithPath:(UIBezierPath*)path withBorderColor:(UIColor* __nullable)borderColor borderWidth:(float)borderWidth;

- (BOOL)containsPoint:(CGPoint)point;
@end

NS_ASSUME_NONNULL_END
