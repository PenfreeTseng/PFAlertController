//
//  ViewController.m
//  PFAlertController
//
//  Created by ZengPengfei on 10/28/16.
//  Copyright © 2016 ZengPengfei. All rights reserved.
//

#import "ViewController.h"
#import "PFAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    PFAlertController *ac = [PFAlertController alertWithTitle:@"我是标题" message:@"我是消息"];
    PFAlertAction *confirm = [PFAlertAction actionWithTitle:@"确定" style:PFAlertActionStyleDestructive handler:^{
        NSLog(@"点击了确定");
    }];
    PFAlertAction *cancel = [PFAlertAction actionWithTitle:@"取消" style:PFAlertActionStyleCancel handler:^{
        NSLog(@"点击了取消");
    }];
    [ac addAction:cancel];
    [ac addAction:confirm];
    [self presentViewController:ac animated:YES completion:nil];
}
@end