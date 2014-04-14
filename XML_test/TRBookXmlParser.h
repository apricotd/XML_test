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

@interface TRBookXmlParser : NSObject<NSXMLParserDelegate>

@property (nonatomic,strong)NSMutableArray *books;
@property (nonatomic,strong)ZFWeather *weather;
@property (nonatomic,copy)NSString *currentString;

-(NSMutableArray *)beginParseByPath:(NSString *)path;
-(NSMutableArray *)beginParseByUrl:(NSString *)url;

@end
