//
//  UIFont+Addtion.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/7.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "UIFont+Addtion.h"

#define kSwidth [UIScreen mainScreen].bounds.size.width
@implementation UIFont (Addtion)

+ (void)load {
    
    //获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    //获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    //交换方法
    method_exchangeImplementations(method, newMethod);
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    
    UIFont *newFont=nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/kSwidth];
    return newFont;
}

@end
