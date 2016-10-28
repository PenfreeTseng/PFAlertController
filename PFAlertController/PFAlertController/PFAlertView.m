//
//  PFAlertView.m
//  ZMKou
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 Duma. All rights reserved.
//

#import "PFAlertView.h"

#define kMainRedColor [UIColor colorWithRed:(251.0f / 255.0f) green:(43.0f / 255.0f) blue:(71.0f / 255.0f) alpha:1.0f]
@interface PFAlertView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;


//
@property (nonatomic, weak) UIView *nibView;
@property (nonatomic, strong) NSMutableArray <PFAlertAction *> *actionsArray;
@property (nonatomic, strong) NSMutableArray <UIButton *> *actionButtonArray;
@end


@implementation PFAlertView
#pragma mark - lazy loading
- (NSMutableArray *)actionsArray {
    if (!_actionsArray) {
        _actionsArray = [NSMutableArray array];
    }
    return _actionsArray;
}

- (NSMutableArray *)actionButtonArray {
    if (!_actionButtonArray) {
        _actionButtonArray = [NSMutableArray array];
    }
    return _actionButtonArray;
}

#pragma mark - 自定义视图区
//
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    ;
    if ((self = [super init])) {
        [self commonConfig];
        //
        PFAlertView *nibView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                              owner:nil options:nil] firstObject];
        self.nibView = nibView;
        self.bounds = nibView.bounds;
        [self addSubview:nibView];
        //
        nibView.titleLabel.text = title;
        nibView.msgLabel.text = message;
    }
    return self;
}

- (instancetype)initWithMessage:(NSString *)message actions:(NSArray<PFAlertAction *> *)actionsArray {
    if ((self = [super init])) {
        [self commonConfig];
        //
        PFAlertView *nibView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                              owner:nil options:nil] objectAtIndex:1];
        self.nibView = nibView;
        self.bounds = nibView.bounds;
        [self addSubview:nibView];
        //
        nibView.msgLabel.text = message;
        //
        for (PFAlertAction *action in actionsArray) {
            [self addAction:action];
        }
    }
    return self;
}

#pragma mark - 配置区
/// 基本配置
- (void)commonConfig {
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
}

- (void)addAction:(PFAlertAction *)action {
    [self.actionsArray addObject:action];
    
    // 创建 button，设置它的属性
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // 根据action在数组的索引标记button
    [actionButton setTag:[self.actionsArray indexOfObject:action]];
    [actionButton setTitle:action.title forState:UIControlStateNormal];
    [actionButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    //
    UIColor *titleColor = nil;
    UIColor *bgColor = nil;
    if (action.style == PFAlertActionStyleDestructive) {
        // 警告
        titleColor = [UIColor whiteColor];
        bgColor = kMainRedColor;
    } else if (action.style == PFAlertActionStyleCancel) {
        // 取消
        titleColor = [UIColor darkGrayColor];
        bgColor = [UIColor whiteColor];
    } else if (action.style == PFAlertActionStyleDefault) {
        // 默认
        titleColor = [UIColor darkGrayColor];
        bgColor = [UIColor whiteColor];
    } else {
        titleColor = [UIColor darkGrayColor];
        bgColor = [UIColor whiteColor];
    }
    //
    [actionButton setTitleColor:titleColor forState:UIControlStateNormal];
    [actionButton setBackgroundColor:bgColor];
    [actionButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // 添加到 button数组
    [self.actionButtonArray addObject:actionButton];
    [self addSubview:actionButton];
    [self relayoutButtons];
}

/// 按钮点击
- (void)buttonClicked:(UIButton *)button {
    //
    void (^handler)() = self.actionsArray[button.tag].handler;
    if (handler) {
        handler();
    }
    //
    if (self.controller) {
        [self.controller dismissViewControllerAnimated:YES completion:nil];
    }
}

///
- (void)relayoutButtons {
    CGFloat nibViewW = self.nibView.bounds.size.width;
    CGFloat btnH = 40;
    CGFloat btnY = self.nibView.bounds.size.height - btnH;
    switch (self.actionButtonArray.count) {
        case 1: {
            UIButton *btn = [self.actionButtonArray lastObject];
            btn.frame = CGRectMake(0, btnY, nibViewW, btnH);
        }
            break;
        case 2: {
            CGFloat btnW = nibViewW / 2.0f;
            for (int i = 0; i < self.actionButtonArray.count; i++) {
                UIButton *btn = self.actionButtonArray[i];
                btn.frame = CGRectMake(i * btnW, btnY, btnW, btnH);
            }
            break;
        }
        default:
            break;
    }
}
@end
