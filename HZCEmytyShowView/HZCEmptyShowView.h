//
//  HZCEmptyShowView.h
//  HZCEmptyShow
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZCEmptyShowView : UIView

/** 图片名 */
@property (nonatomic, copy) NSString *imageName;

/** 提示语 */
@property (nonatomic, copy) NSString *tipString;

/** 按钮文字 */
@property (nonatomic, copy) NSString *buttonString;

/** 是否隐藏加载按钮 */
@property (nonatomic, assign,getter=isHiddenLoadButton) BOOL hiddenLoadButton;

/** 是否隐藏图片 */
@property (nonatomic, assign,getter=isHiddenImageView) BOOL hiddenImageView;

/** 是否隐藏提示文本 */
@property (nonatomic, assign,getter=isHiddenTipLabel) BOOL hiddenTipLabel;

/** 回调 */
@property (nonatomic, copy) void (^callBack)();




/**
 空页面显示提醒图与文字并添加重新刷新 (在回调方法中必须使用weak对象)

 @param imageName 图片名(默认:cry)
 @param tipString 提示语(默认:什么都没有)
 @param buttonString 按钮文字(默认:重新加载)
 @param targetVC 目标控制器
 @param callBack 回调
 */
+ (void)showEmptyViewWithImageName:(NSString *)imageName
                         tipString:(NSString *)tipString
                      buttonString:(NSString *)buttonString
                          targetVC:(const UIViewController * const)targetVC
                          callBack:(void(^)())callBack;

///**
// 空页面显示提醒图与文字并添加重新刷新 (在回调方法中必须使用weak对象)
//
// @param imageName 图片名(默认:cry)
// @param tipString 提示语(默认:什么都没有)
// @param buttonString 按钮文字(默认:重新加载)
// @param callBack 回调
// */
//+ (void)showEmptyViewWithImageName:(NSString *)imageName
//                         tipString:(NSString *)tipString
//                      buttonString:(NSString *)buttonString
//                          callBack:(void(^)())callBack;


@end
