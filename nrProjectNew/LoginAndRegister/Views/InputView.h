//
//  InputView.h
//  naran
//
//  Created by 那然 on 2017/3/8.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputView : UIView<UITextFieldDelegate>

-(id)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder;

@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) UITextField *TF;

@property (strong, nonatomic) NSString *placeholder;

@property (strong, nonatomic) UILabel *userTextName;

@property (assign, nonatomic) BOOL isPhoneTF;

@property (assign, nonatomic) BOOL isSecretTF;

@property (assign, nonatomic) BOOL isCodeTF;

@property (strong, nonatomic) UIImageView * lineView;

- (void)setTextColor;

@end
