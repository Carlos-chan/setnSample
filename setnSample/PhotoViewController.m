//
//  PhotoViewController.m
//  setnSample
//
//  Created by 陳富榮 on 2015/11/26.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import "PhotoViewController.h"
#import <SDWebImage+ExtensionSupport/UIImageView+WebCache.h>

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *imageViewData = _imageData.imImage[2];
    NSString *imageUrlString = [imageViewData objectForKey:@"label"];
    NSLog(@"imageUrlString %@",imageUrlString);
    imageUrlString = [imageUrlString stringByReplacingOccurrencesOfString:@"170x170bb-85.jpg" withString:@"640x640bb-85.jpg"];
    NSLog(@"imageUrlString %@",imageUrlString);
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString]];
   
    [_nameLabel setText:[_imageData.imName objectForKey:@"label"]];
    [_artistLabel setText:[_imageData.imArtist objectForKey:@"label"]];
    
    // Do any additional setup after loading the view.
}

- (void)updateLabelPreferredMaxLayoutWidthToCurrentWidth:(UILabel *)label
{
    label.preferredMaxLayoutWidth = [label alignmentRectForFrame:label.frame].size.width;
    [self.view layoutIfNeeded];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self updateLabelPreferredMaxLayoutWidthToCurrentWidth:_nameLabel];
    [self updateLabelPreferredMaxLayoutWidthToCurrentWidth:_artistLabel];
    
    [self.view layoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
