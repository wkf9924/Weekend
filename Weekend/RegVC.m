//
//  RegVC.m
//  Weekend
//
//  Created by wkf on 14-5-6.
//  Copyright (c) 2014年 Wangkaifeng. All rights reserved.
//

#import "RegVC.h"

@interface RegVC ()

@end

@implementation RegVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self addNavBt:@"back" select:@selector(back) opsition:NavbtOpsitionLeft title:@""];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
