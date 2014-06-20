//
//  MyVC.m
//  Weekend
//
//  Created by wkf on 14-4-21.
//  Copyright (c) 2014年 Wangkaifeng. All rights reserved.
//

#import "MyVC.h"
#import "Api.h"
#import "LoginVC.h"
#import "RegVC.h"
@interface MyVC ()
{

}

@property int num;
@property (weak, nonatomic) IBOutlet UIImageView *imagview;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;

- (IBAction)loginAction:(id)sender;

- (IBAction)regAction:(id)sender;

@end

@implementation MyVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _num = 0;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    
    _imagview.image = [UIImage imageNamed:@"0.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
//        CGPoint labelPosition = CGPointMake(self.swipeLabel.frame.origin.x - 320.0, self.swipeLabel.frame.origin.y);
//        
//        self.swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height);
//        
//        self.swipeLabel.text = @"尼玛的, 你在往左边跑啊....";
        
        _num++;
        if (_num >= 3) {
            _num = 3;
            return;
        }
//        else {
            CATransition *transition = [CATransition animation];
            transition.duration = 0.8;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionFade;
            [self.imagview.layer addAnimation:transition forKey:@"a"];
            self.imagview.image = [UIImage imageNamed:STRING_FORMAT(@"%d.jpg", _num)];
//        }

    }
    
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
//        CGPoint labelPosition = CGPointMake(self.swipeLabel.frame.origin.x + 320.0, self.swipeLabel.frame.origin.y);
//        
//        self.swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height);
//        
//        self.swipeLabel.text = @"尼玛的, 你在往右边跑啊....";
        _num --;
        if (_num < 0) {
            
            _num = 0;
            return;
        }
        CATransition *transition = [CATransition animation];
        transition.duration = 0.8;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        [self.imagview.layer addAnimation:transition forKey:@"a"];
       self.imagview.image = [UIImage imageNamed:STRING_FORMAT(@"%d.jpg", _num)];
        [UIView animateWithDuration:20 animations:^{
            NSLog(@"ADFAFADFADFS");
        }];
        
    }
    
}

- (IBAction)loginAction:(id)sender {
    
    LoginVC *login = [[LoginVC alloc] init];
    [self.navigationController pushViewController:login animated:YES];
    
}

- (IBAction)regAction:(id)sender {
    
    RegVC *reg = [[RegVC alloc] init];
    [self.navigationController pushViewController:reg animated:YES];
}
@end
