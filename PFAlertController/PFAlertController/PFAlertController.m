//
//  PFAlertController.m
//  ZMKou
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 Duma. All rights reserved.
//

#import "PFAlertController.h"
#import "PFAlertPopTransition.h"
#import "PFAlertDismissTransition.h"

#define kBGAlpha 0.3f
@interface PFAlertController () <UIViewControllerTransitioningDelegate>

@end

@implementation PFAlertController
#pragma mark - lazy loading
/// 背景视图
- (UIView *)bgView {
    if (!_bgView) {
        UIView *bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = kBGAlpha;
        _bgView = bgView;
        return bgView;
    }
    return _bgView;
}

#pragma mark - 初始化
- (instancetype)init {
    if ((self = [super init])) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

#pragma mark - 自定义样式
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    //
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.alertView];
    //
    self.alertView.center = self.view.center;
}

///
+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message {
    PFAlertController *ac = [[PFAlertController alloc] init];
    ac.alertView = [[PFAlertView alloc] initWithTitle:title message:message];
    ((PFAlertView *)(ac.alertView)).controller = ac;
    return ac;
}

//
+ (instancetype)alertWithMessage:(NSString *)message action:(PFAlertAction *)action {
    NSArray *actionsArray = @[action];
    PFAlertController *ac = [PFAlertController alertWithMessage:message actionsArray:actionsArray];
    return ac;
}

//
+ (instancetype)alertWithMessage:(NSString *)message actionsArray:(NSArray <PFAlertAction *> *)actionsArray {
    PFAlertController *ac = [[PFAlertController alloc] init];
    ac.alertView = [[PFAlertView alloc] initWithMessage:message actions:actionsArray];
    ((PFAlertView *)(ac.alertView)).controller = ac;
    return ac;
}

#pragma mark -
- (void)addAction:(PFAlertAction *)action {
    if ([self.alertView isMemberOfClass:[PFAlertView class]]) {
        [(PFAlertView *)_alertView addAction:action];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    return;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [[PFAlertPopTransition alloc] init];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[PFAlertDismissTransition alloc] init];
}
@end
