//
//  HZCCustomerWarnView.h
//  HZCEmptyView
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^reloadDataBlock)();

@interface HZCCustomerWarnView : UIView
/** 提示图 */
@property (nonatomic, strong) UIImageView *imageView;

/** 提示语 */
@property (nonatomic, strong) UILabel *tipLabel;

/** 加载按钮 */
@property (nonatomic, strong) UIButton *loadButton;

/** 回调 */
@property (nonatomic, copy) reloadDataBlock reloadBlock;


+ (instancetype)customerWarnViewInitWithFrame:(CGRect)frame
                                          tip:(NSString *)tip
                                    ImageName:(NSString *)imageName
                              loadButtonTitle:(NSString *)buttonTitle
                              reloadDataBlock:(reloadDataBlock)reloadBlock;

@end
