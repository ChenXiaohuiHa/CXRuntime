//
//  User.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/7.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)description {
    return [NSString stringWithFormat:@"%@--%@--%@--", _name, _age, _sex];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.uid = value;
    }
}

@end
