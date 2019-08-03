//
//  AnimalModel.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/5.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "AnimalModel.h"
#import <objc/message.h>

@implementation AnimalModel

//告诉系统要归档那些属性
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //利用runtime 归档
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //归档 KVC 根据一个 key 来获得一个值
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    //注意: C 语言里, 但凡出现 copy create new 就需要释放
    free(ivars);
}
//告诉系统要解档那些属性
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        //解档
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            //解档
            id value = [aDecoder decodeObjectForKey:key];
            //KVC 设置值
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

@end
