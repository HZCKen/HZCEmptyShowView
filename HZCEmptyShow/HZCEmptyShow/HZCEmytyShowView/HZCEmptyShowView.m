//
//  HZCEmptyShowView.m
//  HZCEmptyShow
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
///Users/apple/Downloads/iOS-ToolClassDemo-master/testToolDemo/testToolDemo

#import "HZCEmptyShowView.h"
#import "Masonry.h"

@interface HZCEmptyShowView ()

/** 提示图 */
@property (nonatomic, strong) UIImageView *imageView;
/** 提示文本 */
@property (nonatomic, strong) UILabel *tipLabel;
/** 刷新按钮 */
@property (nonatomic, strong) UIButton *loadButton;
/** 是否通过类方法创建 */
@property (nonatomic, assign,getter=isCreateByClassMethods) BOOL createByClassMethods;

@end


@implementation HZCEmptyShowView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - 界面相关
- (void)setupUI {
    [self createImageView];
    [self createTipLabel];
    [self createLoadButton];
}

- (void)createImageView {
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cry"]];
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.height.equalTo(self.mas_width).multipliedBy(0.5);
        make.top.equalTo(self.mas_top).offset(150);
    }];
}

- (void)createTipLabel {
    self.tipLabel = [[UILabel alloc]init];
    self.tipLabel.font = [UIFont systemFontOfSize:15.0];
    self.tipLabel.textColor = [UIColor grayColor];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.text = @"什么都没有";
    [self addSubview:self.tipLabel];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 20));
    }];
}

- (void)createLoadButton {
    self.loadButton = [[UIButton alloc]init];
    self.loadButton.layer.cornerRadius = 2.0;
    self.loadButton.layer.masksToBounds = YES;
    self.loadButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.loadButton.layer.borderWidth = 1;
    self.loadButton.layer.cornerRadius = 2.0;
    [self.loadButton setTitle:@"重新加载" forState:(UIControlStateNormal)];
    [self.loadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.loadButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.loadButton addTarget:self action:@selector(loadClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loadButton];
    
    [self.loadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.tipLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
}

#pragma mark - 事件处理
- (void)loadClick {

    if (self.callBack) {
        self.callBack();
    }
    if (self.isCreateByClassMethods) {
        [self removeFromSuperview];
    }
}

#pragma mark - 公开方法

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
                          callBack:(void (^)())callBack {

    HZCEmptyShowView *showView = [[HZCEmptyShowView alloc]initWithFrame:targetVC.view.bounds];
    __weak typeof(showView)weakShowView = showView;
    weakShowView.createByClassMethods = YES;
    if (!callBack) {
        weakShowView.hiddenLoadButton = YES;
    } else {
        weakShowView.hiddenLoadButton = NO;
        weakShowView.callBack = callBack;
    }
    
    if (imageName.length >0) {
        weakShowView.imageName = imageName;
    }
    
    if (tipString.length >0) {
        weakShowView.tipString = tipString;
    }
    
    if (buttonString.length >0) {
        weakShowView.buttonString = buttonString;
    }
    
    [targetVC.view addSubview:weakShowView];
    [targetVC.view bringSubviewToFront:weakShowView];
}

/**
 空页面显示提醒图与文字并添加重新刷新 (在回调方法中必须使用weak对象)
 
 @param imageName 图片名(默认:cry)
 @param tipString 提示语(默认:什么都没有)
 @param buttonString 按钮文字(默认:重新加载)
 @param callBack 回调
 */
+ (void)showEmptyViewWithImageName:(NSString *)imageName
                         tipString:(NSString *)tipString
                      buttonString:(NSString *)buttonString
                          callBack:(void (^)())callBack {
    
    UIViewController *currentVC = [HZCEmptyShowView getTheTopviewControler];
    HZCEmptyShowView *showView = [[HZCEmptyShowView alloc]initWithFrame:currentVC.view.bounds];
    __weak typeof(showView)weakShowView = showView;
    NSLog(@"%@",currentVC);
    weakShowView.createByClassMethods = YES;
    if (!callBack) {
        weakShowView.hiddenLoadButton = YES;
    } else {
        weakShowView.hiddenLoadButton = NO;
        weakShowView.callBack = callBack;
    }
    
    if (imageName.length >0) {
        weakShowView.imageName = imageName;
    }
 
    if (tipString.length >0) {
        weakShowView.tipString = tipString;
    }
    
    if (buttonString.length >0) {
        weakShowView.buttonString = buttonString;
    }
    
    [currentVC.view addSubview:weakShowView];
    [currentVC.view bringSubviewToFront:weakShowView];
}

#pragma mark - set get
- (void)setTipString:(NSString *)tipString {
    _tipString = tipString;
    self.tipLabel.text = tipString;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    [self.imageView setImage:[UIImage imageNamed:imageName]];
}

- (void)setButtonString:(NSString *)buttonString {
    _buttonString = buttonString;
    [self.loadButton setTitle:buttonString forState:UIControlStateNormal];
    
    if (buttonString.length > 4) {
        NSString *content = self.loadButton.titleLabel.text;
        UIFont *font = self.loadButton.titleLabel.font;
        CGSize size = CGSizeMake(MAXFLOAT, 30.0f);
        CGSize buttonSize = [content boundingRectWithSize:size
                                                  options:NSStringDrawingTruncatesLastVisibleLine  | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                               attributes:@{ NSFontAttributeName:font}
                                                  context:nil].size;
        [self.loadButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(buttonSize.width + 20);
        }];
    }
}

- (void)setHiddenLoadButton:(BOOL)hiddenLoadButton {
    _hiddenLoadButton = hiddenLoadButton;
    self.loadButton.hidden = hiddenLoadButton;
}

- (void)setHiddenTipLabel:(BOOL)hiddenTipLabel {
    _hiddenTipLabel = hiddenTipLabel;
    self.tipLabel.hidden = hiddenTipLabel;
}

- (void)setHiddenImageView:(BOOL)hiddenImageView {
    _hiddenImageView = hiddenImageView;
    self.imageView.hidden = hiddenImageView;
}

/**
 获取最顶部的控制器
 */
+ (UIViewController *)getTheTopviewControler{

    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    
    UIViewController *parent = rootVC;
    
    if ((parent = rootVC.presentedViewController) != nil ) {
        rootVC = parent;
    }
    
    if ([rootVC isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *)rootVC topViewController];
    }
    
    return rootVC;
}


@end
