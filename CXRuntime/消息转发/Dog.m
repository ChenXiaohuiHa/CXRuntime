//
//  Dog.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/4.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "Dog.h"
#import "CXPerson.h"
@implementation Dog

/*
 如果目标对象实现了-forwardingTargetForSelector:，
 Runtime 这时就会调用这个方法，给你把这个消息转发给其他对象的机会。
 */



//1.当这个类被外界调用了一个没有实现的 对象 方法时, 进入这里
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    return [super resolveInstanceMethod:sel];
}
//2.当动态方法解析失败后, 进入此方法, 设置备用接收者
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(eat)) {
        
        //返回 CXPerson 对象，让 CXPerson 对象接收这个消息
        return [CXPerson new];
    }
    
    return [super forwardingTargetForSelector:aSelector];
}



@end
