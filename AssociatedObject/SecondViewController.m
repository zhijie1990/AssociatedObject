//
//  SecondViewController.m
//  AssociatedObject
//
//  Created by zj on 17/1/4.
//  Copyright © 2017年 zj. All rights reserved.
//

#import "SecondViewController.h"
#import <objc/runtime.h>

@interface SecondViewController ()

@property (nonatomic,strong)UIButton *button1,*button2;

@end

@implementation SecondViewController
static const char * alertViewKey = "alertViewKey";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
}

-(UIButton*)button1{
    if (!_button1) {
        _button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 50)];
        [_button1 setTitle:@"按钮1" forState:UIControlStateNormal];
        [_button1 setBackgroundColor:[UIColor blueColor]];
        [_button1 addTarget:self action:@selector(alertAction1:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

-(UIButton*)button2{
    if (!_button2) {
        _button2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 400, 200, 50)];
        [_button2 setTitle:@"按钮2" forState:UIControlStateNormal];
        [_button2 setBackgroundColor:[UIColor redColor]];
        [_button2 addTarget:self action:@selector(alertAction2:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}

#pragma 初始化并显示 alertOne，同时定义block，将block 与 alertOne 关联
-(void)alertAction1:(id)sender {
    UIAlertView *alertOne = [[UIAlertView alloc]initWithTitle:@"AlertOne" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    void (^block)(NSInteger) = ^(NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            [self methodOne];
        }
    };
    objc_setAssociatedObject(alertOne, alertViewKey, block, OBJC_ASSOCIATION_COPY);//将block 与 alertOne 关联
    [alertOne show];
}


#pragma 初始化并显示 alertTwo，同时定义block，将block 与 alertTwo 关联
-(void)alertAction2:(id)sender {
    UIAlertView *alertTwo = [[UIAlertView alloc]initWithTitle:@"AlertTwo" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    void (^block)(NSInteger) = ^(NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            [self methodTwo];
        }
    };
    objc_setAssociatedObject(alertTwo, alertViewKey, block, OBJC_ASSOCIATION_COPY);//将block 与 alertOne 关联
    [alertTwo show];
}


#pragma  实现代理，在代理方法中，直接取出当前alert 所关联上的 block，再将buttonIndex 传入，让block 自己调用对应方法

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        return;
    }
    void(^block)(NSInteger) = objc_getAssociatedObject(alertView, alertViewKey);
    block(buttonIndex);
}

-(void)methodOne{
    self.view.backgroundColor = [UIColor redColor];
}

-(void)methodTwo{
    self.view.backgroundColor = [UIColor blueColor];
}



@end
