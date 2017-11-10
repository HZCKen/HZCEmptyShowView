//
//  UIView+EmptyView.m
//  HZCEmptyView
//
//  Created by Apple on 2017/11/3.
//  Copyright © 2017年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UIView+EmptyView.h"
#import <objc/runtime.h>

static char HZCWarningViewKey;

@implementation UIView (EmptyView)
//利用runtime给类别添加属性
- (void)setWarnView:(HZCCustomerWarnView *)warnView{
    [self willChangeValueForKey:@"HZCWarningViewKey"];
    objc_setAssociatedObject(self, &HZCWarningViewKey, warnView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"HZCWarningViewKey"];
}

- (HZCCustomerWarnView *)warnView{
    return objc_getAssociatedObject(self, &HZCWarningViewKey);
}
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
                 operation:(reloadDataBlock)operation {
    if (self.warnView) {
        [UIView animateWithDuration:0.25 animations:^{
            self.warnView.alpha = 0;
        } completion:^(BOOL finished) {
            [self.warnView removeFromSuperview];
        }];
        
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.warnView = [[HZCCustomerWarnView alloc]initWithFrame:self.bounds];
//        self.warnView .tipLabel.text = tip;
//        self.warnView .imageView.image = [UIImage imageNamed:tipImageName];
//        [ self.warnView .loadButton setTitle:loadButtonText forState:UIControlStateNormal];
//        [self addSubview: self.warnView ];
//        
//        self.warnView .loadButton.hidden = operation?NO:YES;
//        
//        self.warnView .reloadBlock = operation;
        
        self.warnView = [HZCCustomerWarnView customerWarnViewInitWithFrame:self.bounds tip:tip ImageName:tipImageName loadButtonTitle:loadButtonText reloadDataBlock:operation];
        [self addSubview:self.warnView];
    });

    

}
@end
