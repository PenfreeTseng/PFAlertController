//
//  PFAlertAction.m
//  ZMKou
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 Duma. All rights reserved.
//

#import "PFAlertAction.h"

@implementation PFAlertAction
+ (instancetype)actionWithTitle:(NSString *)title style:(PFAlertActionStyle)style handler:(void (^)())handler {
    PFAlertAction *action = [[PFAlertAction alloc] init];
    action.title = title;
    action.handler = handler;
    action.style = style;
    return action;
}
@end