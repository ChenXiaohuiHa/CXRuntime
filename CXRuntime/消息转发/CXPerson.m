//
//  CXPerson.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/1.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "CXPerson.h"
#import <objc/message.h>
@implementation CXPerson

/*
 动态添加方法
 首先，Objective-C运行时会调用 +resolveInstanceMethod:或者 +resolveClassMethod:，让你有机会提供一个函数实现。
 如果你添加了函数并返回YES， 那运行时系统就会重新启动一次消息发送的过程
 */

#pragma mark ---------- 处理对象方法 ----------
//1.当这个类被外界调用了一个没有实现的 对象 方法时, 进入这里
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSLog(@"没有实现 对象 方法: %@",NSStringFromSelector(sel));
    
    if (sel == @selector(eat)) {
        
        /*
         1. cls:   类 类型
         2. SEL:   方法编号
         3. IMP:   方法实现 (函数指针), 告诉方法执行这个函数
         4. types: 函数类型 C 字符串(代码), 表示将要添加的方法(eat 方法)的类型
         */
        class_addMethod([CXPerson class], sel, (IMP)eat, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}


/*
 id self, SEL _cmd
 所有的函数都有这两个隐式 参数
 */
void eat(id self, SEL _cmd) {
    
    NSLog(@"调用了 %@ 对象 的 %@ 方法",self,NSStringFromSelector(_cmd));
}


#pragma mark ---------- 处理类方法 ----------
//当这个类被外界调用了一个没有实现的 类 方法时, 进入这里
+ (BOOL)resolveClassMethod:(SEL)sel {
    
    NSLog(@"没有实现 类 方法: %@",NSStringFromSelector(sel));
    
    return [super resolveClassMethod:sel];
}








@end
