//
//  TRBook.h
//  XML_test
//
//  Created by ZhangFan on 14-4-12.
//  Copyright (c) 2014年 ZhangFan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRBook : NSObject
{
    NSString *name;
    NSString *bookID;
    NSString *author;
    int page;
    int price;
}

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *bookID;
@property (nonatomic,copy)NSString *author;
@property (nonatomic)     int      page;
@property (nonatomic)     int      price;

@end
