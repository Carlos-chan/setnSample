//
//  PhotoViewController.h
//  setnSample
//
//  Created by 陳富榮 on 2015/11/26.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetnJsonEntry.h"

@interface PhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;

@property (strong,nonatomic) SetnJsonEntry *imageData;

@end
