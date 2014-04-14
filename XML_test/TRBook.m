//
//  TRBook.m
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import "TRBook.h"

@implementation TRBook

@synthesize name,bookID,author,price,page;

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %d %d %@",name,author,price,page,bookID];
}

@end
