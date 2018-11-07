//
//  Movie.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/7.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (NSString *)description {
    return [NSString stringWithFormat:@"%@--%@--%@--%@", _movieName, _movieId, _pic_url, _user];
}


//如果用系统的方法字典转模型，一定要实现这个方法
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//
//}

@end
