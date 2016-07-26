//
//  GWAlertView.h
//  Random
//
//  Created by 魏郭文 on 16/6/18.
//  Copyright © 2016年 魏郭文. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertViewStyle)
{
    /**
     *  有两个按钮
     */
    AlertViewStyleDefault,
    /**
     *  只有一个cancel按钮
     */
    AlertViewStyleOneBtn,
    
    /**
     *  一个cancel，一个输入框
     */
    AlertViewStyleOneTextfield
};
@protocol GWAlertViewdelegate <NSObject>

@optional
- (void)sureBtnDelegateAction: (UIButton *)sender;
- (void)cancelBtnDeliverTextDelegateAction: (NSString *)text;

@end

@interface GWAlertView : UIView
/**
 *  titleLbl 标题
 *  messageLbl 消息
 *  sureBtn 确认按钮
 *  cancelBtn 取消按钮
 *  backView 背面的视图
 *  textField 输入框
 */
@property (nonatomic,strong) UILabel * titleLbl, * messageLbl;
@property (nonatomic,strong) UIButton * cancelBtn, * sureBtn;
@property (nonatomic,strong) UITextView * textField;
@property (nonatomic,strong) UIView * backView;
//@property (nonatomic,assign) CGRect frame;
@property (nonatomic,weak) id<GWAlertViewdelegate> delegate;

- (instancetype)initWithShowType: (AlertViewStyle)type Title: (NSString *)title message:(NSString *)message cancelBtnStr:(NSString *)cancelBtnStr sureBtnStr:(NSString *)sureBtnStr;

- (instancetype)initWithShowType:(AlertViewStyle)type Title:(NSString *)title textField_placeholder:(NSString *)textField_placeholder cancelBtnStr:(NSString *)cancelBtnStr;

/**
 *  show 出来
 */
- (void)show;

@end
