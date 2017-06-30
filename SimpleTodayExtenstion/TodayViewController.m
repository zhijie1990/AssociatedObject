//
//  TodayViewController.m
//  SimpleTodayExtenstion
//
//  Created by zj on 17/3/31.
//  Copyright © 2017年 zj. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    lable.text = @"asdfasfd";
    lable.backgroundColor = [UIColor redColor];
    self.view.frame = CGRectMake(0, 0, 300, 300);
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:lable];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
