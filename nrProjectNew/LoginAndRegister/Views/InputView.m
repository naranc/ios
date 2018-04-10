//
//  InputView.m
//  naran
//
//  Created by 那然 on 2017/3/8.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "InputView.h"

#define TEXTCOLOR kUIColorFromRGB(0x333333)

@interface InputView ()
{
    CGRect inputViewframe;
    NSString * tempPlaceholder;
}

@end

@implementation InputView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder
{
    self = [super initWithFrame:frame];
    if (self) {
        
        inputViewframe = frame;
        tempPlaceholder = placeholder;
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 18, frame.size.width, 25)];
        _label.hidden = YES;
        _label.text = placeholder;
        _label.textColor = kUIColorFromRGB(0x333333);
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        _TF = [[UITextField alloc] initWithFrame:CGRectMake(0, 18, frame.size.width, 25)];
        _TF.delegate = self;
        _TF.placeholder = placeholder;
        _TF.textAlignment = NSTextAlignmentCenter;
        _TF.font = [UIFont fontWithName:@"PingFangSC-Thin" size:17];
        [_TF setValue:TEXTCOLOR forKeyPath:@"_placeholderLabel.textColor"];
        _TF.tintColor = kUIColorFromRGB(0x1BCC7A);

        [self addSubview:_TF];
        
        self.lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _TF.bottom, frame.size.width, 0.5)];
        _lineView.backgroundColor = kUIColorFromRGB(0x999999);
        [self addSubview:_lineView];

        _label.textColor = TEXTCOLOR;
        _TF.textColor = TEXTCOLOR;

    }
    return self;
}
- (void)setTextColor
{
    _label.textColor = kUIColorFromRGB(0x333333);
    [_TF setValue:kUIColorFromRGB(0x333333) forKeyPath:@"_placeholderLabel.textColor"];
    _lineView.backgroundColor = kUIColorFromRGB(0x999999);
}

-(void)layoutSubviews
{
    if (_isSecretTF) {
        _TF.secureTextEntry = YES;
    }
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _TF.frame = CGRectMake(20, 19, inputViewframe.size.width - 40, 18);
//    _TF.font = [UIFont systemFontOfSize:12];
    _TF.placeholder = @"";
    _label.hidden = NO;
    
    [UIView animateWithDuration:0.4 animations:^{
        _label.frame = CGRectMake(0, 0, inputViewframe.size.width, 13);
        _label.font = [UIFont fontWithName:@"PingFangSC-Thin" size:12];
    }];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""]) {
        return;
    }
    _TF.frame = CGRectMake(0, 18, inputViewframe.size.width, 25);
    [UIView animateWithDuration:0.4 animations:^{
        NSLog(@"213");
        _label.frame = _TF.frame;
//        _TF.font = [UIFont systemFontOfSize:18];
    } completion:^(BOOL finished) {
        _label.hidden = YES;
        _TF.placeholder = tempPlaceholder;
    }];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (_isPhoneTF) {
        if (textField == _TF) {
            if (textField.text.length > 10) {
                textField.text = [textField.text substringToIndex:10];
            }
        }
    }
    if (_isCodeTF) {
        if (textField == _TF) {
            if (textField.text.length > 3) {
                textField.text = [textField.text substringToIndex:3];
            }
        }
    }
    return YES;
}

//- (void)textFieldDidChange:(UITextField *)textField
//{
//    if (_isPhoneTF) {
//        if (textField == _TF) {
//            if (textField.text.length > 11) {
//                textField.text = [textField.text substringToIndex:20];
//            }
//        }
//    }
//    
//}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString * tempStr=[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    if ([tempStr length] == 0) {
//        return NO;
//    }
//    return YES;
//}


@end
