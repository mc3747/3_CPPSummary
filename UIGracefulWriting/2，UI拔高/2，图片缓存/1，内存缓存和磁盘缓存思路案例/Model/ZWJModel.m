//
//  ZWJModel.m
//  12-掌握-多图下载综合案例
//
//  Created by 赵文娟 on 17/2/23.
//  Copyright © 2017年 ZWJ. All rights reserved.
//

#import "ZWJModel.h"

@implementation ZWJModel
//
+(instancetype)arrMWithDic:(NSDictionary *)dic
{

    ZWJModel    *model = [[ZWJModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
    }

@end
