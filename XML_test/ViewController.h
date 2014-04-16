//
//  ViewController.h
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "passValueDelegate.h"

@interface ViewController : UIViewController<PassValueDelegate>

@property (weak, nonatomic) IBOutlet UILabel *City;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UITextField *getCity;
@property (weak, nonatomic) IBOutlet UILabel *Condition;
@property (weak, nonatomic) IBOutlet UIView *temp_condition;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UILabel *TodayLabel;
@property (weak, nonatomic) IBOutlet UILabel *High_Today;
@property (weak, nonatomic) IBOutlet UILabel *Low_Today;


@end
