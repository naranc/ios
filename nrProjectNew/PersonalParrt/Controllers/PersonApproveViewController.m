//
//  PersonApproveViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PersonApproveViewController.h"
#import "UpLoadIDCardViewController.h"
#import "PInfoDetailCell.h"
#import "EditNameViewController.h"
#import "PGDatePickManager.h"


static NSString * cellitifter1 = @"personalInfo1";
static NSString * cellitifter2 = @"personalInfo2";

@interface PersonApproveViewController ()<UITableViewDelegate, UITableViewDataSource, PGDatePickerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UITableView * infoTableView;

@property (nonatomic, strong) NSArray * titleArray;

@property (nonatomic, strong) NSMutableArray * contentArray;

@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) UITextField * nameTF;

@property (nonatomic, strong) UITextField * idCardTF;

@property (nonatomic, strong) UILabel * pointLabel;

@end

@implementation PersonApproveViewController
- (NSMutableArray *)contentArray
{
    if (!_contentArray) {
        _contentArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _contentArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"实名认证"];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelButtonHandler)];
//    [self.view addGestureRecognizer:tap];


    _titleArray = @[@"",@"姓名",@"性别",@"",@"证件类型",@"证件号码",@"证件有效期",@""];
    
    NSArray * tempContentArray = @[@"",@"姓名",@"请选择性别",@"",@"身份证",@"证件号码",@"请选择有效日期",@""];
    [self.contentArray addObjectsFromArray:tempContentArray];


    [self.view addSubview:self.infoTableView];
    
    [self.view addSubview:self.doneButton];
    
    [self.view addSubview:self.pointLabel];
    


}
- (void)cancelButtonHandler
{
//    [_nameTF resignFirstResponder];
//    [_idCardTF resignFirstResponder];
}
- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _doneButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [_doneButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
        _doneButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
    }
    return _doneButton;
}
- (UILabel *)pointLabel
{
    if (!_pointLabel) {
        _pointLabel = [[UILabel alloc] init];
        NSLog(@"%f",_infoTableView.height);
        _pointLabel.frame = CGRectMake(0, SCREEN_HEIGHT - 49 - 50, SCREEN_WIDTH, 20);
        _pointLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _pointLabel.textAlignment = NSTextAlignmentCenter;
        _pointLabel.textColor = kUIColorFromRGB(0x999999);
        _pointLabel.text = @"信息仅用于身份验证，那然公益会保障您的信息安全";
        
    }
    return _pointLabel;
}
- (UITextField *)nameTF
{
    if (!_nameTF) {
        CGFloat wight = SCREEN_WIDTH - 30 - 80 - 6.4 - 13 - 10;
        _nameTF = [[UITextField alloc] init];
        _nameTF.frame = CGRectMake(SCREEN_WIDTH - 15 - 6.4 - 13 - wight, 13, wight, 20);
        _nameTF.placeholder = @"请填写姓名";
        _nameTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameTF.textColor = kUIColorFromRGB(0x999999);
        _nameTF.tintColor = MainColor;
        _nameTF.delegate = self;
        _nameTF.returnKeyType = UIReturnKeyDone;
        _nameTF.textAlignment = NSTextAlignmentRight;
    }
    return _nameTF;
}

- (UITextField *)idCardTF
{
    if (!_idCardTF) {
        CGFloat wight = SCREEN_WIDTH - 30 - 80 - 6.4 - 13 - 10;
        _idCardTF = [[UITextField alloc] init];
        _idCardTF.frame = CGRectMake(SCREEN_WIDTH - 15 - 6.4 - 13 - wight, 13, wight, 20);
        _idCardTF.placeholder = @"请填入身份证号码";
        _idCardTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _idCardTF.textColor = kUIColorFromRGB(0x999999);
        _idCardTF.tintColor = MainColor;
        _idCardTF.delegate = self;
        _idCardTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        _idCardTF.textAlignment = NSTextAlignmentRight;
        _idCardTF.returnKeyType = UIReturnKeyDone;
    }
    return _idCardTF;
}
- (UITableView *)infoTableView
{
    if (!_infoTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 49);
        _infoTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _infoTableView.delegate = self;
        _infoTableView.dataSource = self;
        _infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _infoTableView.showsVerticalScrollIndicator = NO;
        _infoTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _infoTableView.tableFooterView = [UIView new];
        _infoTableView.estimatedRowHeight = 0;
        _infoTableView.estimatedSectionHeaderHeight = 0;
        _infoTableView.estimatedSectionFooterHeight = 0;
    }
    return _infoTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 7) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        return cell;
    }else{
        PInfoDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
        if (!cell) {
            cell = [[PInfoDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2];
        }
        cell.titleLabel.text = _titleArray[indexPath.row];
        
        if (indexPath.row == 1) {
            [cell addSubview:self.nameTF];
        }
        if (indexPath.row == 5) {
            [cell addSubview:self.idCardTF];
        }
        
        if (indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 6) {
            cell.contentLabel.text = _contentArray[indexPath.row];
        }
        cell.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 7) {
        return 12;
    }else{
        return 46;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        [_nameTF resignFirstResponder];
        [_idCardTF resignFirstResponder];
        UIAlertController *alertController;
        if (!alertController) {
            alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击取消");
                
            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                NSLog(@"选择男");
                [_contentArray replaceObjectAtIndex:2 withObject:@"男"];
                NSIndexPath * indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
                [_infoTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];

            }]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"选择女");
                [_contentArray replaceObjectAtIndex:2 withObject:@"女"];
                NSIndexPath * indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
                [_infoTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
                
            }]];
        }
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    if (indexPath.row == 6) {
        [_nameTF resignFirstResponder];
        [_idCardTF resignFirstResponder];
        PGDatePickManager *datePickManager;
        if (!datePickManager) {
            datePickManager = [[PGDatePickManager alloc]init];
            PGDatePicker *datePicker = datePickManager.datePicker;
            datePicker.delegate = self;
            datePickManager.titleLabel.text = @"请选择有效日期";
            datePicker.datePickerMode = PGDatePickerModeDate;
            //设置选中行的字体颜色
            datePicker.textColorOfSelectedRow = MainColor;
            //设置确定按钮的字体颜色
            datePickManager.confirmButtonTextColor = MainColor;
            //设置线条的颜色
            datePicker.lineBackgroundColor = MainColor;
        }
        [self presentViewController:datePickManager animated:false completion:nil];
    }
}

#pragma PGDatePickerDelegate
- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    NSLog(@"dateComponents = %@", dateComponents);
    NSString * monthStr;
    NSString * dayStr;
    if (dateComponents.month < 10) {
        monthStr = [NSString stringWithFormat:@"0%ld",dateComponents.month];
    }else{
        monthStr = [NSString stringWithFormat:@"%ld",dateComponents.month];
    }
    if (dateComponents.day < 10) {
        dayStr = [NSString stringWithFormat:@"0%ld",dateComponents.day];
    }else{
        dayStr = [NSString stringWithFormat:@"%ld",dateComponents.day];
    }
    NSString * dateStr = [NSString stringWithFormat:@"%ld-%@-%@",dateComponents.year,monthStr,dayStr];
    NSLog(@"SelectDateStr = %@",dateStr);
    [_contentArray replaceObjectAtIndex:6 withObject:dateStr];
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:6 inSection:0];
    [_infoTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}
- (void)doneButton:(UIButton *)btn
{
    
    
    if ([_nameTF.text isEqualToString:@""] || _nameTF.text.length == 0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入姓名" duration:MBProgressHUDDuration];
        return;
    }else{
        NSString *str = [_nameTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([str isEqualToString:@""] || str.length == 0) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入姓名" duration:MBProgressHUDDuration];
            _nameTF.text = @"";
            return ;
        }
    }
    
    if ([_nameTF.text containsString:@" "]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"姓名中不能包含空格" duration:MBProgressHUDDuration];
        return;
    }
    
    if ([_contentArray[2] isEqualToString:@"请选择性别"]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择性别" duration:MBProgressHUDDuration];
        return;
    }
    
    //身份证号检测
    if ([_idCardTF.text isEqualToString:@""] || _idCardTF.text.length == 0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入身份证号码" duration:MBProgressHUDDuration];
        return;
    }else{
        NSString *str = [_idCardTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([str isEqualToString:@""] || str.length == 0) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入身份证号码" duration:MBProgressHUDDuration];
            _idCardTF.text = @"";
            return;
        }
    }
    
    if ([_idCardTF.text containsString:@" "]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入正确格式的身份证号码" duration:MBProgressHUDDuration];
        return;
    }
    
    if ([_contentArray[6] isEqualToString:@"请选择有效日期"]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择有效日期" duration:MBProgressHUDDuration];
        return;
    }

    NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken,@"name":_nameTF.text,@"sex":_contentArray[2],@"identityCard":_idCardTF.text,@"cardTime":_contentArray[6]};
    NSLog(@"认证 Paeament= %@",dic);
    UpLoadIDCardViewController * cardVC = [[UpLoadIDCardViewController alloc] init];
    cardVC.paraments = dic;
    [self.navigationController pushViewController:cardVC animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_nameTF resignFirstResponder];
    [_idCardTF resignFirstResponder];
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
