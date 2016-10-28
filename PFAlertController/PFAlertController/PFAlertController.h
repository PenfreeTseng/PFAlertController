//
//  PFAlertController.h
//  ZMKou
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 Duma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFAlertView.h"
#import "PFAlertAction.h"

@interface PFAlertController : UIViewController
@property (nonatomic, weak) UIView *bgView;
@property (nonatomic, strong) UIView *alertView;

- (void)addAction:(PFAlertAction *)action;
+ (instancetype)alertWithTitle:(NSString *)title
                       message:(NSString *)message;

/** 仅仅警告消息
 *  @param message 消息
 *  @param action action
 */
+ (instancetype)alertWithMessage:(NSString *)message action:(PFAlertAction *)action;

/** 仅仅警告消息
 *  @param message 消息
 *  @param actionsArray action数组
 */
+ (instancetype)alertWithMessage:(NSString *)message actionsArray:(NSArray <PFAlertAction *> *)actionsArray;
@end