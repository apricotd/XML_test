//
//  ZFWeather.m
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import "ZFWeather.h"

@implementation ZFWeather

@synthesize city,region,country,temperature,condition,week;

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %d",city,region,country,temperature];
}

@end
