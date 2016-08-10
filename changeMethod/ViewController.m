//
//  ViewController.m
//  changeMethod
//
//  Created by __zimu on 16/7/29.
//  Copyright © 2016年 __zimu. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getAllIvars];
}

#pragma mark - 获取类的成员变量
- (void)getAllIvars {
    //获取成员变量
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    
    //循环遍历所有成员变量
    for (int i = 0; i < outCount; ++i) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar); //成员变量名称
        const char *type = ivar_getTypeEncoding(ivar); //成员变量类型
        NSLog(@"名称: %s, 类型: %s", name, type);
    }
    free(ivars);
}


#pragma mark - 拦截系统方法->详见UIImage+Extension


#pragma mark - 交换系统方法
- (void)exchangeInstanceMethod {
    Person *p = [[Person alloc] init];
    [p run];
    [p eat];
    
    Method run = class_getInstanceMethod([Person class], @selector(run));
    Method eat = class_getInstanceMethod([Person class], @selector(eat));
    method_exchangeImplementations(run, eat);
    
    [p run];
    [p eat];
}

- (void)exchangeClassMethod {
    [Person run];
    [Person eat];
    
    Method run = class_getClassMethod([Person class], @selector(run));
    Method eat = class_getClassMethod([Person class], @selector(eat));
    method_exchangeImplementations(run, eat);
    
    [Person run];
    [Person eat];
}


@end
