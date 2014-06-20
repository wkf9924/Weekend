//
//  Single.m
//  StudyiOS
//
//  Created by  on 11-10-28.
//  Copyright (c) 2011年 ZhangYiCheng. All rights reserved.
//

#import "Single.h"
#import "Api.h"
#import <QuartzCore/QuartzCore.h>
#define kDuration 0.5   // 动画持续时间(秒)
@implementation Single
+ (Single *)sharedManager {
    static Single *sharedSingle = nil;
    
    static dispatch_once_t predicate; dispatch_once(&predicate, ^{
        sharedSingle = [[self alloc] init];
    });
    
    return sharedSingle;
    
}



//移动
- (CATransition *)moveAnim:(int)tag typeid: (int)typeID  view:(UIView *)currentView
{
    //    CATransition *animation = [CATransition animation];
    //    animation.delegate = self;
    //    animation.duration = 1.5f;
    //    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.type = kCATransitionPush;
    //    animation.subtype = kCATransitionFromRight;
    //    return animation;
    
    // 使用Core Animation创建动画
    
    // 创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    animation.delegate = self;
    // 设定动画时间
    animation.duration = kDuration;
    // 设定动画快慢(开始与结束时较慢)
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    int tag = 102;
    // 12种类型
    switch (tag) {
        case 101:
            // 设定动画类型
            // kCATransitionFade 淡化
            // kCATransitionPush 推挤
            // kCATransitionReveal 揭开
            // kCATransitionMoveIn 覆盖
            // @"cube" 立方体
            // @"suckEffect" 吸收
            // @"oglFlip" 翻转
            // @"rippleEffect" 波纹
            // @"pageCurl" 翻页
            // @"pageUnCurl" 反翻页
            // @"cameraIrisHollowOpen" 镜头开
            // @"cameraIrisHollowClose" 镜头关
            animation.type = kCATransitionFade;
            break;
        case 102:
            animation.type = kCATransitionPush;
            break;
        case 103:
            animation.type = kCATransitionReveal;
            break;
        case 104:
            animation.type = kCATransitionMoveIn;
            break;
        case 201:
            animation.type = @"cube";
            break;
        case 202:
            animation.type = @"suckEffect";
            break;
        case 203:
            animation.type = @"oglFlip";
            break;
        case 204:
            animation.type = @"rippleEffect";
            break;
        case 205:
            animation.type = @"pageCurl";
            break;
        case 206:
            animation.type = @"pageUnCurl";
            break;
        case 207:
            animation.type = @"cameraIrisHollowOpen";
            break;
        case 208:
            animation.type = @"cameraIrisHollowClose";
            break;
        default:
            break;
    }
    // 四个方向
    //    int typeID = 3;
    switch (typeID) {
        case 0:
            // 设定动画方向
            animation.subtype = kCATransitionFromLeft;
            break;
        case 1:
            animation.subtype = kCATransitionFromBottom;
            break;
        case 2:
            animation.subtype = kCATransitionFromRight;
            break;
        case 3:
            animation.subtype = kCATransitionFromTop;
            break;
        default:
            break;
    }
    
    // 动画开始
    [[currentView layer] addAnimation:animation forKey:@"animation"];
    return animation;
    
}


- (NSString *)getPlistPath
{
    // 获取应用程序沙盒的Documents目录
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * plistPath2 = [paths objectAtIndex:0];
    
    // 得到完整的文件名
    NSString * fileName = [plistPath2 stringByAppendingPathComponent:@"NearData.plist"];
    return fileName;
}

- (void)writeNearDataToPlistWith:(NSDictionary *)fileData
{
    [fileData writeToFile:[self getPlistPath] atomically:YES];
}

- (NSDictionary *)readNearDataFormPlist
{
    NSDictionary * data = [[NSDictionary alloc] initWithContentsOfFile:[self getPlistPath]];
    return data;
}


- (void)userDefault:(id)s Key:(NSString *)str {
    [[NSUserDefaults standardUserDefaults] setObject:s forKey:str];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)getUserDefault:(id)s {
    [[NSUserDefaults standardUserDefaults] objectForKey:s];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




@end
