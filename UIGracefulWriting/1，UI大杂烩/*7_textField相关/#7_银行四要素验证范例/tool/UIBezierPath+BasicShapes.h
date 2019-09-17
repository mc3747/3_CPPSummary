//
//  UIBezierPath+BasicShapes.h
//  GjFax
//
//  Created by Blavtes on 2017/5/4.
//  Copyright © 2017年 GjFax. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (BasicShapes)

/**
 画三角

 @param originalFrame originalFrame description
 @return return value description
 */
+ (UIBezierPath *)triangleShape:(CGRect)originalFrame;

/**
 已经反馈画三角

 @param frame frame description
 @return
 */
+ (UIBezierPath *)triangleFeedBackShape:(CGRect)frame;
@end
