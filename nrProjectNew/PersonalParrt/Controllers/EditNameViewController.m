//
//  EditNameViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/10.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "EditNameViewController.h"

@interface EditNameViewController ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UITextField * nameTF;

@property (nonatomic, strong) UIButton * saveButton;

@end

@implementation EditNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"输入姓名"];
    
    [self.view addSubview:self.bgView];
    [_bgView addSubview:self.nameTF];
    [self.view addSubview:self.saveButton];
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (UITextField *)nameTF
{
    if (!_nameTF) {
        _nameTF = [[UITextField alloc] init];
        _nameTF.placeholder = @"输入姓名";
        _nameTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _nameTF.textColor = kUIColorFromRGB(0x999999);
        _nameTF.tintColor = MainColor;
        _nameTF.textAlignment = NSTextAlignmentRight;
    }
    return _nameTF;
}
- (UIButton *)saveButton
{
    if (!_saveButton) {
        _saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_saveButton setTitle:@"确定" forState:UIControlStateNormal];
        [_saveButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _saveButton.backgroundColor = MainColor;
        _saveButton.layer.cornerRadius = 4.0f;
        _saveButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        weakify(self);
        [_saveButton addAction:^(UIButton *btn) {
            
            
            if ([weakSelf.nameTF.text isEqualToString:@""] || weakSelf.nameTF.text.length == 0) {
                [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"请输入姓名" duration:MBProgressHUDDuration];
                return;
            }else{
                NSString *str = [weakSelf.nameTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
                if ([str isEqualToString:@""] || str.length == 0) {
                    [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"请输入姓名" duration:MBProgressHUDDuration];
                    weakSelf.nameTF.text = @"";
                    return ;
                }
            }
            
            
            if ([weakSelf.nameTF.text containsString:@" "]) {
                [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"姓名中不能包含空格" duration:MBProgressHUDDuration];
                return;
            }
            
            
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveButton;
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

    _bgView.frame = CGRectMake(15, top + 11, SCREEN_WIDTH - 30, 53);
    
    _nameTF.frame = CGRectMake(12, 16, _bgView.width - 24, 21);
    
    _saveButton.frame = CGRectMake(15, top + 76, SCREEN_WIDTH - 30, 38);
  
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
