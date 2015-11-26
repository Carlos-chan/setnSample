//
//  SetnJsonFeed.h
//  setnSample
//
//  Created by 陳富榮 on 2015/11/25.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetnJsonFeed : NSObject

@property (strong,nonatomic) NSDictionary *author;
@property (strong,nonatomic) NSArray  *entry;

@end
