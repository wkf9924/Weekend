//
//  BaseViewController.m
//  Weekend
//
//  Created by wkf on 14-5-6.
//  Copyright (c) 2014年 Wangkaifeng. All rights reserved.
//

#import "BaseViewController.h"
#import "Api.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIBarButtonItem*)customLeftBackButton{
    
    UIImage *image = PNGIMAGE(@"back.png");
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return backItem;
    
}

- (void)popself {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)addNavBt:(NSString *)image select:(SEL)select opsition:(NavbtOpsition)opsition title:(NSString *)title{
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (opsition == NavbtOpsitionLeft) {
        backButton.frame = CGRectMake(0.0, 0.0, 16.0, 25.0);
    }else{
        float x = self.navigationController.navigationBar.frame.size.width-40;
        backButton.frame = CGRectMake(x, 0.0, 16.0, 25.0);
    }
    
    
    if (title) {
        backButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [backButton setTitle:title forState:0];
        [backButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }else{
        [backButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    
    [backButton addTarget:self action:select forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
    
    if (opsition == NavbtOpsitionLeft) {
        self.navigationItem.leftBarButtonItem=temporaryBarButtonItem;
    }else{
        self.navigationItem.rightBarButtonItem=temporaryBarButtonItem;
    }
}


@end
