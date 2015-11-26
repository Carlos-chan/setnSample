//
//  MainViewController.h
//  setnSample
//
//  Created by 陳富榮 on 2015/11/26.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
