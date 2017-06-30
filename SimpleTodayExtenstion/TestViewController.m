//
//  TestViewController.m
//  AssociatedObject
//
//  Created by zj on 17/3/31.
//  Copyright © 2017年 zj. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    lable.text = @"asdfasfd";
    lable.backgroundColor = [UIColor redColor];
    [self.view addSubview:lable];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
