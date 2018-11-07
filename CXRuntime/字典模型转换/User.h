//
//  User.h
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/7.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, strong) NSString *uid;

@end

NS_ASSUME_NONNULL_END
