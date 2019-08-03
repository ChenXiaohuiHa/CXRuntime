//
//  CXDynamicCreateCalss.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2019/8/3.
//  Copyright © 2019年 陈晓辉. All rights reserved.
//

#import "CXDynamicCreateCalss.h"
#import <objc/message.h>

@implementation CXDynamicCreateCalss

- (void)createClass {
    
    /// 创建了对象
    /*
     <#Class  _Nullable __unsafe_unretained superclass#> : 父类
     <#const char * _Nonnull name#> : 类名
     <#size_t extraBytes#> : 初始化大小
     */
    Class CXCat = objc_allocateClassPair([NSObject class], "CXCat",  0);
    
    /// 添加实例变量
    /*
     <#Class  _Nullable __unsafe_unretained cls#> : 所属类
     <#const char * _Nonnull name#> : 添加的变量名称
     <#size_t size#> : 字节大小
     <#uint8_t alignment#> :
     <#const char * _Nullable types#> : 参数类型
     */
    NSString *name = @"name";
    class_addIvar(CXCat, name.UTF8String, sizeof(id), log2(sizeof(id)), @encode(id));
    
    /// 添加方法
    /*
     <#Class  _Nullable __unsafe_unretained cls#> : 所属类
     <#SEL  _Nonnull name#> : 方法名称
     <#IMP  _Nonnull imp#> : 方法实现
     <#const char * _Nullable types#> : 方法参数类型
     */
    class_addMethod(CXCat, @selector(hunting), (IMP)hunting, "v@:");
    
    /// 注册类
    objc_registerClassPair(CXCat);
    
    /// 创建实例对象
    id cat = [[CXCat alloc] init];
    [cat setValue:@"Tom" forKey:@"name"];
    
    NSLog(@"name : %@", [cat valueForKey:@"name"]);
    
    /// 方法调用
    [cat performSelector:@selector(hunting)];
}

void hunting(id self, SEL _cmd) {
    NSLog(@"%s",__func__);
}

@end
