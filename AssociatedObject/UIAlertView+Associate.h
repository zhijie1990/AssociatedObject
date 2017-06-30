//
//  UIAlertView+Associate.h
//  AssociatedObject
//
//  Created by zj on 17/3/31.
//  Copyright © 2017年 zj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Associate)

typedef void(^AssociateBlock)(NSInteger buttonIndex);

@property (nonatomic , copy) AssociateBlock block;

@end
