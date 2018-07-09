//
//  TSBaseViewController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"

@interface TSBaseViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong,readwrite)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation TSBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationController) {
        
        self.navigationController.navigationBar.translucent = true;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addOwnSubviews];
    
    [self configOwnSubviews];
    
    [self configOwnProperties];
    
    [self configNaviItem];
    
    [self addOwnSubVC];
    
    [self prepareData];
    
    [self addPanGesture];
}

- (void)addOwnSubviews {
    
    // MARK: do something in subclass
}
- (void)configOwnSubviews {
    
    // MARK: do something in subclass
}
- (void)configNaviItem {
    
    // MARK: do something in subclass
}
- (void)configOwnProperties {
    
    // MARK: do something in subclass
}
- (void)addOwnSubVC {
    
    // MARK: do something in subclass
}

- (void)prepareData {
    // MARK: do something in subclass
    
}
- (void)phoneCall:(NSString *)phone {
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame: self.view.bounds];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest: request];
}
- (void)addPanGesture {
    
    if (self.navigationController && self != self.navigationController.viewControllers.firstObject)
    {
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePopRecognizer:)];
        [self.view addGestureRecognizer:popRecognizer];
        popRecognizer.delegate = self;
    }
}

- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
    progress = MIN(1.0, MAX(0.0, progress));
    NSLog(@"progress---%.2f",progress);
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled)
    {
        if (progress > 0.25)
        {
            [self.interactivePopTransition finishInteractiveTransition];
        }
        else
        {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    return [gestureRecognizer velocityInView:self.view].x > 0;
}

@end
