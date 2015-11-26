//
//  MainViewController.m
//  setnSample
//
//  Created by 陳富榮 on 2015/11/26.
//  Copyright © 2015年 陳富榮. All rights reserved.
//

#import "MainViewController.h"
#import "PhotoViewController.h"
#import "AppDelegate.h"
#import <RestKit/RestKit.h>
#import <SDWebImage+ExtensionSupport/UIImageView+WebCache.h>
#import "SetnJsonSample.h"
#import "SetnJsonFeed.h"
#import "SetnJsonEntry.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    SetnJsonFeed *feed;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self getAPI];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [feed.entry count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [image setBackgroundColor:[UIColor blackColor]];
    SetnJsonEntry *entry = feed.entry[indexPath.row];
    NSDictionary *imageData = entry.imImage[0];
    NSString *imagePreviewUrl = [imageData objectForKey:@"label"];

    [image sd_setImageWithURL:[NSURL URLWithString:imagePreviewUrl]];
    [cell addSubview:image];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *viewController = (PhotoViewController *)[theAppDelegate goStoryboardViewController:@"PhotoViewController"];
    viewController.imageData = feed.entry[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

-(void) getAPI
{
    //    NSMutableDictionary *parameters = [NSMutableDictionary new];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"topalbums/limit=20/json" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        SetnJsonSample *response = [mappingResult firstObject];
        feed = response.feed;
        [_collectionView reloadData];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"fail");
    }];
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
