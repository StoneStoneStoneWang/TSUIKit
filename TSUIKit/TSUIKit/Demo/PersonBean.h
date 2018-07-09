//
//  PersonBean.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/9.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,PersonalType) {
    
    PersonalTypeCircle,
    
    PersonalTypeAddress
    
};

@interface PersonBean : NSObject

@property (nonatomic ,assign) PersonalType type;

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,strong) UIImage *image;

@property (nonatomic ,assign) CGFloat cellHeight;

@property (nonatomic ,assign) CGFloat sectionHeaderHeight;
@end
