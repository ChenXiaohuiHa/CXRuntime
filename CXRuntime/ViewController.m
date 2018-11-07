//
//  ViewController.m
//  CXRuntime
//
//  Created by 陈晓辉 on 2018/11/1.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>


#import "CXPerson.h"
#import "Dog.h"
#import "Cat.h"

#import "NSString+AddProperty.h"
#import "AnimalModel.h"
#import "Movie.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     #pragma mark ---------- 消息发送 ----------
//    objc_msgSend(self, @selector(drink));
//   [self performSelector:@selector(run) withObject:nil];
    
    
    #pragma mark ---------- 消息转发 ----------
//    [self forwardMethodOne];
    
//    [self forwardMethodTwo];
    
//    [self forwardMethodThree];
    
    #pragma mark ---------- 类别添加属性 ----------
//    [self addProperty];
    
#pragma mark ---------- 类别方法交换 ----------
//    [self exchangeMethod];
    
    #pragma mark ---------- 自动归结档 ----------
//    [self encodeAndCoder];
    
    #pragma mark ---------- 字典模型转换 ----------
//    [self dicToModel];
}
#pragma mark ---------- 消息发送 ----------
- (void)drink {
    NSLog(@"喝水");
}
- (void)run {
    NSLog(@"跑路");
}

#pragma mark ---------- 消息转发 ----------
//动态添加方法 : 懒加载方法

//MARK: 动态方法解析
- (void)forwardMethodOne {
    
    CXPerson *p = [CXPerson new];
    objc_msgSend(p, @selector(eat));
}

//MARK: 备用接收者
- (void)forwardMethodTwo {
    
    Dog *d = [Dog new];
    [d performSelector:@selector(eat) withObject:nil];
}

//MARK: 完整消息转发
- (void)forwardMethodThree {
    
    Cat *c = [Cat new];
    [c performSelector:@selector(eat) withObject:nil];
}


#pragma mark ---------- 类别添加属性 ----------
- (void)addProperty {
    
    NSString *str = [[NSString alloc] init];
    str.name = @"name";
}

#pragma mark ---------- 类别方法交换 ----------
- (void)exchangeMethod {
    
    //对 URL 进行中文编码, 并去除 空格
    NSURL *url = [NSURL URLWithString:@"http://osg-omgmt0005/member/c9/ f12我"];
    
    if (!url) {
        NSLog(@"URL 格式不正确");
    }
    
    
    //动态适配文字大小
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
    label.text = @"珂朵莉·诺塔·瑟尼欧里斯是动画《末日时在做什么？有没有空？可以来拯救吗？》中的女主角，五位成体妖精兵之一。最强圣剑“瑟尼欧里斯”的适合者";
    label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
}

#pragma mark ---------- 自动归结档 ----------
- (void)encodeAndCoder {
    
    AnimalModel *model = [AnimalModel new];
    model.dog = @"啸天狗";
    model.cat = @"汤姆喵";
    model.man = @"大猪蹄子";
    
    NSString *document  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [document stringByAppendingString:@"/animalModel.txt"];
    
    //模型写入文件
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
    
    
    //读取
    AnimalModel *movie =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"----%@, %@, %@",movie.dog,model.cat,model.man);
}

#pragma mark ---------- 字典模型转换 ----------
- (void)dicToModel {
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSDictionary *user = @{ @"name":@"zhangsan",
                            @"age": @(12),
                            @"sex": @"man",
                            };
    
    NSDictionary *dict = @{ @"movieId":@"28678",
                            @"movieName": @"539fU8276",
                            @"pic_url": @"fsdfds",
                            @"user" : user
                            };
    
    
    NSArray *addarr = @[dict ,dict, dict];
    
    NSMutableDictionary *mudict = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    
    [mudict setObject:user forKey:@"user"];
    
    for (NSDictionary *item in addarr) {
        
        
        //这种事系统自带的方式
//        Movie *info = [Movie new];
//        [info setValuesForKeysWithDictionary:item];
        
        Movie *info = [Movie objectWithDict:item];
        [array addObject:info];
    }
    
    
    NSLog(@"----%@", array);
}

@end
