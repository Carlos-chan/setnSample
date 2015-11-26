//
//  SetnJsonEntry.m
//  setnSample
//
//  Created by 陳富榮 on 2015/11/25.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import "SetnJsonEntry.h"

@implementation SetnJsonEntry

+(NSDictionary *)mapping {
    NSDictionary *mapping = @{ @"im:name" : @"imName" ,
                               @"im:image" : @"imImage" ,
                               @"im:artist" : @"imArtist"
                               };
    
    return mapping;
}



@end
