//
//  Util.m
//  MYWowGoing
//
//  Created by duyingfeng on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Util.h"
#import "LXF_OpenUDID.h"
#define LOGIN_TOKEN @"TOKEN"
static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation Util


+(NSString*)getDeviceId
{
    return (NSString*)[[NSUserDefaults standardUserDefaults] objectForKey:@"DeviceId"];
}

#pragma mark ---------- 获取MAC地址
+(void)setDefauts
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Defauts"] == NO) {
        NSLog(@"程序每一次启动");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Defauts"];
        NSString *deviceId = [LXF_OpenUDID value];
        NSLog(@"opngudid== %@",deviceId);
        [[NSUserDefaults standardUserDefaults] setObject:deviceId forKey:@"DeviceId"];
    }
}


+ (BOOL)isLogin
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"] == YES) {
        return YES;
    }
    else{
        return NO;
    }
}

//保存登录状态
+ (void)setLogin:(NSDictionary *)dic {
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)setLoginOk{
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
     [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSDictionary *)getLoginData {
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return dic;
}
//取消登录
+ (void)cancelLogin {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)saveToken: (NSString *)stringToken {
    [[NSUserDefaults standardUserDefaults] setObject:stringToken forKey:LOGIN_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getToken {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey: LOGIN_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return token;
}

+ (void)delToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:LOGIN_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


//base64加密
+(NSString *)base64Encoding:(NSData*) text
{
    if (text.length == 0)
        return @"";
    char *characters = malloc(text.length*3/2);
    if (characters == NULL)
        return @"";
    int end = text.length - 3;
    int index = 0;
    int charCount = 0;
    int n = 0;
    while (index <= end) {
        int d = (((int)(((char *)[text bytes])[index]) & 0x0ff) << 16)
        | (((int)(((char *)[text bytes])[index + 1]) & 0x0ff) << 8)
        | ((int)(((char *)[text bytes])[index + 2]) & 0x0ff);
        characters[charCount++] = encodingTable[(d >> 18) & 63];
        characters[charCount++] = encodingTable[(d >> 12) & 63];
        characters[charCount++] = encodingTable[(d >> 6) & 63];
        characters[charCount++] = encodingTable[d & 63];
        index += 3;
        if(n++ >= 14)
        {
            n = 0;
            //characters[charCount++] = ' ';
        }
    }
    if(index == text.length - 2)
    {
        int d = (((int)(((char *)[text bytes])[index]) & 0x0ff) << 16)
        | (((int)(((char *)[text bytes])[index + 1]) & 255) << 8);
        characters[charCount++] = encodingTable[(d >> 18) & 63];
        characters[charCount++] = encodingTable[(d >> 12) & 63];
        characters[charCount++] = encodingTable[(d >> 6) & 63];
        characters[charCount++] = '=';
    }
    else if(index == text.length - 1)
    {
        int d = ((int)(((char *)[text bytes])[index]) & 0x0ff) << 16;
        characters[charCount++] = encodingTable[(d >> 18) & 63];
        characters[charCount++] = encodingTable[(d >> 12) & 63];
        characters[charCount++] = '=';
        characters[charCount++] = '=';
    }
    NSString * rtnStr = [[NSString alloc] initWithBytesNoCopy:characters length:charCount encoding:NSUTF8StringEncoding freeWhenDone:YES];
    return rtnStr;
}


#pragma mark - 身份证识别
+(BOOL)checkIdentityCardNo:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}





@end
