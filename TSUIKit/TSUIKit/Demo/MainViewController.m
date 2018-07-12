//
//  MainViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/29.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "MainViewController.h"
#import "NoNaviViewController.h"

#import "VideoViewController.h"

#import "TSNavigationController.h"

#import "UITabBarController+AddChild.h"
@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    VideoViewController *video = [VideoViewController new];
    
    [self addChildViewController:video withTitle:@"视频" andTabTitle:@"视频" andNormalImage:@"tab_news_normal_icon" andSelectImage:@"tab_news_selected_icon"];

    NoNaviViewController *me = [NoNaviViewController new];
    
    [self addChildViewController:me withTitle:@"我的" andTabTitle:@"我的" andNormalImage:@"tab_news_normal_icon" andSelectImage:@"tab_news_selected_icon"];
}

@end

// 我需要两种动画 第一种是没有导航展示的 跳转到有导航展示的
// 有导航的跳转到没导航的
