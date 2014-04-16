//
//  passValue.h
//  XML_test
//
//  Created by ZhangFan on 14-4-16.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZFWeather;

@protocol PassValueDelegate <NSObject>

-(void)PassValue:(ZFWeather *)weather;

@end
