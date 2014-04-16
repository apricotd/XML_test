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

@implementation ViewController

@synthesize City,temp,Condition;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.TodayLabel setHidden:YES];
	// Do any additional setup after loading the view, typically from a nib.
    //NSString *xmlPath = [[NSBundle mainBundle]pathForResource:@"forecastrss" ofType:@"xml"];

}

-(void)PassValue:(ZFWeather *)weather
{
    City.text = weather.city;
    NSMutableString *tempstr = [[NSMutableString alloc] initWithFormat:@"%d",weather.temperature];
    [tempstr appendString:@"℃"];
    temp.text = tempstr;
    Condition.text = weather.condition;
    
    self.weekLabel.text=weather.week;
    [self.TodayLabel setHidden:NO];
    if ([weather.high count]) {
        self.High_Today.text = [weather.high objectAtIndex:0];
        self.Low_Today.text  = [weather.low  objectAtIndex:0];
    }
}

-(IBAction)check:(id)sender
{
    NSString *cityname = self.getCity.text;
    
    woeidPaser *parser1 = [[woeidPaser alloc] init];
    NSString *woeid = [parser1 beginParseByName:cityname];
    NSLog(@"%@",woeid);
    
    TRBookXmlParser *parser = [[TRBookXmlParser alloc] init];
    parser.delegate =self;
    ZFWeather *weather = [parser beginParseByUrl1:[NSString stringWithFormat:@"http://weather.yahooapis.com/forecastrss?w=%@&u=c",woeid]];
    NSLog(@"%@",weather);
    //conImage.image = [UIImage imageNamed:@"sunny"];

    
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)View_TouchDown:(id)sender {
    // 发送resignFirstResponder.
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
