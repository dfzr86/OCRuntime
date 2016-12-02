//
//  UIImage+Extension.m
//  changeMethod
//
//  Created by __zimu on 16/7/29.
//  Copyright © 2016年 __zimu. All rights reserved.
//

#import "UIImage+Extension.h"
#import <objc/runtime.h>

void *associatedKey = "associatedKey";

@implementation UIImage (Extension)

#pragma mark - 关联对象
- (NSString *)name {
    return objc_getAssociatedObject(self, associatedKey);
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, associatedKey, name, OBJC_ASSOCIATION_COPY);
}


#pragma mark - 拦截系统方法
/// 让交换的方法只执行一次
+ (void)load {
    Method systemMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
//    Method systemMethod = class_getInstanceMethod([UIImage class], @selector(imageNamed:));
    Method customMethod = class_getClassMethod([UIImage class], @selector(hx_imageNamed:));
//    Method customMethod = class_getInstanceMethod([UIImage class], @selector(hx_imageNamed:));
    method_exchangeImplementations(systemMethod, customMethod);
}

+ (UIImage *)hx_imageNamed:(NSString *)name {
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 7.0) {
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
        name = [name stringByAppendingString:@"_os7"];
    }
    return [UIImage hx_imageNamed:name];
}

@end
