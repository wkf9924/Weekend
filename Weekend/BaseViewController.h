//
//  BaseViewController.h
//  Weekend
//
//  Created by wkf on 14-5-6.
//  Copyright (c) 2014年 Wangkaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>


#define NumPlacholder -9999999


typedef enum {
    NavbtOpsitionLeft,
    NavbtOpsitionRight,
}NavbtOpsition;

@interface BaseViewController : UIViewController

-(UIBarButtonItem*)customLeftBackButton;
-(void)addNavBt:(NSString *)image select:(SEL)select opsition:(NavbtOpsition)opsition title:(NSString *)title;

@end
