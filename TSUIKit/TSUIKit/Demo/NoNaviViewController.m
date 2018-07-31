//
//  NoNaviViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NoNaviViewController.h"
#import "HasNaviViewController.h"
#import "TSInnerViewController.h"
#import "HUDUtil.h"

#import "TSBaseRefreshTableView.h"


@interface NoNaviViewController () <TSBaseRefreshTableViewDelegate >

@property (nonatomic ,strong) TSBaseRefreshTableView *tableView;

@end

@implementation NoNaviViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:true];
    
}
- (TSBaseRefreshTableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [TSBaseRefreshTableView getInstance_t];
    }
    return _tableView;
}
- (void)addOwnSubviews {
    
    [self.view addSubview:self.tableView];
}
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
    
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
        [btn1 addTarget:self action:@selector(gotoHasNavi1) forControlEvents:UIControlEventTouchUpInside];
    
        btn1.frame = CGRectMake(50 , 150, 120, 40);
    
        [btn1 setTitle:@"跳转" forState:UIControlStateNormal];
    
        [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
        [self.view addSubview:btn1];
}

- (void)configOwnProperties {
    [super configOwnProperties];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)onHeaderRefresh {
    
    [self performSelector:@selector(delay) withObject:nil afterDelay:2];
}
- (void)delay {
    
    [self.tableView.mj_header endRefreshing];
}
- (void)onFooterRefresh {
    
    
}
- (void)onTableView:(TSBaseTableView *)tableView forIndexPath:(NSIndexPath *)indexPath withData:(TSBaseTableBean *)data {
    
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}
- (void)gotoHasNavi1 {
    
//    [[HUDUtil shared] showWithStatus:@"你好1"];
}
- (void)gotoHasNavi {
    
    [[HUDUtil shared] showInfo:@"你好"];
    
    //    [[HUDUtil shared] showWithStatus:@"你好1"];
    //
    //    [[HUDUtil shared ] showActivity];
    
    //    TSInnerViewController *inner = [[TSInnerViewController alloc]init];
    //
    //    inner.zoomScale = false;
    //
    //    [inner loadReq:@"https://www.baidu.com"];
    //
    //    [self.navigationController pushViewController:inner animated:true];
    
        HasNaviViewController *vc = [HasNaviViewController new];
    
        [self.navigationController pushViewController:vc animated:true];
}

@end
