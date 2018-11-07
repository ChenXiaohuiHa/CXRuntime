//
//  Cat.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/5.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "Cat.h"
#import "CXPerson.h"
@implementation Cat

/*
 如果经过备用接收者也不能处理此消息, runtime 将会启用 完整的消息转发机制;
 首先会发送 -methodSignatureForSelector: 消息, 获得函数的参数和返回值类型,
 如果 -methodSignatureForSelector: 返回 nil, runtime 则会发出 -doesNorRecognizeSelector: 消息, 程序这时也就挂掉了,
 如果返回了一个函数签名, runtime 就会创建一个 NSInvocation 对象并发送 -forwardInvocation: 消息给目标对象;
 */


//1.当这个类被外界调用了一个没有实现的 类 方法时, 进入这里
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    //返回YES，进入下一步转发
    return [super resolveInstanceMethod:sel];
}
//2.当动态方法解析失败后, 进入此方法, 设置备用接收者
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    //返回nil，进入下一步转发
    return nil;
}
//3. 当没找到备用接收者时, 进入最后拯救机会, 完整消息转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"eat"]) {
        
        //签名，进入forwardInvocation
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}
//将 CXPerson 作为消息目标对象, 重新发送一次消息
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = anInvocation.selector;
    
    CXPerson *p = [CXPerson new];
    if([p respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:p];
    }else {
        
        //如果 CXPerson 没有此方法, 则会报错:unrecognized selector
        [self doesNotRecognizeSelector:sel];
    }
}

@end
