//
//  ClickableLabel.h
//  UIGracefulWriting
//
//  Created by gjfax on 2018/7/23.
//  Copyright © 2018年 macheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickBlock) (NSString *string , NSRange range , NSInteger index);

@interface YBAttributeModel : NSObject
@property (nonatomic, copy) NSString *str;
@property (nonatomic, assign) NSRange range;
@end

@interface ClickableLabel : UILabel

//  普通显示方法（注意：一定要设置整串字符串的富文本属性，否则会报错）
- (void)gjs_addAttributeString:(NSString *)totalString
                    totalFont:(NSNumber *)totalFont
                   totalColor:(UIColor *)totalColor
               elementStrings:(NSArray <NSString *> *)elementStrings
                 elementFonts:(NSArray <NSNumber *> *)elementFonts
                elementColors:(NSArray <UIColor *> *)elementColors
       elementUnderLineColors:(NSArray <UIColor *> *)elementUnderLineColors;



//点击回调方法
- (void)gjs_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                            enabledTapEffect:(BOOL)enabledTapEffect
                              clickTextColor:(UIColor *)clickTextColor
                        clickBackgroundColor:(UIColor *)clickBackgroundColor
                                 tapClicked:(ClickBlock)tapClick;



@end
