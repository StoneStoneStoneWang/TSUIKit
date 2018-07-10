//
//  TSBaseTableView.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSBaseTableView;

@protocol TSBaseTableViewDelegate<NSObject>

- (void)onTableView:(TSBaseTableView *)tableView forIndexPath:(NSIndexPath *)indexPath withData:(id)data;

@end

@interface TSBaseTableView : UITableView

#pragma mark --- 自定义delegate
@property (nonatomic ,weak) id<TSBaseTableViewDelegate> mDelegate;

#pragma mark --- 数据源
@property (nonatomic ,strong ,readonly) NSMutableArray *ts_dataArray;

+ (instancetype)getInstance_t;

- (void)commitInit;

- (void)prepareData;

#pragma mark --- 更新 头部 脚部
- (void)updateHeader:(id)data;

- (void)updateFooter:(id)data;

#pragma mark --- 增删改查

- (void)updateData:(id)data;

- (void)appendData:(id)data;

- (void)updateData:(id)data forIndexPath:(NSIndexPath *)indexPath;

- (void)insertData:(id)data forIndexPath:(NSIndexPath *)indexPath;

- (void)deleteData:(id)data forIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic ,assign ,readonly) NSInteger dataCount;

- (NSArray *)queryAllData;

- (id)queryDataFor:(NSIndexPath *)indexPath;

- (id)queryDataForIdx:(NSInteger )idx;

- (NSArray *)querySetFor:(NSArray <NSIndexPath *>*)set;

- (NSArray *)queryDataForIdxs:(NSArray *)idxs;

@end
