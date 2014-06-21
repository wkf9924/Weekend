//
//  LoginVC.m
//  Weekend
//
//  Created by wkf on 14-5-6.
//  Copyright (c) 2014年 Wangkaifeng. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIImageView *imageLineBg;
@property (weak, nonatomic) IBOutlet UIImageView *imagePwdBg;

@end

@implementation LoginVC

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
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self addNavBt:@"back" select:@selector(checkState) opsition:NavbtOpsitionLeft title:@""];
    
    //    [super customLeftBackButton];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkState {
    [self.navigationController popViewControllerAnimated:YES];
}


-(UIBarButtonItem*)customLeftBackButton{
    
    UIImage *image = PNGIMAGE(@"back");

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


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == _usernameTF) {
        [_imageLineBg setImage:PNGIMAGE(@"txt_hover")];
        [_imagePwdBg setImage:PNGIMAGE(@"zc_txt_normal_s")];
    }
    
    if (textField == _passwordTF) {
        [_imageLineBg setImage:PNGIMAGE(@"zc_txt_normal_s")];
        [_imagePwdBg setImage:PNGIMAGE(@"txt_hover")];
    }
    
}


@end
