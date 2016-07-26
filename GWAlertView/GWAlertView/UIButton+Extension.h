//
//  UIButton+Extension.h
//  huaxia90_2
//
//  Created by mac on 15/5/12.
//  Copyright (c) 2015年 zzfeidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)titleColor;
- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)titleColor addTarget:(id)target action:(SEL)action;
@end
