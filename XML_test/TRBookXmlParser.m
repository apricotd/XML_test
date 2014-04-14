//
//  TRBookXmlParser.m
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import "TRBookXmlParser.h"

@implementation TRBookXmlParser

-(NSMutableArray *)beginParseByPath:(NSString *)path
{
    NSData *data= [NSData dataWithContentsOfFile:path]; //
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    self.books = [NSMutableArray array];
    
    [parser setDelegate:self];
    if ([parser parse]) {
        NSLog(@"解析成功");
    }
    return self.books;
}

//req = [[NSString alloc]initWithFormat:@"http://download.finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=%@%@=x",src,des];
//NSLog(@"%@",req);
//NSURL *url = [NSURL URLWithString:req];
////http://steamcommunity.com/openid/id/<steamid>
////第二步，通过URL创建网络请求
//
//NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//
////NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间（秒）
//
//
////第三步，连接服务器
//NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

-(NSMutableArray *)beginParseByUrl:(NSString *)url
{
    NSURL *req =[[NSURL alloc] initWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:req cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //NSData *data= [NSData dataWithContentsOfURL:req]; //
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    self.books = [[NSMutableArray alloc]initWithCapacity:20];
    
    [parser setDelegate:self];
    if ([parser parse]) {
        NSLog(@"解析成功");
    }
    return self.books;
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"yweather:location"]) {
        NSLog(@"%@",attributeDict);
        self.weather = [[ZFWeather alloc]init];
        self.weather.city = [attributeDict objectForKey:@"city"];
        self.weather.region = [attributeDict objectForKey:@"region"];
        self.weather.country = [attributeDict objectForKey:@"country"];
        [self.books addObject:self.weather];
    }
    if ([elementName isEqualToString:@"yweather:condition"]) {
        self.weather.temperature = (int)[[attributeDict objectForKey:@"temp"] integerValue];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    self.currentString = string;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"end %@",elementName);
    if ([elementName isEqualToString:@"city"]) {
        self.weather.city = self.currentString;
    }else if ([elementName isEqualToString:@"region"]) {
        self.weather.region = self.currentString;
    }else if ([elementName isEqualToString:@"country"]){
        self.weather.country = self.currentString;
    }
    
}

@end
