//
//  AppDelegate.m
//  setnSample
//
//  Created by 陳富榮 on 2015/11/25.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import "AppDelegate.h"
#import "SetnJsonSample.h"
#import "SetnJsonFeed.h"
#import "SetnJsonEntry.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self restkitInit];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)restkitInit
{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
//    https://itunes.apple.com/tw/rss/topalbums/limit=20/json
    
    
    
    NSURL *baseURL = [NSURL URLWithString:@"https://itunes.apple.com/tw/rss/"];
    
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/javascript"];
    [objectManager.HTTPClient setAuthorizationHeaderWithUsername:@"ddh2" password:@"pw53757460"];
    
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"y-M-d";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.timeZone = nil;
    [[RKValueTransformer defaultValueTransformer] insertValueTransformer:dateFormatter atIndex:0];
    
    [objectManager addResponseDescriptor:[self setnJsonResponseDescriptor]];
}

- (UIViewController *)goStoryboardViewController:(NSString *)Identifier
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:Identifier];
    
    return viewController;
}

#pragma mark RKObjectMapping

-(RKObjectMapping *) setnSampleMapping
{
    RKObjectMapping *RKMapping = [RKObjectMapping mappingForClass:[SetnJsonSample class]];
    [RKMapping addRelationshipMappingWithSourceKeyPath:@"feed"
                                               mapping:[self setnFeedMapping]];

    return RKMapping;
}

-(RKObjectMapping *) setnFeedMapping
{
    RKObjectMapping *RKMapping = [RKObjectMapping mappingForClass:[SetnJsonFeed class]];
    NSDictionary *mapping = @{
                              @"author"  : @"author",
                              };
    
    [RKMapping addAttributeMappingsFromDictionary:mapping];
    [RKMapping addRelationshipMappingWithSourceKeyPath:@"entry"
                                                   mapping:[self setnEntryMapping]];
    
    return RKMapping;
}

-(RKObjectMapping *) setnEntryMapping
{
    RKObjectMapping *RKMapping = [RKObjectMapping mappingForClass:[SetnJsonEntry class]];
    [RKMapping addAttributeMappingsFromDictionary:[SetnJsonEntry mapping]];
    
    return RKMapping;
}

#pragma mark RKResponseDescriptor

-(RKResponseDescriptor *) setnJsonResponseDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[self setnSampleMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"topalbums/limit=20/json"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

@end
