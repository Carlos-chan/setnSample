//
//  AppDelegate.h
//  setnSample
//
//  Created by 陳富榮 on 2015/11/25.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

#define theAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (UIViewController *)goStoryboardViewController:(NSString *)Identifier;

@end

