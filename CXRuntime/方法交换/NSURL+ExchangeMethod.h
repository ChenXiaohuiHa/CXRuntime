//
//  NSURL+ExchangeMethod.h
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/5.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 交换方法
 */

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (ExchangeMethod)

/** 去除 URL 中的空格和对中文进行编码 */
+ (nullable instancetype)cx_URLWithString:(NSString *)URLString;

@end

NS_ASSUME_NONNULL_END
