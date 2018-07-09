//
//  TSBaseTableView.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseTableView.h"
@interface TSBaseTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong ,readwrite) NSMutableArray *ts_dataArray;
@end

@implementation TSBaseTableView

- (NSMutableArray *)ts_dataArray {
    
    if (!_ts_dataArray) {
        
        _ts_dataArray = [NSMutableArray array];
    }
    return _ts_dataArray;
}
+ (instancetype)getInstance_t {
    
    return [[self alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style] ) {
        
        [self commitInit];
        
        [self prepareData];
    }
    return self;
}
- (void)commitInit {
    
    self.dataSource = self;
    
    self.delegate = self;
    
    self.bounces = false;
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)prepareData {}

#pragma mark --- data source

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _ts_dataArray.count;
}
#pragma mark --- delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(onTableView:forIndexPath:withData:)]) {
        
        [_mDelegate onTableView:self forIndexPath:indexPath withData:_ts_dataArray[indexPath.section]];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
}
@end
