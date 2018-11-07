//
//  NSString+AddProperty.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/5.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "NSString+AddProperty.h"
#import <objc/message.h>
@implementation NSString (AddProperty)

static char *nameKey = "nameKey";

- (void)setName:(NSString *)name {
    
    /*
     参数:
     id  _Nonnull object           :给那个对象的属性赋值
     const void * _Nonnull key     :属性对应的 key
     id  _Nullable value           :设置属性值
     objc_AssociationPolicy policy :使用的策略, 枚举值, 对应 copy,retain, assign 和 nonatomic
     */
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    
    /*
     id  _Nonnull object
     const void * _Nonnull key
     */
    return objc_getAssociatedObject(self, &nameKey);
}

@end
