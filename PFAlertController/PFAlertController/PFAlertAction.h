//
//  PFAlertAction.h
//  ZMKou
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 Duma. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PFAlertActionStyle) {
    PFAlertActionStyleDefault,
    PFAlertActionStyleCancel,
    PFAlertActionStyleDestructive
};

@interface PFAlertAction : NSObject
/// action 标题
@property (nonatomic, copy)NSString *title;

/// action 事件
@property (nonatomic, copy)void (^handler) ();

/// action 风格
@property (nonatomic, assign) PFAlertActionStyle style;

///
+ (instancetype)actionWithTitle:(NSString *)title style:(PFAlertActionStyle)style handler:(void(^)())handler;
@end