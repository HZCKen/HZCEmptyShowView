//
//  HZCCustomerWarnView.m
//  HZCEmptyView
//
//  Created by Apple on 2017/11/9.
//  Copyright © 2017年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "HZCCustomerWarnView.h"
#import "Masonry.h"

@interface HZCCustomerWarnView ()



@end

@implementation HZCCustomerWarnView

+ (instancetype)customerWarnViewInitWithFrame:(CGRect)frame
                                          tip:(NSString *)tip
                                    ImageName:(NSString *)imageName
                              loadButtonTitle:(NSString *)buttonTitle
                              reloadDataBlock:(reloadDataBlock)reloadBlock {
    HZCCustomerWarnView *warmView = [[self alloc]initWithFrame:frame];
    warmView.tipLabel.text = tip;
    warmView.imageView.image = [UIImage imageNamed:imageName];
    [warmView.loadButton setTitle:buttonTitle forState:UIControlStateNormal];
    warmView.reloadBlock = reloadBlock;
    warmView.loadButton.hidden = reloadBlock?NO:YES;
    return warmView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.imageView = [[UIImageView alloc]init];
    [self addSubview:self.imageView];
//    self.imageView.image = [UIImage imageNamed:@"noOrder"];
    self.tipLabel = [[UILabel alloc]init];
    [self addSubview:self.tipLabel];
    self.tipLabel.font = [UIFont systemFontOfSize:15];
    self.tipLabel.textColor = [UIColor grayColor];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.text = @"什么也没有";
    self.loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.loadButton];
    [self.loadButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.loadButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.loadButton.layer.borderWidth = 1;
    self.loadButton.layer.cornerRadius = 2.0;
    self.loadButton.layer.masksToBounds = YES;
    [self.loadButton setTitle:@"重新加载" forState:UIControlStateNormal];
    [self.loadButton addTarget:self action:@selector(didClickLoadButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self prepareSubView];
}

- (void)prepareSubView {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.and.height.equalTo(self.mas_width).multipliedBy(0.5);
//        make.top.equalTo(self.mas_top).offset(150);
        make.centerY.equalTo(self).offset(-75);
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(_imageView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 20));
    }];
    
    [self.loadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(_tipLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
}

- (void)didClickLoadButton:(UIButton *)send {
    if (self.reloadBlock) {
        self.reloadBlock();
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

@end
