//
//  Util.h
//  MYWowGoing
//
//  Created by duyingfeng on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

//获得唯一标示
+(NSString*)getDeviceId;

//设置唯一标示
+(void)setDefauts;

//是否登录
+ (BOOL)isLogin;

//保存登录状态
+ (void)setLogin:(NSDictionary *)dic;

//判断是否登录
+ (void)setLoginOk;

//得到登录的数据
+ (NSDictionary *)getLoginData;

//取消登录
+ (void)cancelLogin;

//保存token
+ (void)saveToken: (NSString *)stringToken;

//获取token
+ (NSString *)getToken;

//删除token
+ (void)delToken;

+(BOOL)checkIdentityCardNo:(NSString*)cardNo;


@end
