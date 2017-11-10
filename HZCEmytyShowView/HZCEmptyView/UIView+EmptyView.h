//
//  UIView+EmptyView.h
//  HZCEmptyView
//
//  Created by Apple on 2017/11/3.
//  Copyright © 2017年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZCCustomerWarnView.h"

@interface UIView (EmptyView)

/**  */
@property (nonatomic, strong) HZCCustomerWarnView *warnView;

/**
 空页面显示
 
 @param tip 提示语
 @param tipImageName 提示图名
 @param loadButtonText 加载按钮类容
 @param operation 操作
 */
- (void)emptyViewTipString:(NSString *)tip
              tipImageName:(NSString *)tipImageName
            loadButtonText:(NSString *)loadButtonText
                 operation:(reloadDataBlock)operation;

@end
