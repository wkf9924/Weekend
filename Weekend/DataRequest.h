//
//  DataRequest.h
//  Outdoor
//
//  Created by WangKaifeng on 14-3-27.
//  Copyright (c) 2014年 Robin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataRequest : NSObject

+(void)dataWithDic :(NSMutableDictionary *)dic andRequestType:(NSString *)requestType andRequestCollectionAddressType:(NSString *)collectionAddressType andRequestSearchType:(NSString *)searchType pageNum:(int)page andBlock:(void(^)(NSString *requestStr))block;
+(NSMutableDictionary *)jsonValue :(NSString *)str;
@property (assign) int pageNumber;
@end
