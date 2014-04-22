//
//  TRBookXmlParser.h
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "TRBook.h"
#import "ZFWeather.h"
#import "ViewController.h"
#import "passValueDelegate.h"

@interface TRBookXmlParser : NSObject<NSXMLParserDelegate,NSURLConnectionDataDelegate>
{
//    ZFWeather *weather;
}

//@property (nonatomic,strong)NSMutableArray *books;
@property (nonatomic,strong)ZFWeather *weather;
@property (nonatomic,copy)NSString *currentString;
@property (nonatomic,copy)NSString *woeid;
@property (atomic,strong)NSMutableData *data;

@property(nonatomic,strong) NSObject<PassValueDelegate>* delegate;
//-(void *)beginParseByPath:(NSString *)path;
//-(ZFWeather *)beginParseByUrl:(NSString *)url;
//-(ZFWeather *)beginParseByUrl2:(NSString *)url;
-(void)beginParseByUrl1:(NSString *)url;

@end
