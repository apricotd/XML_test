//
//  TRBookXmlParser.m
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import "TRBookXmlParser.h"

@implementation TRBookXmlParser


-(ZFWeather *)beginParseByUrl2:(NSString *)url
{
 NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weather.yahooapis.com/forecastrss?w=2161853&u=c"]];
 AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
 XMLParser.delegate = self;
 [XMLParser parse];
 } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, NSXMLParser *XMLParser) {
     XMLParser.delegate = self;
     [XMLParser parse];
 }];
 [operation start];
    return self.weather;
}


-(ZFWeather *)beginParseByUrl:(NSString *)url
{
    NSURL *req =[[NSURL alloc] initWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:req cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:100];
    //NSData *data= [NSData dataWithContentsOfURL:req]; //
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    //self.books = [[NSMutableArray alloc]initWithCapacity:20];
    
    self.weather = [[ZFWeather alloc]init];
    self.weather.high = [[NSMutableArray alloc]initWithCapacity:6];
    self.weather.low = [[NSMutableArray alloc]initWithCapacity:6];
    [parser setDelegate:self];
    if ([parser parse]) {
        NSLog(@"解析成功");
    }
    return self.weather;
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    if ([elementName isEqualToString:@"yweather:location"]) {
        NSLog(@"%@",attributeDict);
        
        self.weather.city = [attributeDict objectForKey:@"city"];
        self.weather.region = [attributeDict objectForKey:@"region"];
        self.weather.country = [attributeDict objectForKey:@"country"];
        //[self.books addObject:self.weather];
    }
    if ([elementName isEqualToString:@"yweather:condition"]) {
        self.weather.temperature = (int)[[attributeDict objectForKey:@"temp"] integerValue];
        self.weather.condition = [attributeDict objectForKey:@"text"];
    }
    if ([elementName isEqualToString:@"lastBuildDate"]) {
        ;
    }
    if ([elementName isEqualToString:@"yweather:forecast"]) {
        [self.weather.high addObject:[attributeDict objectForKey:@"high"]];
        [self.weather.low addObject:[attributeDict objectForKey:@"low"]];
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
    }else if ([elementName isEqualToString:@"lastBuildDate"]){
        NSString *date = self.currentString;
        self.weather.week = [date substringWithRange:NSMakeRange(0,3)];
    }
}

@end
