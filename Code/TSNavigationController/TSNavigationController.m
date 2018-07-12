//
//  TSNavigationController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNavigationController.h"
#import "TSNaviAnimation.h"
#import "TSBaseViewController.h"
#import "TSColorCommon.h"
@interface TSNavigationController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation TSNavigationController
+ (void)initialize {
    
    [[UINavigationBar appearance] setBarTintColor: [UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                                                           NSForegroundColorAttributeName: LEVEL1_COLOR
                                                           }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.interactivePopGestureRecognizer.delegate = self;
    
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = true;
    }
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return self.viewControllers.count > 1;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(TSBaseAnimation *) animationController
{
    return animationController.interactivePopTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(TSBaseViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{

    if (fromVC.interactivePopTransition != nil)
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc] initWithType:operation Duration:0.5];
        
        animation.interactivePopTransition = fromVC.interactivePopTransition;
        
        return animation; //手势
    }
    else
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc]initWithType:operation Duration:0.5];
        
        return animation;//非手势
    }
}
@end
