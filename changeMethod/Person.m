//
//  Person.m
//  changeMethod
//
//  Created by __zimu on 16/7/29.
//  Copyright © 2016年 __zimu. All rights reserved.
//

#import "Person.h"

@implementation Person


+ (void)run {
    NSLog(@"跑");
}

- (void)run {
    NSLog(@"人跑");
}

+ (void)eat {
    NSLog(@"吃");
}

- (void)eat {
    NSLog(@"人吃");
}
@end
