//
//  SetnJsonEntry.h
//  setnSample
//
//  Created by 陳富榮 on 2015/11/25.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetnJsonEntry : NSObject

@property (strong,nonatomic) NSDictionary *imName;
@property (strong,nonatomic) NSDictionary *imArtist;
@property (strong,nonatomic) NSArray *imImage;

+(NSDictionary *)mapping;

@end
