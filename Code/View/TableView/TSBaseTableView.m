//
//  TSBaseTableView.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseTableView.h"
#import "TSColorCommon.h"
#import "TSBaseTableViewCell.h"
@interface TSBaseTableView()

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
    
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    self.showsVerticalScrollIndicator = false;
    
    self.showsHorizontalScrollIndicator = false;
    
    self.backgroundColor = [UIColor clearColor];
}
- (void)prepareData {}

#pragma mark --- data source

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
//    TSBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    
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
    
    TSBaseTableBean *bean = _ts_dataArray[indexPath.section];
    
    return bean.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(onTableView:forIndexPath:withData:)]) {
        
        [_mDelegate onTableView:self forIndexPath:indexPath withData:_ts_dataArray[indexPath.section]];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [UIView new];
    
    view.backgroundColor = SEPERATOR_COLOR;
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    TSBaseTableBean *bean = _ts_dataArray[section];
    
    return bean.sectionHeaderHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view = [UIView new];
    
    view.backgroundColor = SEPERATOR_COLOR;
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    TSBaseTableBean *bean = _ts_dataArray[section];
    
    return bean.sectionFooterHeight;
}
- (void)updateData:(NSArray <TSBaseTableBean *>*)data {
    
    [_ts_dataArray removeAllObjects];
    
    [_ts_dataArray addObjectsFromArray:data];
    
    [self reloadData];
}

- (void)appendData:(NSArray <TSBaseTableBean *>*)data {
    
    [_ts_dataArray addObjectsFromArray:data];
    
    [self reloadData];
}
- (void)updateData:(TSBaseTableBean *)data forIndexPath:(NSIndexPath *)indexPath {
    
    [_ts_dataArray replaceObjectAtIndex:indexPath.section withObject:data];
    
    [self reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:(UITableViewRowAnimationFade)];
    
    [self performDelay];
}
- (void)deleteData:(TSBaseTableBean *)data forIndexPath:(NSIndexPath *)indexPath {
    
    [_ts_dataArray removeObjectAtIndex:indexPath.section];
    
    [self deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:(UITableViewRowAnimationFade)];
    
    //    [self performDelay];
}
- (void)insertData:(TSBaseTableBean *)data forIndexPath:(NSIndexPath *)indexPath {
    
    [_ts_dataArray insertObject:data atIndex:indexPath.section];
    
    [self insertSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:(UITableViewRowAnimationFade)];
    
    //    [self performDelay];
}
- (TSBaseTableBean *)queryDataFor:(NSIndexPath *)indexPath {
    
    return _ts_dataArray[indexPath.section];
}
- (NSArray <TSBaseTableBean *>*)queryAllData {
    
    return _ts_dataArray;
}
- (NSArray <TSBaseTableBean *>*)querySetFor:(NSArray <NSIndexPath *>*)set {
    
    NSMutableArray *result = [NSMutableArray array];
    
    [set enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [result addObject: _ts_dataArray[obj.section]];
    }];
    
    return result;
}
- (TSBaseTableBean *)queryDataForIdx:(NSInteger)idx {
    
    return _ts_dataArray[idx];
}
- (NSArray <TSBaseTableBean *>*)queryDataForIdxs:(NSArray *)idxs {
    
    NSMutableArray *result = [NSMutableArray array];
    
    [idxs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSInteger i = [obj integerValue];
        
        [result addObject:_ts_dataArray[i]];
    }];
    
    return result;
}
- (NSInteger)dataCount {
    
    return _ts_dataArray.count;
}

- (NSIndexPath *)queryDataForIndexPath:(TSBaseTableBean *)data {
    
    return [NSIndexPath indexPathForRow:0 inSection:[_ts_dataArray indexOfObject:data]];
}
- (void)performDelay {
    
    [self performSelector:@selector(delay) withObject:nil afterDelay:0.2];
}
- (void)delay {
    
    [self reloadData];
}
@end
