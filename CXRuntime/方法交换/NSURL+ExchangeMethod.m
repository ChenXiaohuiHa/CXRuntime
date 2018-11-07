//
//  NSURL+ExchangeMethod.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/5.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "NSURL+ExchangeMethod.h"
#import <objc/message.h>
@implementation NSURL (ExchangeMethod)


/**
 当类加载进内存的时候调用，而且不管有没有子类，都只会调用一次，在main函数之前调用，
 用途：1：可以新建类在该类中实现一些配置信息
      2：runtime交换方法的时候，因为只需要交换一次方法，所有可以在该方法中实现交换方法的代码，用于只实现一次的代码
 */
+ (void)load {
    
    /*
     参数:
     Class  _Nullable __unsafe_unretained cls : 获取哪个类的方法
     SEL  _Nonnull name : 获取哪个方法
     */
    Method oldMethod = class_getClassMethod(self, @selector(URLWithString:));
    Method newMethod = class_getClassMethod(self, @selector(cx_URLWithString:));
    
    
    method_exchangeImplementations(oldMethod, newMethod);
}

/** 去除 URL 中的空格和对中文进行编码 */
+ (nullable instancetype)cx_URLWithString:(NSString *)URLString {
    
    
    if (URLString && [URLString hasPrefix:@"http"]) {
        
        //URL 去空格
        [URLString stringByReplacingOccurrencesOfString:@" " withString:@""];
        //URL 中文转义
        URLString = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        return [self cx_URLWithString:URLString];
    }
    
    return nil;
}




#pragma mark ---------- 其他 ----------
// 在分类中,最好不要重写系统方法,一旦重写,把系统方法实现给干掉, 因为分类中的方法优先级更高
//因为分类不是继承父类，而是继承NSObject，super没有改类的方法，所以就直接覆盖掉了父类的行为


/*
 当类被初始化的时候调用，可能会被调用多次，若是没有子类，则只会调用一次，若是有子类的话，该方法会被调用多次，若是子类的继承关系，先会调用父类的+ (void)initialize方法，然后再去调用子类的+ (void)initialize方法(若是继承关系，调用某个方法的时候，先会去父类中查找，若是父类中没有方法的实现就去子类中查找)
 用途：1：在设置导航栏的全局背景的时候，只需要设置一次，可以重写该方法设置，最好是在该方法判断子类，若是自己，则实现设置全局导航栏的方法，若不是自己则跳过实现。
      2：在创建数据库代码的时候，可以在该方法中去创建，保证只初始化一次数据库实例，也可以用dispatch或是懒加载的方法中初始化数据库实例，也能保证只初始化一次数据库实例。其中也可以在+ (void)initialize方法中用dispatch也能保证即使有子类也只会初始化一次
 */
// 会调用多次
//+ (void)initialize {
//
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    });
//
//}

@end
