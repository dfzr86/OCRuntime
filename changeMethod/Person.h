//
//  Person.h
//  changeMethod
//
//  Created by __zimu on 16/7/29.
//  Copyright © 2016年 __zimu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, strong) NSArray *books;
@property (nonatomic, strong) NSMutableArray *foods;

+ (void)run;
- (void)run;

+ (void)eat;
- (void)eat;
@end
