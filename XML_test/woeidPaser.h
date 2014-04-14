//
//  woeidPaser.h
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#define appid dj0yJmk9c09zZFRrYWxVUXplJmQ9WVdrOVluZHdUbWh0TXpJbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1lNQ--

#import <Foundation/Foundation.h>

@interface woeidPaser : NSObject<NSXMLParserDelegate>

@property (nonatomic,copy)NSString *woeid;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *currentString;

-(NSString *)beginParseByName:(NSString *)name;

@end
