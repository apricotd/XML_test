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
    NSString *condition;
}

@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSString *region;
@property (nonatomic,copy)NSString *country;
@property (nonatomic)       int    temperature;
@property (nonatomic,copy)NSString *condition;
@property (nonatomic,copy)NSString *week;
@property (nonatomic,strong)NSMutableArray  *high,*low;
//@property (nonatomic)W_date   *w_date;

@end
