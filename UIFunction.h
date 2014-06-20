//
//  UIFunction.h
//  JieZuForIPhone
//
//  Created by Mars on 12-6-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "NSString+Utlity.h"
@interface UIFunction : NSObject <UIAlertViewDelegate>


+ (UIFunction*) shareUIFunction;
+ (void) showAlertWithMessage:(NSString *) message;
- (void) showAlertWithMessage:(NSString *) message;
+ (void) showAlertWithMessageCode:(int) errorCode ErrorDescription:(NSString *) description;

+ (void)showAlertWithString:(NSString*)string Image:(UIImage*)image timeDuration:(int)duration;
+ (void) removeMaskView;
+ (void)showWaitingAlertWithString:(NSString*)string;
+ (void)showWaitingAlertWithString:(NSString*)string WithTarget:(id)target action:(SEL)action Title:(NSString *)title;

+ (UIImage *) resizeImageWithImage:(UIImage *) flagImage;

+ (void) showLocalNotification:(NSString*) promptString WithSoundName:(NSString*) notiSoundName;

+ (dispatch_source_t) CreateTimerWithDuration:(NSInteger) duration WithHandleBlock:(void (^)(id obj))handleBlock;

+ (id)loadTableCellFromNib:(NSString*)nib;


- (void) showAlertWithTitle:(NSString *)sTitle andMessage:(NSString *)sContent andButtonList:(NSArray *)buttonList alertTag:(NSInteger)tag;


@end
