//
//  UIViewController+TSAdd.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+TSAdd.h"
#import "TSBaseViewController.h"
#import <objc/runtime.h>
typedef void (* _IMP)(id,SEL,...);

@implementation UIViewController (TSAdd)
+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        Method addOwnSubviews = class_getInstanceMethod(self, @selector(addOwnSubviews));
        
        _IMP addOwnSubviews_IMP = (_IMP)method_getImplementation(addOwnSubviews);
        
        method_setImplementation(addOwnSubviews, imp_implementationWithBlock(^(id target,SEL action){
            addOwnSubviews_IMP(target,@selector(addOwnSubviews));
            //            NSLog(@"%@ did load",target);
            [target didAddSubviews];
        }));
    });
}

- (void)didAddSubviews {
    
    
}
@end
