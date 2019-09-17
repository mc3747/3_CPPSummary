//
//  UIBezierPath+BasicShapes.m
//  GjFax
//
//  Created by Blavtes on 2017/5/4.
//  Copyright © 2017年 GjFax. All rights reserved.
//

#import "UIBezierPath+BasicShapes.h"

@implementation UIBezierPath (BasicShapes)

/**
     *
    ***
   *****

 @param frame frame description
 @return return value description
 */
+ (UIBezierPath *)triangleShape:(CGRect)frame
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) / 2 , CGRectGetMinY(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) , CGRectGetMaxY(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame))];
    
    [bezierPath closePath];
    
    return bezierPath;
}

/**
        *
       ***
      *****
       ***
        *

 @param frame frame description
 @return return value description
 */
+ (UIBezierPath *)triangleFeedBackShape:(CGRect)frame
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) / 2 , CGRectGetMinY(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) , CGRectGetMaxY(frame)  / 2)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) / 2 , CGRectGetMaxY(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame), CGRectGetMaxY(frame) / 2)];
    
    [bezierPath closePath];
    
    return bezierPath;
}
@end
