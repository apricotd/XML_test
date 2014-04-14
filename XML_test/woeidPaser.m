//
//  woeidPaser.m
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import "woeidPaser.h"

@implementation woeidPaser
@synthesize name,woeid;

-(NSString *)beginParseByName:(NSString *)n
{
    NSString *utf8ParamValue = [n stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //URL中包含中文需要先转下码制
    NSString *url = [NSString stringWithFormat:@"http://where.yahooapis.com/v1/places.q(%@)?appid=dj0yJmk9c09zZFRrYWxVUXplJmQ9WVdrOVluZHdUbWh0TXpJbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1lNQ--",utf8ParamValue];
    NSURL *req =[[NSURL alloc] initWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:req cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //NSData *data= [NSData dataWithContentsOfURL:req]; //
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
//    self.books = [NSMutableArray array];
    
    [parser setDelegate:self];
    if ([parser parse]) {
        NSLog(@"解析成功");
    }
    
    return woeid;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"place"]) {
        NSLog(@"%@",attributeDict);
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    self.currentString = string;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"woeid"]) {
        woeid = self.currentString;
    }
}

@end
