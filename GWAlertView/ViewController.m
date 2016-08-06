//
//  ViewController.m
//  GWAlertView
//
//  Created by 魏郭文 on 16/7/26.
//  Copyright © 2016年 魏郭文. All rights reserved.
//

#import "ViewController.h"
#import "GWAlertView.h"

@interface ViewController ()<GWAlertViewdelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.view.backgroundColor = [UIColor lightTextColor];
    GWAlertView * alertView = [[GWAlertView alloc] initWithShowType:2 backColor:[UIColor blackColor] Title:@"请输入密码" textField_placeholder:@"mima" cancelBtnStr:@"确定"];
    alertView.delegate = self;
    [alertView show];
}

- (void)cancelBtnDeliverTextDelegateAction:(NSString *)text
{
    NSLog(@"¥¥¥¥¥%@",text);
}

- (void)sureBtnDelegateAction:(UIButton *)sender
{
    NSLog(@"+++++");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
