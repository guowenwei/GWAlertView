//
//  GWAlertView.m
//  Random
//
//  Created by 魏郭文 on 16/6/18.
//  Copyright © 2016年 魏郭文. All rights reserved.
//

#import "GWAlertView.h"
#import "UIButton+Extension.h"
#import "UILabel+Extension.h"

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define kBackViewHeight (ScreenHeight * 0.19)
#define kBackViewWidth (ScreenWidth * 0.65)
#define kPwdCount 6

@interface GWAlertView ()<UITextViewDelegate>
{
    NSInteger showType;
}
@property (nonatomic,strong) UIWindow * window;

@end

@implementation GWAlertView

- (instancetype)initWithShowType: (GWAlertViewStyle)type  Title: (NSString *)title message:(NSString *)message cancelBtnStr:(NSString *)cancelBtnStr sureBtnStr:(NSString *)sureBtnStr
{
    if (self == [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        showType = type;
        self.titleLbl.text = title;
        self.messageLbl.text = message;
        [self.sureBtn setTitle:sureBtnStr forState:(UIControlStateNormal)];
        [self.cancelBtn setTitle:cancelBtnStr forState:(UIControlStateNormal)];
    }
    return self;
}

- (instancetype)initWithShowType:(GWAlertViewStyle)type Title:(NSString *)title textField_placeholder:(NSString *)textField_placeholder cancelBtnStr:(NSString *)cancelBtnStr
{
    if (self == [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        showType = type;
        self.titleLbl.text = title;
        self.textField.delegate = self;
        self.textField.text = textField_placeholder;
        [self.cancelBtn setTitle:cancelBtnStr forState:(UIControlStateNormal)];
    }
    return self;
}

- (void)show;
{
    self.backView.center = self.center;
    [self addSubview:self.backView];
    self.window = [UIApplication sharedApplication].keyWindow;
    [self.window addSubview:self];
    self.backgroundColor = [UIColor lightTextColor];
}

/**
 *  确认按钮的代理事件
 *
 *  @param sender 按钮事件
 */
- (void)sureBtnAction:(UIButton *)sender
{
    [self.textField resignFirstResponder];
    [self removeFromSuperview];
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(sureBtnDelegateAction:)]) {
        [self.delegate sureBtnDelegateAction:sender];
    }
}

/**
 *  cancelBtnAction
 */
- (void)cancelBtnAction:(UIButton *)sender
{
    [self.textField resignFirstResponder];
    [self removeFromSuperview];
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(cancelBtnDeliverTextDelegateAction:)]) {
        [self.delegate cancelBtnDeliverTextDelegateAction:self.textField.text];
    }
}

- (UIView *)backView
{
    if(!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kBackViewWidth, kBackViewHeight)];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.borderColor = [[UIColor whiteColor] CGColor];
        _backView.layer.borderWidth = 3;
        [_backView addSubview:_titleLbl];
        //如果类型不是”输入框类型“
        if (showType == 0 || showType == 1) {
            [_backView addSubview:_messageLbl];
        }
        if (showType == 2) {
            [_backView addSubview:self.textField];
        }
        //如果类型为 AlertViewStyleValue1
        if (showType == 0) {
            [_backView addSubview:_sureBtn];
        }
        [_backView addSubview:_cancelBtn];
        _backView.layer.cornerRadius = 10;
        _backView.layer.masksToBounds = YES;
    }
    return _backView;
}

- (UILabel *)titleLbl
{
    if(!_titleLbl) {
        _titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kBackViewWidth, kBackViewHeight / 3) Text:@"警告" TextColor:[UIColor whiteColor] Font:[UIFont systemFontOfSize:17.f]];
        _titleLbl.backgroundColor = [UIColor blackColor];
        _titleLbl.textAlignment = UITextAlignmentCenter;
    }
    return _titleLbl;
}

- (UILabel *)messageLbl
{
    if(!_messageLbl) {
        _messageLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, kBackViewHeight / 3, kBackViewWidth, kBackViewHeight / 3) Text:@"你太帅了，别让我看见你" TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:17]];
        _messageLbl.textAlignment = UITextAlignmentCenter;
    }
    return _messageLbl;
}

- (UITextView *)textField
{
    if(!_textField) {
        _textField = [[UITextView alloc] initWithFrame:CGRectMake(0, kBackViewHeight / 3, kBackViewWidth, kBackViewHeight / 3)];
        _textField.textColor = [UIColor redColor];
        _textField.textAlignment = UITextAlignmentCenter;
    }
    return _textField;
}

- (UIButton *)sureBtn
{
    if(!_sureBtn) {
        _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kBackViewHeight / 3 * 2, kBackViewWidth / 2 , kBackViewHeight / 3) Title:@"OK" TitleColor:[UIColor whiteColor] addTarget:self action:@selector(sureBtnAction:)];
        _sureBtn.backgroundColor = [UIColor blackColor];
        _sureBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _sureBtn.layer.borderWidth = 1.5f;
    }
    return _sureBtn;
}

- (UIButton *)cancelBtn
{
    if(!_cancelBtn) {
        
        if (showType == 0) {
            _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(kBackViewWidth / 2, kBackViewHeight / 3 * 2, kBackViewWidth / 2, kBackViewHeight / 3) Title:@"Cancel" TitleColor:[UIColor whiteColor] addTarget:self action:@selector(cancelBtnAction:)];
        }else {
            _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, kBackViewHeight / 3 * 2, kBackViewWidth, kBackViewHeight / 3) Title:@"Cancel" TitleColor:[UIColor whiteColor] addTarget:self action:@selector(cancelBtnAction:) ];
        }
        _cancelBtn.backgroundColor = [UIColor blackColor];
        _cancelBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        _cancelBtn.layer.borderWidth = 1.5f;
    }
    return _cancelBtn;
}
@end
