//
//  CustomTriangleView.m
//  UIGracefulWriting
//
//  Created by gjfax on 2019/9/17.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "CustomTriangleView.h"
@interface CustomTriangleView ()
@property (nonatomic, strong) UIBezierPath *bezierPath;
@end
@implementation CustomTriangleView

- (id)initWithFrame:(CGRect)frame UIBezierPath:(UIBezierPath*)path {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        _bezierPath = path;
        [self setMaskWithPath:_bezierPath];
        
    }
    return self;
}

- (void)setMaskWithPath:(UIBezierPath*)path {
    _bezierPath = path;
    [self setMaskWithPath:path withBorderColor:nil borderWidth:0];
}

- (void)setMaskWithPath:(UIBezierPath*)path withBorderColor:(UIColor * __nullable)borderColor borderWidth:(float)borderWidth{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [path CGPath];
    maskLayer.fillColor = [[UIColor whiteColor] CGColor];
    maskLayer.frame = CGRectMake(0, 0, self.width, self.height);
    self.layer.mask = maskLayer;
    
    if (borderColor && borderWidth>0) {
        CAShapeLayer *maskBorderLayer = [CAShapeLayer layer];
        maskBorderLayer.path = [path CGPath];
        maskBorderLayer.fillColor = [[UIColor clearColor] CGColor];
        maskBorderLayer.strokeColor = [borderColor CGColor];
        maskBorderLayer.lineWidth = borderWidth;
        [self.layer addSublayer:maskBorderLayer];
    };
    
}

- (BOOL)containsPoint:(CGPoint)point{
    return [_bezierPath containsPoint:point];
}

@end
