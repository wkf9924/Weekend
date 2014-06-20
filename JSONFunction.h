//
//  JsonFunction.h
//  eDiancheDriver
//
//  Created by Mars on 13-6-24.
//  Copyright (c) 2013年 SKTLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONFunction : NSObject

// Utillity function
+ (NSData *) jsonDateWithNSDictionary:(NSDictionary *)dict;
+ (id) jsonObjectWithData:(NSData *) data;

+ (NSString *) jsonStringWithNSDictionary:(NSDictionary *) dict;
+ (id) jsonObjectWithNSString:(NSString *) jsonString;

@end
