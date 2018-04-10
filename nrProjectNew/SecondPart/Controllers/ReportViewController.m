//
//  ReportViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/24.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UITextView * textView;

@property (nonatomic, strong) UILabel * placeholder;

@property (nonatomic, strong) UIButton * subButton;

@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.customNavBar setTitle:@"举报"];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    self.bgView.frame = CGRectMake(0, top + 17, SCREEN_WIDTH, 250);
    [self.view addSubview:_bgView];
    
    self.textView.frame = CGRectMake(15, 10, SCREEN_WIDTH - 30, 230);
    [_bgView addSubview:_textView];
    
    self.placeholder.frame = CGRectMake(22, 18, SCREEN_WIDTH - 40, 20);
    [_bgView addSubview:_placeholder];
    
    
    self.subButton.frame = CGRectMake(15, _bgView.bottom + 16, SCREEN_WIDTH - 30, 38);
    [self.view addSubview:_subButton];

}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}
- (UIButton *)subButton
{
    if (!_subButton) {
        _subButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_subButton setTitle:@"提交" forState:UIControlStateNormal];
        [_subButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _subButton.backgroundColor = MainColor;
        [_subButton addAction:^(UIButton *btn) {
            
        } forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _subButton;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _textView.font = font;
        _textView.scrollEnabled = YES;
        _textView.delegate = self;
        _textView.returnKeyType = UIReturnKeyDone;
    }
    return _textView;
}
- (UILabel *)placeholder
{
    if (!_placeholder) {
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _placeholder = [[UILabel alloc] init];
        _placeholder.textColor = kUIColorFromRGB(0x999999);
        _placeholder.font = font;
        _placeholder.text = @"请填写举报原因";
    }
    return _placeholder;
}

#pragma mark -- UITextViewDelgate 方法-----------

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    if (textView.text.length == 0){
        if ([text isEqualToString:@""]) {
            _placeholder.hidden = NO;
        } else {
            _placeholder.hidden = YES;
        }
    }else{
        if (textView.text.length == 1) {
            if ([text isEqualToString:@""]) {
                _placeholder.hidden = NO;
            } else {
                _placeholder.hidden = YES;
            }
        } else {
            _placeholder.hidden = YES;
        }
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
