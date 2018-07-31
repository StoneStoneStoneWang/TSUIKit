//
//  TSDrawerViewController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/25.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSDrawerViewController.h"
#import <LGSideMenuController/LGSideMenuController.h>
#import "HasNaviViewController.h"
#import <LGSideMenuController/UIViewController+LGSideMenuController.h>
@interface TSDrawerViewController ()

@end

@implementation TSDrawerViewController

- (void)configOwnSubviews {
    
    //    self.tableView.frame = self.view.bounds;
    //
    //    [self.tableView.mj_header beginRefreshing];
    //
    //    self.tableView.mDelegate = self;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn addTarget:self action:@selector(gotoHasNavi) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(50 , 50, 120, 40);
    
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    //    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    //
    //    [btn1 addTarget:self action:@selector(gotoHasNavi1) forControlEvents:UIControlEventTouchUpInside];
    //
    //    btn1.frame = CGRectMake(50 , 150, 120, 40);
    //
    //    [btn1 setTitle:@"跳转" forState:UIControlStateNormal];
    //
    //    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //
    //    [self.view addSubview:btn1];
}

- (void)configOwnProperties {
    [super configOwnProperties];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)gotoHasNavi {
    
    //当我们push成功之后，关闭我们的抽屉
    HasNaviViewController *navi = [HasNaviViewController new];
    
    [[self sideMenuController] hideLeftViewAnimated:true completionHandler:nil];
    
    [[self sideMenuController].rootViewController.childViewControllers[0] pushViewController:navi animated:true];
}
@end
