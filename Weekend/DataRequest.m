
//
//  DataRequest.m
//  Outdoor
//
//  Created by WangKaifeng on 14-3-27.
//  Copyright (c) 2014年 Robin. All rights reserved.
//

#import "DataRequest.h"
#import "ASIFormDataRequest.h"
#import "JSONFunction.h"
#import "Api.h"

@implementation DataRequest
@synthesize  pageNumber;

/**
 * collectionAddressType  传入的URL
 * searchType  没有定义
 * page 是否是第一页也就是用来标记是否是上拉和下拉刷新，如果page = 1 则就是下拉加载最新数据，否则是上拉加载更多数据
 **/
+(void)dataWithDic :(NSMutableDictionary *)dic andRequestType:(NSString *)requestType andRequestCollectionAddressType:(NSString *)collectionAddressType andRequestSearchType:(NSString *)searchType pageNum:(int)page andBlock:(void(^)(NSString *requestStr))block;{
    
    NSURL *url = [NSURL URLWithString:collectionAddressType];
    ASIFormDataRequest * request = [ASIFormDataRequest requestWithURL:url];
    request.tag = (page == 1) ? REQUEST_PAGE_ONE : REQUEST_PAGE_NEXT;
    
//    if ([requestType isEqualToString:@"POST"]){
//        for (NSString *key in [dic allKeys]) {
//            NSString *value=[dic objectForKey:key];
//            [request setPostValue:value forKey:key];
//        }
//    }
    
    NSString *jsonStr = [JSONFunction jsonStringWithNSDictionary:dic];
    [request setPostValue:jsonStr forKey:@"json"];
    [request setRequestMethod:requestType];
    [request setCompletionBlock:^{
        NSLog(@"Status：%d",request.responseStatusCode);
        NSString * string=[[NSString alloc]initWithData:request.responseData encoding:NSUTF8StringEncoding];
        block(string);
    }];
    
    [request setFailedBlock:^{
        block(@"失败");
    }];
    
    [request startAsynchronous];
}
+(NSMutableDictionary *)jsonValue :(NSString *)str{
    //json解析
    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}



//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
//    [dic setObject:@"1" forKey:@"newwindow"];
//    [dic setObject:@"strict" forKey:@"safe"];
//    [dic setObject:@"dongstone" forKey:@"q"];
//    [DataRequest dataWithDic:dic andRequestType:@"POST" andRequestCollectionAddressType:@"hk" andRequestSearchType:@"search" andBlock:^(NSString*requestStr) {
//        NSLog(@"%@",[DataRequest jsonValue:requestStr]);
//    }];
//}

@end
