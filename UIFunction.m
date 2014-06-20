//
//  UIFunction.m
//  JieZuForIPhone
//
//  Created by Mars on 12-6-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIFunction.h"
#import "Api.h"
#import "AppDelegate.h"

#define SCREEN_HIGHT 480-44 +(iPhone5?88:0)

static BOOL isShowAlertView = NO;

static UIFunction *shareUIFunction = nil;
@implementation UIFunction
+ (UIFunction*) shareUIFunction{
    @synchronized(self){
        if (shareUIFunction == nil)
        {
            shareUIFunction = [[self alloc] init];
        }
    }
    return shareUIFunction;
}

+ (void) showAlertWithMessage:(NSString *)message{
    UIFunction *meaasgeFunction = [UIFunction shareUIFunction];
    [meaasgeFunction showAlertWithMessage:message];
}

- (void) showAlertWithMessage:(NSString *)message title:(NSString *)tit{

    if (!isShowAlertView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:tit message:message delegate:self cancelButtonTitle:LOCALIZED_STRING(@"OK") otherButtonTitles: nil];
            isShowAlertView = YES;
            [alert show];
        });
    }
}


+ (void) showAlertWithMessageCode:(int) errorCode ErrorDescription:(NSString *) description{
    
    NSString *promptString = [NSString stringWithFormat:LOCALIZED_STRING(@"SYSTEM_ERROR"),errorCode];;
    
    switch (errorCode) {
//        case 4001:
//        case 4002:
//        case 4003:
//        case ERROR_SYSEM_ERROR:
            break;
            
        default:
            promptString = description;
            break;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LOCALIZED_STRING(@"TITLE_JIEZU") message:promptString delegate:nil cancelButtonTitle:@"I Got It!" otherButtonTitles: nil];
        [alert show];
    });
}

/*
 Mars.luo Add custom tip box (image + string)
 */
+ (void)showAlertWithString:(NSString*)string Image:(UIImage*)image timeDuration:(int)duration {
	// get width and higthe for  the string which should darw
	UIFont *font = [UIFont systemFontOfSize:18];
	CGSize sizeString = [string sizeWithFont:font constrainedToSize:CGSizeMake(200,SCREEN_HIGHT) lineBreakMode:NSLineBreakByWordWrapping];
	float width = sizeString.width;
	float height = sizeString.height;
    
	// create the view should be shown, keep padding for 15px, keep the view in the center of screen
	UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake((320-width-15)/2.0, (SCREEN_HIGHT-height)/2.0-7.5, width+30, height+30)];
	
	UIImageView *imageView = nil;
	UILabel *label = nil;
	// is need to show image
	if (image != nil) {
		
		float imageWidth = CGImageGetWidth(image.CGImage)/2;
		float imageHeight = CGImageGetHeight(image.CGImage)/2;
		
		width = (width > imageWidth ? width : imageWidth) + 20;
		// keep 20px padding
		height = height +imageHeight+20;
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake( (width +30 - imageWidth)/2 , (height - imageHeight)/2 , imageWidth, imageHeight)];
		[imageView setImage:image];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake((width+15 - sizeString.width)/2, 30 + imageWidth, sizeString.width+15, sizeString.height+15)];
        alertView.frame = CGRectMake((320-width-15)/2.0, (SCREEN_HIGHT-height)/2.0-7.5, width+30, height+30);
	} 
	else 
	{
		//label = [[UILabel alloc] initWithFrame:CGRectMake((width +30 - s.width)/2, 30, s.width+15, s.height+15)];
		alertView.frame = CGRectMake((320 - 200)/2.0, (SCREEN_HIGHT-100)/2.0, 200, 100);
		label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
        
	}
	//set same Text attributes
	[label setTextAlignment:NSTextAlignmentCenter];
	[label setFont:font];
	[label setText:string];
	[label setTextColor:[UIColor whiteColor]];
	[label setBackgroundColor:[UIColor clearColor]];
	//no limit for number of line 
	label.numberOfLines = 0;
	[label setLineBreakMode:NSLineBreakByWordWrapping];
	
	[alertView setBackgroundColor:[UIColor blackColor]];
	// set the conrnr for view
	alertView.layer.cornerRadius = 7.5;
	alertView.layer.masksToBounds = YES;
	alertView.tag = ALERT_VIEW_TAG;
	alertView.alpha = 0.8;
    
	[alertView addSubview:label];
	if (imageView != nil) {
		[alertView addSubview:imageView];
	}
	
	//create the mask view for screen
	UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, SCREEN_HIGHT)];
	newView.backgroundColor = [UIColor clearColor];
	newView.tag = CONTANT_ALERT_VIEW_TAG;
    
	// get current window
	UIWindow *window = [[[UIApplication sharedApplication]windows] objectAtIndex:0];
	[newView addSubview:alertView];
	[window addSubview:newView];
	
	// beginAnimations
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:duration];
	[UIView setAnimationDelegate:self];
	
	// set the action when animation complete
	[UIView setAnimationDidStopSelector:@selector(removeMaskView)];
	alertView.alpha = 0.0;
	[UIView commitAnimations];
    
}

// remove the msak view 
+(void) removeMaskView{
	UIWindow *window = [[[UIApplication sharedApplication]windows] objectAtIndex:0];
	UIView *newView = nil;
	
	for (UIView *subView in [window subviews]) {
		if (subView.tag == CONTANT_ALERT_VIEW_TAG) {
			newView = subView;
			
			if (newView != nil) {
				
				[newView removeFromSuperview];
			}
//			break;
		}
	}
}

/*
 Mars.luo Add custom tip box (activity indicator view + string)
*/
+ (void)showWaitingAlertWithString:(NSString*)string {
	// get width and higthe for  the string which should darw
	UIFont *font = [UIFont systemFontOfSize:18];
	CGSize sizeString = [string sizeWithFont:font constrainedToSize:CGSizeMake(200,100) 
							   lineBreakMode:NSLineBreakByWordWrapping];
	float width = sizeString.width;
	float height = sizeString.height;
    
	// create the view should be shown, keep padding for 15px, keep the view in the center of screen
	UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake((320-width-40-30)/2.0, (SCREEN_HIGHT-height-80-30)/2.0, width+30+40, height+30+80)];
	
	UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] 
											  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[indicatorView setFrame:CGRectMake((alertView.frame.size.width - 37)/2, 35, 37, 37)];
	[indicatorView setHidesWhenStopped:YES];
	[indicatorView setHidden:NO];
	[indicatorView startAnimating];
	[alertView addSubview:indicatorView];
	//set label  keep padding for 15px, 60 is the height of UIActivityIndicatorView (UIActivityIndicatorView and blank space)
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((alertView.frame.size.width - 10 - width)/2.0, 20+60, width+20, height+20)];
	[label setFont:font];
	[label setTextAlignment:NSTextAlignmentCenter];
    
	//set same Text attributes
	[label setText:string];
	[label setTextColor:[UIColor whiteColor]];
	[label setBackgroundColor:[UIColor clearColor]];
	label.numberOfLines = 0;
	[label setLineBreakMode:NSLineBreakByWordWrapping];
	
	[alertView setBackgroundColor:[UIColor blackColor]];
	// set the conrnr for view
	alertView.layer.cornerRadius = 7.5;
	alertView.layer.masksToBounds = YES;
	alertView.tag = ALERT_VIEW_TAG;
	alertView.alpha = 0.8;
	[alertView addSubview:label];
	
	//create the mask view for screen
	UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, SCREEN_HIGHT)];
	newView.backgroundColor = [UIColor clearColor];
	newView.tag = CONTANT_ALERT_VIEW_TAG;
	
	// get current window
	UIWindow *window = [[[UIApplication sharedApplication]windows] objectAtIndex:0];
	[newView addSubview:alertView];
	[window addSubview:newView];
}

/*
 Mars.luo Add custom tip box (activity indicator view + string + button)
 */
+ (void)showWaitingAlertWithString:(NSString*)string WithTarget:(id)target action:(SEL)action Title:(NSString *)title{
	// get width and higthe for  the string which should darw
	UIFont *font = [UIFont systemFontOfSize:18];
	CGSize sizeString = [string sizeWithFont:font constrainedToSize:CGSizeMake(200,100) 
							   lineBreakMode:NSLineBreakByWordWrapping];
	float width = sizeString.width;
	float height = sizeString.height;
    
	// create the view should be shown, keep padding for 15px, keep the view in the center of screen
	UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake((320-width-40-30)/2.0, (SCREEN_HIGHT-height-80-30)/2.0, width+30+40, height+30+80 + 30 + 20)];
	
	UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] 
											  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[indicatorView setFrame:CGRectMake((alertView.frame.size.width - 37)/2, 35, 37, 37)];
	[indicatorView setHidesWhenStopped:YES];
	[indicatorView setHidden:NO];
	[indicatorView startAnimating];
	[alertView addSubview:indicatorView];
	//set label  keep padding for 15px, 60 is the height of UIActivityIndicatorView (UIActivityIndicatorView and blank space)
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((alertView.frame.size.width - 10 - width)/2.0, 20+60, width+20, height+20)];
	[label setFont:font];
	[label setTextAlignment:NSTextAlignmentCenter];
    
	//set same Text attributes
	[label setText:string];
	[label setTextColor:[UIColor whiteColor]];
	[label setBackgroundColor:[UIColor clearColor]];
	label.numberOfLines = 0;
	[label setLineBreakMode:NSLineBreakByWordWrapping];
	
	[alertView setBackgroundColor:[UIColor blackColor]];
	// set the conrnr for view
	alertView.layer.cornerRadius = 7.5;
	alertView.layer.masksToBounds = YES;
	alertView.tag = ALERT_VIEW_TAG;
	alertView.alpha = 0.8;
	[alertView addSubview:label];
	
    // create the button for action
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor whiteColor]];
    
    [button setFrame:CGRectMake((alertView.frame.size.width - 10 - button.frame.size.width)/2.0, label.frame.origin.y + label.frame.size.height + 10, button.frame.size.width, button.frame.size.height)];
    [alertView addSubview:button];
    
	//ceate mask view
	UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, SCREEN_HIGHT)];
	newView.backgroundColor = [UIColor clearColor];
	newView.tag = CONTANT_ALERT_VIEW_TAG;
	
	//get current window
	UIWindow *window = [[[UIApplication sharedApplication]windows] objectAtIndex:0];
	[newView addSubview:alertView];
	[window addSubview:newView];
}

+ (void) showLocalNotification:(NSString*) promptString WithSoundName:(NSString*) notiSoundName{
    UILocalNotification *alarm = [[UILocalNotification alloc] init];
    if (alarm) {
        
        alarm.fireDate = [NSDate date];
        alarm.timeZone = [NSTimeZone defaultTimeZone];
        alarm.repeatInterval = 0;
        if (notiSoundName) {
            alarm.soundName = notiSoundName;
        }else {
            alarm.soundName = @"ping.caf";
        }
        alarm.alertBody = promptString;
        
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:alarm];
    }
}

+ (UIImage *) resizeImageWithImage:(UIImage *) flagImage{
    CGRect resizeRect;
    
    resizeRect.size = flagImage.size;
    CGSize maxSize = CGSizeMake(40, 40);
    if (resizeRect.size.width > maxSize.width)
        resizeRect.size = CGSizeMake(maxSize.width, resizeRect.size.height / resizeRect.size.width * maxSize.width);
    if (resizeRect.size.height > maxSize.height)
        resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height, maxSize.height);
    
    resizeRect.origin = (CGPoint){0.0f, 0.0f};
    UIGraphicsBeginImageContext(resizeRect.size);
    [flagImage drawInRect:resizeRect];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}


/*
    Create Dispatch Timer 
 */
dispatch_source_t CreateDispatchTimer(uint64_t interval,
                                      uint64_t leeway,
                                      dispatch_queue_t queue,
                                      dispatch_block_t block)
{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                                     0, 0, queue);
    if (timer)
    {
        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval, leeway);
        dispatch_source_set_event_handler(timer, block);
        dispatch_resume(timer);
    }
    return timer;
}

+ (dispatch_source_t) CreateTimerWithDuration:(NSInteger) duration WithHandleBlock:(void (^)(id obj))handleBlock
{
    uint64_t interval = duration;
    dispatch_source_t aTimer = CreateDispatchTimer(interval * NSEC_PER_SEC,
                                                   1ull * NSEC_PER_SEC,
                                                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                                                   ^{ 
                                                       handleBlock(nil);
                                                   });
    // Store it somewhere for later use.
    if (aTimer)
    {
        return aTimer;
    }
    return nil;
}

+ (id)loadTableCellFromNib:(NSString*)nib {
	NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nib owner:nil options:nil];
	for (id currentObject in topLevelObjects) {
		if ([currentObject isKindOfClass:[UITableViewCell class]]) {
			return currentObject;
		}
	}
	return nil;
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    isShowAlertView = NO;
}


// 弹出模态警告框. 标题为sTitle, 内容为sContent, buttonList为按钮列表.
- (void) showAlertWithTitle:(NSString *)sTitle andMessage:(NSString *)sContent andButtonList:(NSArray *)buttonList alertTag:(NSInteger)tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:sTitle message:sContent delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    if (buttonList!=nil)
    {
        for (int i = 0; i < buttonList.count; ++i)
        {
            [alertView addButtonWithTitle:[buttonList objectAtIndex:i]];
        }
    }
    [alertView show];
    [alertView release];
}

/**
 
 * 功能:获取指定范围的字符串
 
 * 参数:字符串的开始小标
 
 * 参数:字符串的结束下标
 
 */


-(NSString *)getStringWithRange:(NSString *)str Value1:(NSUInteger *)value1 Value2:(NSUInteger )value2;

{
    
    return [str substringWithRange:NSMakeRange(value1,value2)];
    
}


/**
 
 * 功能:判断是否在地区码内
 
 * 参数:地区码
 
 */

-(BOOL)areaCode:(NSString *)code

{
    
    NSMutableDictionary *dic = [[[NSMutableDictionary alloc] init] autorelease];
    
    [dic setObject:@"北京" forKey:@"11"];
    
    [dic setObject:@"天津" forKey:@"12"];
    
    [dic setObject:@"河北" forKey:@"13"];
    
    [dic setObject:@"山西" forKey:@"14"];
    
    [dic setObject:@"内蒙古" forKey:@"15"];
    
    [dic setObject:@"辽宁" forKey:@"21"];
    
    [dic setObject:@"吉林" forKey:@"22"];
    
    [dic setObject:@"黑龙江" forKey:@"23"];
    
    [dic setObject:@"上海" forKey:@"31"];
    
    [dic setObject:@"江苏" forKey:@"32"];
    
    [dic setObject:@"浙江" forKey:@"33"];
    
    [dic setObject:@"安徽" forKey:@"34"];
    
    [dic setObject:@"福建" forKey:@"35"];
    
    [dic setObject:@"江西" forKey:@"36"];
    
    [dic setObject:@"山东" forKey:@"37"];
    
    [dic setObject:@"河南" forKey:@"41"];
    
    [dic setObject:@"湖北" forKey:@"42"];
    
    [dic setObject:@"湖南" forKey:@"43"];
    
    [dic setObject:@"广东" forKey:@"44"];
    
    [dic setObject:@"广西" forKey:@"45"];
    
    [dic setObject:@"海南" forKey:@"46"];
    
    [dic setObject:@"重庆" forKey:@"50"];
    
    [dic setObject:@"四川" forKey:@"51"];
    
    [dic setObject:@"贵州" forKey:@"52"];
    
    [dic setObject:@"云南" forKey:@"53"];
    
    [dic setObject:@"西藏" forKey:@"54"];
    
    [dic setObject:@"陕西" forKey:@"61"];
    
    [dic setObject:@"甘肃" forKey:@"62"];
    
    [dic setObject:@"青海" forKey:@"63"];
    
    [dic setObject:@"宁夏" forKey:@"64"];
    
    [dic setObject:@"新疆" forKey:@"65"];
    
    [dic setObject:@"台湾" forKey:@"71"];
    
    [dic setObject:@"香港" forKey:@"81"];
    
    [dic setObject:@"澳门" forKey:@"82"];
    
    [dic setObject:@"国外" forKey:@"91"];
    
    if ([dic objectForKey:code] == nil) {
        
        return NO;
        
    }
    
    return YES;
    
}


/**
 
 * 功能:验证身份证是否合法
 
 * 参数:输入的身份证号
 
 */

-(BOOL) chk18PaperId:(NSString *) sPaperId

{
    
    //判断位数
    
    if ([sPaperId length] != 15 && [sPaperId length] != 18) {
        
        return NO;
        
    }
    
    NSString *carid = sPaperId;
    
    long lSumQT =0;
    
    //加权因子
    
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    
    //校验码
    
    unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    
    
    //将15位身份证号转换成18位
    
    NSMutableString *mString = [NSMutableString stringWithString:sPaperId];
    
    if ([sPaperId length] == 15) {
        
        [mString insertString:@"19" atIndex:6];
        
        long p = 0;
        
        const char *pid = [mString UTF8String];
        
        for (int i=0; i<=16; i++)
            
        {
            
            p += (pid[i]-48) * R[i];
            
        }
        
        int o = p%11;
        
        NSString *string_content = [NSString stringWithFormat:@"%c",sChecker[o]];
        
        [mString insertString:string_content atIndex:[mString length]];
        
        carid = mString;
        
    }
    
    //判断地区码
    
    NSString * sProvince = [carid substringToIndex:2];
    
    if (![self areaCode:sProvince]) {
        
        return NO;
        
    }
    
    //判断年月日是否有效
    
    
    //年份
    
    int strYear = [[self getStringWithRange:carid Value1:6 Value2:4] intValue];
    
    //月份
    
    int strMonth = [[self getStringWithRange:carid Value1:10 Value2:2] intValue];
    
    //日
    
    int strDay = [[self getStringWithRange:carid Value1:12 Value2:2] intValue];
    
    
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]  autorelease];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dateFormatter setTimeZone:localZone];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date=[dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",strYear,strMonth,strDay]];
    
    if (date == nil) {
        
        return NO;
        
    }
    
    const char *PaperId  = [carid UTF8String];
    
    //检验长度
    
    if( 18 != strlen(PaperId)) return -1;
    
    
    //校验数字
    
    for (int i=0; i<18; i++)
        
    {
        
        if ( !isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i) )
            
        {
            
            return NO;
            
        }
        
    }
    
    //验证最末的校验码
    
    for (int i=0; i<=16; i++)
        
    {
        
        lSumQT += (PaperId[i]-48) * R[i];
        
    }
    
    if (sChecker[lSumQT%11] != PaperId[17] )
        
    {
        
        return NO;
        
    }
    
    return YES;
    
}

@end
