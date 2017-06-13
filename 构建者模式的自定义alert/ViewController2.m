//
//  ViewController2.m
//  构建者模式的自定义alert
//
//  Created by jiale on 2017/6/6.
//  Copyright © 2017年 jiale. All rights reserved.
//

#import "ViewController2.h"
#import "ZJAlertBuilder.h"
#import "ZJCustomerAlertBuilder.h"
@interface ViewController2 ()

@end

@implementation ViewController2
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** 构建UIAlert */
- (IBAction)showUIAlert:(id)sender
{
    ZJAlertBuilder *builder = [ZJAlertBuilder builderWithContext:self];
    builder.confirmActionHandler = ^(UIAlertAction *action, NSString *inputText) {
        NSLog(@"input=%@\naction=%@",inputText,action.title);
    };
    builder.setTitle(@"title").setMessage(@"test").setCancelActionTitle(@"cancel").setConfirmActionTitle(@"confirm").addConfirmActionObserver().addTextField(@"placeholder");
    
    [builder addCancelActionHandler:^(UIAlertAction *action) {
        NSLog(@"cancel action");
    }];
    builder.show();
}

/** 构建自定义alert */
- (IBAction)showCustomAlert:(id)sender
{
    ZJCustomerAlertBuilder *builder = [ZJCustomerAlertBuilder builderWithContext:self];
    builder.setTitle(@"title").setMessage(@"message").setConfirmActionTitle(@"confirm").setCancelActionTitle(@"cancel").addTextField(@"").addConfirmActionObserver().setCancelButtonColor([UIColor redColor]).setConfirmButtonColor([UIColor yellowColor]);
    builder.confirmActionHandler = ^(NSString *inputText) {
        NSLog(@"input text=%@\nconfirmed",inputText);
    };
    
    [builder addCancelActionHandler:^{
        NSLog(@"cancelled");
    }];
    builder.show();
}

- (void)dealloc
{

}

@end
