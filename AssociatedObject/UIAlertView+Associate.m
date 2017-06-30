//
//  UIAlertView+Associate.m
//  AssociatedObject
//
//  Created by zj on 17/3/31.
//  Copyright © 2017年 zj. All rights reserved.
//

#import "UIAlertView+Associate.h"
#import <objc/runtime.h>

@implementation UIAlertView (Associate)
static const char * alertViewKey = "alertViewKey";

-(AssociateBlock)block{
    
    return objc_getAssociatedObject(self, alertViewKey);
}

-(void)setBlock:(AssociateBlock)block{
    objc_setAssociatedObject(self, alertViewKey, block, OBJC_ASSOCIATION_COPY);
}



@end
