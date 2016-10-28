//
//  PFAlertView.h
//  ZMKou
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 Duma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFAlertAction.h"

@interface PFAlertView : UIView
/// 保存当前的管理器
@property (nonatomic, weak) UIViewController *controller;

/**  初始化 AlertView
 *   @param title   标题
 *   @param message 消息
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

/**  初始化 AlertView
 *   @param message 消息
 *   @param action 点击动作
 */
- (instancetype)initWithMessage:(NSString *)message actions:(NSArray <PFAlertAction *> *)actionsArray;

/** 添加一个 action
 *
 *  @param action action
 */
- (void)addAction:(PFAlertAction *)action;
@end
