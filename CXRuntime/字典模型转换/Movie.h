//
//  Movie.h
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/7.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+Extension.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject<CXModelDelegate>

@property (nonatomic, strong) User * user;
@property (nonatomic, copy) NSString *movieId;
@property (nonatomic, copy) NSString *movieName;
@property (nonatomic, copy) NSString *pic_url;

@end

NS_ASSUME_NONNULL_END
