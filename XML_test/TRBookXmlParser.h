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
#import "AFNetworking.h"
#import "ViewController.h"
#import "passValueDelegate.h"

@interface TRBookXmlParser : NSObject<NSXMLParserDelegate,NSURLConnectionDataDelegate>

//@property (nonatomic,strong)NSMutableArray *books;
@property (nonatomic,strong)ZFWeather *weather;
@property (nonatomic,copy)NSString *currentString;
@property NSMutableData *data;
@property BOOL isFinish;

@property(nonatomic,assign) NSObject<PassValueDelegate> *delegate;
//-(void *)beginParseByPath:(NSString *)path;
-(ZFWeather *)beginParseByUrl:(NSString *)url;
-(ZFWeather *)beginParseByUrl2:(NSString *)url;
-(ZFWeather *)beginParseByUrl1:(NSString *)url;

@end
