//
//  ZFWeather.h
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFWeather : NSObject
{
    NSString *city;
    NSString *region;
    NSString *country;
    int temperature;
}

@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSString *region;
@property (nonatomic,copy)NSString *country;
@property (nonatomic)       int    temperature;

@end
