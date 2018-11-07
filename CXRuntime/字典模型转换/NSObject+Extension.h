//
//  NSObject+Extension.h
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/6.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CXModelDelegate <NSObject>

@optional
// 提供一个协议，只要准备这个协议的类，都能把数组中的字典转模型
//用在三级数组转换
+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (Extension)

// 字典转模型
+ (instancetype)objectWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
