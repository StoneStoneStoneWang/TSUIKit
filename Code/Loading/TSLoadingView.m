//
//  TSLoadingView.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSLoadingView.h"
#import <objc/runtime.h>
@interface TSLoadingView()
{
    UIActivityIndicatorView *_activity;
    
    UIButton *_backgroundItem;
    
    UIImageView *_iconImageView;
    
    UILabel *_reloadLabel;
}

@property (nonatomic ,strong) TSBaseViewController *contentViewController;

@property (nonatomic ,assign ,readwrite) BOOL isLoading;
@end
@implementation TSLoadingView

+ (instancetype)loadingWithContentViewController:(TSBaseViewController *)contentViewController {
    
    return [[TSLoadingView alloc] initWithContentViewController:contentViewController];
}
- (instancetype)initWithContentViewController:(TSBaseViewController *)contentViewController {
    
    if (self = [super init]) {
        
        self.contentViewController = contentViewController;
        
        self.backgroundColor = [UIColor colorWithRed: 224 / 255.0f green:224 / 255.0f blue:224 / 255.0f alpha:1];
        
        _reloadLabel = [[UILabel alloc] init];
        
        _activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
        
        _backgroundItem = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_backgroundItem addTarget:self action:@selector(onReload) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)setStatus:(LoadingStatus)status {
    _status = status;
    
    [self changeLoadingStatus:status];
}
- (void)changeLoadingStatus:(LoadingStatus)status {
    
    switch (status) {
        case LoadingStatusBegin:
            
        {
            [self prepareSubviews];
            
        }
            break;
        case LoadingStatusSucc:
        {
            
            [self onSucc];
        }
            break;
        case LoadingStatusLoading:
        {
            
            [self onLoading];
        }
            break;
        case LoadingStatusFail:
        {
            
            [self onFail];
        }
            break;
        default:
            break;
    }
}

- (void)prepareSubviews {
    
    CGFloat w = CGRectGetWidth(self.contentViewController.view.bounds);
    
    CGFloat h = CGRectGetHeight(self.contentViewController.view.bounds);
    
    if (self.contentViewController.navigationController) {
        
        if (self.contentViewController.navigationController.navigationBar.isTranslucent) {
            
            self.frame = CGRectMake(0, 64, w, h - 64);
        } else {
            
            self.frame = CGRectMake(0, 0, w, h - 64);
        }
    } else {
        
        self.frame = self.contentViewController.view.bounds;
    }
    
    [self.contentViewController.view bringSubviewToFront:self];
    
    _backgroundItem.frame = self.bounds;
    
    _backgroundItem.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_backgroundItem];
    
    [self addSubview:_activity];
    
    _activity.center = CGPointMake(w / 2, (h - 64) / 2);
    
    //    _iconImageView = [[UIImageView alloc] initWithImage:<#(nullable UIImage *)#>];
    
    //    [self addSubview:_iconImageView];
    //
    
    _reloadLabel.frame = CGRectMake(0, (h - 64) / 2, w, 40);
    
    _reloadLabel.text = @"点击屏幕 重新加载";
    
    _reloadLabel.textColor = [UIColor whiteColor];
    
    _reloadLabel.font = [UIFont systemFontOfSize:20];
    
    _reloadLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_reloadLabel];
}
- (void)onLoading {
    
    if (!_activity.isAnimating) {
        
        [_activity startAnimating];
    }
    
    _activity.hidden = false;
    
    _reloadLabel.hidden = true;
    
    _backgroundItem.hidden = true;
    
}
- (void)onSucc {
    
    if (!_activity.isAnimating) {
        
        [_activity stopAnimating];
    }
    
    [self removeFromSuperview];
}

- (void)onFail {
    
    if (!_activity.isAnimating) {
        
        [_activity stopAnimating];
    }
    
    _activity.hidden = true;
    
    _reloadLabel.hidden = false;
    
    _backgroundItem.hidden = false;
}

- (void)onReload {
    
    [self onLoading];
}

@end
