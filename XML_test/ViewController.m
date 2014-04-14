//
//  ViewController.m
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "ZFWeather.h"
#import "TRBookXmlParser.h"
#import "woeidPaser.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize City,temp;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //NSString *xmlPath = [[NSBundle mainBundle]pathForResource:@"forecastrss" ofType:@"xml"];


}

-(IBAction)check:(id)sender
{
    NSString *cityname = self.getCity.text;
    
    woeidPaser *parser1 = [[woeidPaser alloc] init];
    NSString *woeid = [parser1 beginParseByName:cityname];
    NSLog(@"%@",woeid);
    
    TRBookXmlParser *parser = [[TRBookXmlParser alloc] init];
    NSArray *books = [parser beginParseByUrl:[NSString stringWithFormat:@"http://weather.yahooapis.com/forecastrss?w=%@&u=c",woeid]];
    
    for (ZFWeather *weather in books){
        NSLog(@"%@",weather);
    }
    ZFWeather *weather = [books objectAtIndex:0];
    City.text = weather.city;
    NSMutableString *tempstr = [[NSMutableString alloc] initWithFormat:@"%d",weather.temperature];
    [tempstr appendString:@"℃"];
    temp.text = tempstr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
