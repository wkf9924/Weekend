//
//  Api.h
//  MyApi
//
//  Created by wkf on 12-12-28.
//
//


#ifndef MyApi

#define MyApi
#import "AppDelegate.h"
#import "BaseViewController.h"
//分享按钮的tag
#define BAR_SHARE_TAG        1000

#define DDMENUCONTROLLER_APPDELEGETE  DDMenuController *menuController = (DDMenuController*)((AppDelegate*)[[UIApplication sharedApplication] delegate]).menuController;


//alert
#define LOCALIZED_STRING(string) NSLocalizedString(string, nil)
#define LOADING_STRING @"网络不稳定！请重试"

//提示消息
#define ALERT_DATA [[iToast makeToast:LOADING_STRING] show];

#define XMPP_SERVER               @"xinhuwai.com"
#define XMPP_HOST_PORT            7082
//#define XMPP_SERVER             @"192.168.1.105"
//#define XMPP_HOST_PORT          5222

#define XMPP_JID                @"@xinhuwai"
#define XMPP_PASSWORD           @"123456"

#define REQUEST_POST            @"POST"
#define REQUEST_GET             @"GET"
#define LOGIN_SUCDESS           @"LOGIN"  //处理登录成功后的 专门为修改个人资料使用

//#define SERVER                  @"http://192.168.1.105:8080/NewOutdoorServer"
#define SERVER                @"http://113.200.215.157:10001/tianxun-esb/apiex.htm"
//
//#define SERVER                @"http://192.168.1.2:8080/NewOutdoorServer"

#define IMAGE_ACTIVITY          @"http://bbs.xinhuwai.com/data/attachmentv1/forum/"

#define USER_GETMEMBERDETAIL    @"User/getMemberDetail"

/**
 *  支付
 */
#define SUBMIT_DO               @"Order/SubmitOrder.do"

/**
 *  登出
 */
#define USER_LOGOUT             @"User/logout"

//注册
#define REGISTER_USER           @"User/UserRegister"

//登录
#define USER_LOGIN              @"User/UserLogin"

//获取活动分类
#define ACTIVITY_GET            @"Activity/GetAllActivity"

//活动详情
#define ACTIVITY_DETAIL         @"Activity/GetActivityDetails"

//添加收藏
#define ADD_FAVORITE            @"Activity/FavoriteActivity"

//收藏列表
#define ACTIVITY_FAVORITE_LIST  @"Activity/GetCurrentUserFavoritedActivities"

//搜索分类
#define ACTIVITY_CAGETORY       @"Activity/GetHotActivityCategory"

//提交反馈
#define SUMMIT_FEEDBACK         @"User/summitFeedback"

//条件查询
#define ACTIVITY_SEARCH         @"Activity/GetActivitiesBySearchCondition"

//修改密码
#define UPDATE_PASSWORD         @"User/updatePassword"

//获取用户发布的活动
#define GETUSER_ACTIVITY        @"Activity/GetCurrentUserPubActivities"

//购物车
#define SHOPPINGCARD            @"Order/orderList"

//用户活动记录
#define ACTIVITY_HISTORY_CURRENT @"Activity/GetActivityHistoryByCurrentUser"

//报名活动的接口 参与活动
#define ACTIVITY_CURRENT_USER    @"Activity/GetActivitiesByCurrentUser"

//用户报名
#define APPLEY_USER             @"Activity/GetActivityApplyUsers"

//我要报名
#define APPLY                   @"Activity/ApplyActivity"

//热门目的地
#define ACTIVITY_GETHOTPLACE    @"Activity/GetHotPlace"

//个人资料修改
#define ACTION_UPDATEUSER       @"User/updateUser"

//删除收藏
#define ACTIVITY_DELFAVORITE    @"Activity/delFavorite"

/**某个活动的审核请求接口*/
#define REVIEWAPPLYACTIVITY     @"Activity/ReviewActivityApply"

///GetActivityApplyUsers/{tid}/{type}/{page}/{pagesize}

//我的订阅
#define USER_SUBSCRIPTIONTERM   @"User/SubscriptionTerm"

//删除购物车的某个活动
#define CANCEL_ORDER            @"Order/cancelOrder"

//右边的itme
#define BAR_ITEM(images,actions) [[UIBarButtonItem alloc] initWithImage:images style:UIBarButtonItemStyleBordered  target:self action:actions];
//UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:PNGIMAGE(@"确定") style:UIBarButtonItemStyleBordered  target:self action:@selector(okAction:)];


/**
 *  判断是否有网络
 *
 */
#define NET_WORK [NetworkUtil canConnect]

/**
 *  取消网络请求
 *
 *  @param sharedQueue].operations
 *
 *  @return
 */
#define CANCEL_REQUEST     for (ASIFormDataRequest *request in [ASIFormDataRequest sharedQueue].operations) {[request clearDelegatesAndCancel];}


/**
 *  改变导航标题颜
 */
#define NAVGATION_TITLE_COLOR_WHITECOLOR  [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:17],NSFontAttributeName,nil]];

#define NAV_TITLE_COLOR(c,fontsize) [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:c,NSForegroundColorAttributeName,[UIFont systemFontOfSize:fontsize],NSFontAttributeName,nil]];

//################################### PUSH ############################################

#define NAV_PUSH -(UIBarButtonItem*)customLeftBackButton{\
UIImage *image=[UIImage imageNamed:@"返回.png"];\
UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];\
btn.frame=CGRectMake(15, 20, 25, 44);\
[btn setBackgroundImage:image forState:UIControlStateNormal];\
[btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];\
return backItem;\
}\
- (void)popself{\
    [self.navigationController popViewControllerAnimated:YES];\
}

//################################### Server Name Define ############################################
#define APPLICATION_SERVICE_DISK @"APPLICATION_SERVICE"

#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//修改导航栏back按钮
#define BACK_ITEM UIImage *image=[UIImage imageNamed:@"返回.png"];\
UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];\
btn.frame=CGRectMake(15, 20, 25, 44);\
[btn setBackgroundImage:image forState:UIControlStateNormal];\
[btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *backItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];\
return backItem;


#define NAVIGATION_NUM(num) [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:(self.navigationController.viewControllers.count - (num))] animated:YES];

//登录界面
#define LOGIN_VIEWCONTROLLER LoginViewController *login = [[[LoginViewController alloc] init] autorelease];\
[self.navigationController pushViewController:login animated:YES];

//注册界面
#define REGISTER_VIEWCONTROLLER RegistViewController *rg = [[RegistViewController alloc] initWithNibName:Nil bundle:nil];\
[self.navigationController pushViewController:rg animated:YES];
#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define TagNum 9924

//判断上拉还是上提
#define REQUEST_PAGE_ONE    1
#define REQUEST_PAGE_NEXT   2

//往右滑动
#define SWIPE_RIGHT     UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];\
[swipeRight setNumberOfTouchesRequired:1];\
[swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];\
[self.view addGestureRecognizer:swipeRight];

#define SWIPE_RIGHT_MONTH - (void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer {\
CGPoint location = [gestureRecognizer locationInView:self.view];\
if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {\
    location.x -= 220.0;\
}\
else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionUp) {\
    location.x -= 220.0;\
}\
else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionDown) {\
    location.x -= 220.0;\
}\
else{\
    location.x += 220.0;\
}\
[UIView animateWithDuration:0.5 animations:^{\
    [self back:nil];\
}];\
}

//#define NSLog(...)
//判断app版本
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]
//判断是否是iphone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//判断是否ios7
#define IOS_VERSION_7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
//显示加载状态
#define MBPHUD_SHOW   [MBProgressHUD showHUDAddedTo:self.view animated:YES]
//隐藏
#define MBPHUD_HIDDEN  [MBProgressHUD hideHUDForView:self.view animated:YES]




//** 沙盒路径 ***********************************************************************************
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//获取颜色
#define COLOR_FOR_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define BundleVersion [[NSBundle  mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] //版本号
//#define BundleVersion [[NSBundle  mainBundle] objectForInfoDictionaryKey:@"vesion"]
#define IOS_VERSION_NUM [[[UIDevice currentDevice] systemVersion] floatValue]

//字符串不为空
#define IS_NOT_EMPTY(string) (string !=nil && [string isKindOfClass:[NSString class]] && ![string isEqualToString:@""])

//数组不为空
#define ARRAY_IS_NOT_EMPTY(array) (array && [array isKindOfClass:[NSArray class]] && [array count])

//对象中的属性有网络请求对象（NetRequestController） 调用此宏释放
#define RELEASE_WEB_SERVICE(obj) {[obj releaseBlock];[obj release];obj=nil;}

#define THE_KEY_WINDOWN [UIApplication sharedApplication].keyWindow

#define YELLOW_COL COLOR_FOR_RGB(155,66,21,1)

//动态获取设备高度
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IPHONE_WIDTH [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define StateBarHeight 20
#define MainHeight (ScreenHeight - StateBarHeight)
#define MainWidth ScreenWidth
#define ContentHeight MainHeight - 44.0f

#define CGRECT_MAIN CGRectMake(0.0f, 0.0f, MainWidth, MainHeight)
#define CGRECT_CONTENT CGRectMake(0.0f, 0.0f, MainWidth, ContentHeight)

/* ****************************************************************************************************************** */
#pragma mark - Frame (宏 x, y, width, height)

// App Frame
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width



// 系统控件默认高度
#define kStatusBarHeight        (20.f)

#define kTopBarHeight           (44.f)
#define kBottomBarHeight        (49.f)

#define kCellDefaultHeight      (44.f)

#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)


/* ****************************************************************************************************************** */
#pragma mark - Funtion Method (宏 方法)

// PNG JPG 图片路径
#define PNGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

// 加载图片
#define PNGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

// 当前语言
#define CURRENTLANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])

// 是否Retina屏
#define isRetina                ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 960), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

// 是否iPhone5
#define isiPhone5               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
CGSizeEqualToSize(CGSizeMake(640, 1136), \
[[UIScreen mainScreen] currentMode].size) : \
NO)

// 是否iPad
#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// UIView - viewWithTag
#define VIEWWITHTAG(_OBJECT, _TAG)\
\
[_OBJECT viewWithTag : _TAG]

//格式化字符串
#define STRING_FORMAT(stringType,string) [NSString stringWithFormat:stringType,string]

// 本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...)     NSLocalizedString(x, nil)
/** NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释) */
#define AppLocalString(x, ...)  NSLocalizedStringFromTable(x, @"someName", nil)

// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#if TARGET_OS_IPHONE
/** iPhone Device */
#endif

#if TARGET_IPHONE_SIMULATOR
/** iPhone Simulator */
#endif

// ARC
#if __has_feature(objc_arc)
/** Compiling with ARC */
#else
/** Compiling without ARC */
#endif



/* ****************************************************************************************************************** */
#pragma mark - Constants (宏 常量)


/** 时间间隔 */
#define kHUDDuration            (1.f)

/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))

/** 一天的毫秒数 */
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)
/** 毫秒数 */
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))


#define ALERT_VIEW_TAG 1001
#define CONTANT_ALERT_VIEW_TAG 1002
#define ALERT_FOR_CONFIRM_BOOKING 2001
#define ALERT_FOR_UNCONFIRM_BOOKING 2002
#define ALERT_FOR_VEHICLE_CANCEL_BOOKING 2003
#define ALERT_FOR_PASSENGER_CANCEL_BOOKING 2004
#define ALERT_FOR_CALL_TAXI_AGAIN 2005
#define ALERT_FOR_PASSENGER_TAKE_TAXI 2006
#define ALERT_FOR_VEHICLE_UNCOMPLETE 2007
#define ALERT_FOR_VEHICLE_CANCEL 2008
#define ALERT_FOR_VEHICLE_CANCEL_COMFRIM 2009

#define VIEW_NEW_BOOKING_TAG 3005

#define ALERT_FOR_MUST_UPDATE 5001
#define ALERT_FOR_CAN_UPDATE 5002
#define ALERT_FOR_LOGOUT 5003
#define ALERT_FOR_LOGOUT_CANCLE_BOOKING 5004
#define ALERT_FOR_LOCATION 5005

//** textAlignment ***********************************************************************************

#if !defined __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
# define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
# define TextAlignmentLeft UITextAlignmentLeft
# define TextAlignmentCenter NSTextAlignmentCenter
# define TextAlignmentRight UITextAlignmentRight

#else
# define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
# define TextAlignmentLeft NSTextAlignmentLeft
# define TextAlignmentCenter NSTextAlignmentCenter
# define TextAlignmentRight NSTextAlignmentRight

#endif


// 颜色日志
#define XCODE_COLORS_ESCAPE_MAC @"\033["
#define XCODE_COLORS_ESCAPE_IOS @"\xC2\xA0["
#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_MAC
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color
#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,150,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg250,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,235,30;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

// debug log
#ifdef ENABLE_DEBUGLOG
#define APP_DebugLog(...) NSLog(__VA_ARGS__)
#define APP_DebugLogBlue(...) LogBlue(__VA_ARGS__)
#define APP_DebugLogRed(...) LogRed(__VA_ARGS__)
#define APP_DebugLogGreen(...) LogGreen(__VA_ARGS__)
#else
#define APP_DebugLog(...) do { } while (0);
#define APP_DebugLogBlue(...) do { } while (0);
#define APP_DebugLogRed(...) do { } while (0);
#define APP_DebugLogGreen(...) do { } while (0);
#endif

// log
#define APP_Log(...) NSLog(__VA_ARGS__)

// assert
#ifdef ENABLE_ASSERT_STOP
#define APP_ASSERT_STOP                     {LogRed(@"APP_ASSERT_STOP"); NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);}
#define APP_ASSERT(condition)               {NSAssert(condition, @" ! Assert");}
#else
#define APP_ASSERT_STOP                     do {} while (0);
#define APP_ASSERT(condition)               do {} while (0);
#endif


/////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Redefine

#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x
#define SelfNavBar                          self.navigationController.navigationBar
#define SelfTabBar                          self.tabBarController.tabBar
#define SelfNavBarHeight                    self.navigationController.navigationBar.bounds.size.height
#define SelfTabBarHeight                    self.tabBarController.tabBar.bounds.size.height
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define TouchHeightDefault                  44
#define TouchHeightSmall                    32

// View 坐标(x,y)和宽高(width,height)
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)
#define DATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define TIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define FlushPool(p)                        [p drain]; p = [[NSAutoreleasePool alloc] init]
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define StatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height
#define SelfDefaultToolbarHeight            self.navigationController.navigationBar.frame.size.height
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define IsiOS7Later                         !(IOSVersion < 7.0)

#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)


#define TabBarHeight                        49.0f
#define NaviBarHeight                       44.0f
#define HeightFor4InchScreen                568.0f
#define HeightFor3p5InchScreen              480.0f

#define ViewCtrlTopBarHeight                (IsiOS7Later ? (NaviBarHeight + StatusBarHeight) : NaviBarHeight)
#define IsUseIOS7SystemSwipeGoBack          (IsiOS7Later ? YES : NO)



//**************************  ShareSdk

#define IMAGE_NAME @"sharesdk_img"
#define IMAGE_EXT @"jpg"

#define CONTENT NSLocalizedString(@"TEXT_SHARE_CONTENT", @"ShareSDK不仅集成简单、支持如QQ好友、微信、新浪微博、腾讯微博等所有社交平台，而且还有强大的统计分析管理后台，实时了解用户、信息流、回流率、传播效应等数据，详情见官网http://sharesdk.cn @ShareSDK")
#define SHARE_URL @"http://www.sharesdk.cn"



#endif
