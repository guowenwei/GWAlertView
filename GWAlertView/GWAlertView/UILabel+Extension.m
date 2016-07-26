//
//  UILabel+Extension.m
//  huaxia90_2
//
//  Created by mac on 15/5/12.
//  Copyright (c) 2015年 zzfeidu. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (instancetype)initWithFrame:(CGRect)frame Text:(NSString *)text TextColor:(UIColor *)color Font:(UIFont *)font{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = font;
    return label;
}

@end
