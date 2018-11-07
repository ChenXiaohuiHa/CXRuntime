//
//  AnimalModel.h
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/5.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 自动归结档
 */

NS_ASSUME_NONNULL_BEGIN

@interface AnimalModel : NSObject<NSCoding>

/** dog */
@property (nonatomic, copy) NSString *dog;
/** cat */
@property (nonatomic, copy) NSString *cat;
/** man */
@property (nonatomic, copy) NSString *man;

@end

NS_ASSUME_NONNULL_END
