//
//  FirstViewController.m
//  AssociatedObject
//
//  Created by zj on 17/1/4.
//  Copyright © 2017年 zj. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic,strong)UIButton *button1,*button2;

@end

@implementation FirstViewController

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

-(void)alertAction1:(id)sender {
    UIAlertView *alertOne = [[UIAlertView alloc]initWithTitle:@"AlertOne" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertOne setTag:1];
    [alertOne show];
}

-(void)alertAction2:(id)sender {
    UIAlertView *alertTwo = [[UIAlertView alloc]initWithTitle:@"AlertTwo" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertTwo setTag:2];
    [alertTwo show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        return;
    }
    if (alertView.tag == 1) {
        if (buttonIndex == 1) {
            [self methodOne];
        }
    }
    else if (alertView.tag == 2) {
        if (buttonIndex == 1) {
            [self methodTwo];
        }
    }
}

-(void)methodOne{
    self.view.backgroundColor = [UIColor redColor];
}

-(void)methodTwo{
    self.view.backgroundColor = [UIColor blueColor];
}





@end
