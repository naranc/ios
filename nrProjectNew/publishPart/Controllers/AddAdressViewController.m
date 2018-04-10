//
//  AddAdressViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AddAdressViewController.h"
#import "AddAdressTableViewCell.h"
#import "BRPickerView.h"
#import "AdressModel.h"
#import "Utils.h"

static NSString * cellitifter1 = @"cellitifter1";
static NSString * cellitifter2 = @"cellitifter2";
static NSString * cellitifter3 = @"cellitifter3";

@interface AddAdressViewController ()<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate, UIAlertViewDelegate>
{
    AddAdressTableViewCell * cell1;
    AddAdressTableViewCell * cell2;
    AddAdressTableViewCell * cell4;
}
@property (nonatomic, strong)UITableView * addadressTableView;

@property (nonatomic, strong)NSArray * inputTitleArray;

@property (nonatomic, strong)NSArray * inputTFArray;

@property (nonatomic, strong)UIButton * defaultButton;

@property (nonatomic, strong)UIButton * areaButton;

@property (nonatomic, strong)NSArray * areaArray;

@end

@implementation AddAdressViewController
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    
    if (!cell1) {
        
        NSIndexPath * indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
        cell1 = [_addadressTableView cellForRowAtIndexPath:indexPath1];
        
        NSIndexPath * indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
        cell2 = [_addadressTableView cellForRowAtIndexPath:indexPath2];
        
        NSIndexPath * indexPath4 = [NSIndexPath indexPathForRow:4 inSection:0];
        cell4 = [_addadressTableView cellForRowAtIndexPath:indexPath4];
    }
    [cell1.inputTF resignFirstResponder];
    [cell2.inputTF resignFirstResponder];
    [cell4.inputTF resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:_viewTitle];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    

    
    if ([_viewTitle isEqualToString:@"编辑地址"]) {
        [self.customNavBar wr_setRightButtonWithTitle:@"保存" titleColor:kUIColorFromRGB(0x333333)];
    }

    self.customNavBar.onClickRightButton = ^{
        
        if (!cell1) {
            
            NSIndexPath * indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
            cell1 = [_addadressTableView cellForRowAtIndexPath:indexPath1];
            
            NSIndexPath * indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
            cell2 = [_addadressTableView cellForRowAtIndexPath:indexPath2];
            
            NSIndexPath * indexPath4 = [NSIndexPath indexPathForRow:4 inSection:0];
            cell4 = [_addadressTableView cellForRowAtIndexPath:indexPath4];
        }
        //检查每个输入框
        //name
        if ([cell1.inputTF.text isEqualToString:@""]) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入姓名" duration:MBProgressHUDDuration];
            return;
        }
        //phone
        if (![Utils checkTellNumber:cell2.inputTF.text]) {
                [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写有效的手机号码" duration:MBProgressHUDDuration];
                return;
        }
        //area
        if ([_areaButton.titleLabel.text isEqualToString:@""]) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择所在地区" duration:MBProgressHUDDuration];
            return;
        }
        //adress
        if ([cell4.inputTF.text isEqualToString:@""]) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写详细地址" duration:MBProgressHUDDuration];
            return;
        }
        //所有信息填写完整，请求api
        BOOL isNow = _defaultButton.selected;
        NSString * province;
        NSString * city;
        NSString *county;
        if (_areaArray.count) {
            province = _areaArray[0];
            city = _areaArray[1];
            county = _areaArray[2];
        }else{
            province = _adressModel.province;
            city = _adressModel.city;
            county = _adressModel.county;
        }
        NSDictionary * adressDic = @{@"accessToken":[UserModel getUser].accessToken,@"mailId":_adressModel.mailId,@"nowMail":@(isNow), @"mailName":cell1.inputTF.text,@"mailPhone":cell2.inputTF.text,@"province":province,@"city":city,@"county":county,@"mailAddress":cell4.inputTF.text};
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [AdressModel addAdresstWithParament:adressDic success:^(NSDictionary *dic) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"dic%@ --- %@",dic,dic[@"msg"]);
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationAddAdressSuccess" object:nil];
            [self.navigationController popViewControllerAnimated:YES];
        } withFailureBlock:^(NSError *error) {
            NSLog(@"%@",error)
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    };
    
    //新增地址会显示新增按钮
    if (![_viewTitle isEqualToString:@"编辑地址"]) {
        UIButton * addButton = [UIButton buttonWithType:UIButtonTypeSystem];
        addButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        [addButton setTitle:@"添加地址" forState:UIControlStateNormal];
        addButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [addButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
        addButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
        [self.view addSubview:addButton];
    }
    
    
    _inputTitleArray = @[@"收货人",@"手机号码",@"所在地区",@"详细地址"];
    if (_adressModel) {
        NSString * areaString = [NSString stringWithFormat:@"%@%@%@",_adressModel.province, _adressModel.city, _adressModel.county];
        _inputTFArray = @[_adressModel.mailName,_adressModel.mailPhone, areaString, _adressModel.mailAddress];
    }
    
    [self.view addSubview:self.addadressTableView];
}
- (void)addButton:(UIButton *)btn
{
    [self addAdress];
}
- (UIButton *)areaButton
{
    if (!_areaButton) {
        _areaButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _areaButton.frame = CGRectMake(15 + 65 + 30, 3, SCREEN_WIDTH - 30 - 65 - 30, 40);
        _areaButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];;
        [_areaButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _areaButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_areaButton addAction:^(UIButton *btn) {
            [self selectCity];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _areaButton;
}
- (UITableView *)addadressTableView
{
    if (!_addadressTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 49);
        _addadressTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _addadressTableView.delegate = self;
        _addadressTableView.dataSource = self;
        _addadressTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _addadressTableView.showsVerticalScrollIndicator = NO;
        _addadressTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _addadressTableView.tableFooterView = [UIView new];
        _addadressTableView.estimatedRowHeight = 0;
        _addadressTableView.estimatedSectionHeaderHeight = 0;
        _addadressTableView.estimatedSectionFooterHeight = 0;
    }
    return _addadressTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.row == 0 || indexPath.row == 5 || indexPath.row == 7) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        return cell;
    }else{
        if (indexPath.row == 1 ||indexPath.row == 2 ||indexPath.row == 3 ||indexPath.row == 4) {
            AddAdressTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
            if (!cell) {
                cell = [[AddAdressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = kUIColorFromRGB(0xFFFFFF);
            cell.inputLabel.text = _inputTitleArray[indexPath.row - 1];
            
            if (indexPath.row == 3) {
                [cell addSubview:self.areaButton];
            }
            
            if (_inputTFArray.count) {
                if (indexPath.row == 3) {
                    [_areaButton setTitle:_inputTFArray[indexPath.row - 1] forState:UIControlStateNormal];
                }else{
                    cell.inputTF.text = _inputTFArray[indexPath.row - 1];
                }
            }
            cell.inputTF.delegate = self;
            cell.inputTF.tag = indexPath.row + 1000;
            return cell;
        }else{
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter3];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter3];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = kUIColorFromRGB(0xFFFFFF);
            if (indexPath.row == 6) {
                if (_adressModel.nowMail) {
                    cell.textLabel.text = @"删除该地址";
                    cell.textLabel.textColor = kUIColorFromRGB(0xFF506F);
                }else{
                    cell.textLabel.text = @"设为默认地址";
                    cell.textLabel.textColor = kUIColorFromRGB(0x666666);
                    [cell addSubview:self.defaultButton];
                    if (_adressModel) {
                        if (_adressModel.nowMail) {
                            [_defaultButton setImage:[UIImage imageNamed:@"list_gou_pre"] forState:UIControlStateNormal];
                            _defaultButton.selected = YES;
                        }else{
                            [_defaultButton setImage:[UIImage imageNamed:@"list_gou"] forState:UIControlStateNormal];
                            _defaultButton.selected = NO;
                        }
                    }
                }
            }else{
                cell.textLabel.text = @"删除该地址";
                cell.textLabel.textColor = kUIColorFromRGB(0xFF506F);
            }
            cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
            return cell;
            
        }
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_viewTitle isEqualToString:@"编辑地址"]) {
        if (_adressModel.nowMail) {
            return 8;
        }else{
            return 9;
        }
    }else{
        return 8;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 5 || indexPath.row == 7) {
        return 12;
    }else{
        return  46;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_viewTitle isEqualToString:@"编辑地址"]) {
        if (indexPath.row == 8) {
            UIAlertView * alterView;
            if (!alterView) {
                alterView = [[UIAlertView alloc] initWithTitle:@"确定要删除该地址吗？" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            }
            [alterView show];
        }
        
        if (indexPath.row == 6 && _adressModel.nowMail) {
            UIAlertView * alterView;
            if (!alterView) {
                alterView = [[UIAlertView alloc] initWithTitle:@"确定要删除该地址吗？" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            }
            [alterView show];
        }
    }
    

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken,@"mailId":_adressModel.mailId};
        [AdressModel deleteAdressWithParament:dic success:^(NSDictionary *dic) {
            if ([dic[@"code"] isEqualToString:NormalStatus]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationAddAdressSuccess" object:nil];
                [self.navigationController popViewControllerAnimated:YES];
            }
        } withFailureBlock:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)defaultButton
{
    if (!_defaultButton) {
        _defaultButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _defaultButton.frame = CGRectMake(SCREEN_WIDTH - 35, 13, 20, 20);
        [_defaultButton setImage:[UIImage imageNamed:@"list_gou"] forState:UIControlStateNormal];
        [_defaultButton addTarget:self action:@selector(defaultButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _defaultButton;
}
- (void)defaultButton:(UIButton *)btn
{
    if (btn.selected) {
        [btn setImage:[UIImage imageNamed:@"list_gou"] forState:UIControlStateNormal];
        btn.selected = NO;
    }else{
        [btn setImage:[UIImage imageNamed:@"list_gou_pre"] forState:UIControlStateNormal];
        btn.selected = YES;
    }
    NSLog(@"selected  =  %d",btn.selected);
}
- (void)selectCity
{
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    AddAdressTableViewCell * cell = [_addadressTableView cellForRowAtIndexPath:indexPath];
    [BRAddressPickerView showAddressPickerWithDefaultSelected:@[@10, @0, @3] isAutoSelect:YES resultBlock:^(NSArray *selectAddressArr) {
        _areaArray = selectAddressArr;
        cell.inputTF.text = [NSString stringWithFormat:@"%@%@%@", selectAddressArr[0], selectAddressArr[1], selectAddressArr[2]];
    }];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1003) {
        [self.view endEditing:YES];
        [textField resignFirstResponder];
    }
}

- (void)addAdress
{
    if (!cell1) {
        NSIndexPath * indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
        cell1 = [_addadressTableView cellForRowAtIndexPath:indexPath1];
        NSIndexPath * indexPath2 = [NSIndexPath indexPathForRow:2 inSection:0];
        cell2 = [_addadressTableView cellForRowAtIndexPath:indexPath2];
        NSIndexPath * indexPath4 = [NSIndexPath indexPathForRow:4 inSection:0];
        cell4 = [_addadressTableView cellForRowAtIndexPath:indexPath4];
    }
    //检查每个输入框
    //name
    if ([cell1.inputTF.text isEqualToString:@""]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入姓名" duration:MBProgressHUDDuration];
        return;
    }
    //phone
    if (![Utils checkTellNumber:cell2.inputTF.text]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写有效的手机号码" duration:MBProgressHUDDuration];
        return;
    }
    //area
    if ([_areaButton.titleLabel.text isEqualToString:@""]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择所在地区" duration:MBProgressHUDDuration];
        return;
    }
    //adress
    if ([cell4.inputTF.text isEqualToString:@""]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写详细地址" duration:MBProgressHUDDuration];
        return;
    }
    //所有信息填写完整，请求api
    BOOL isNow = _defaultButton.selected;
    NSString * province;
    NSString * city;
    NSString *county;
    if (_areaArray.count) {
        province = _areaArray[0];
        city = _areaArray[1];
        county = _areaArray[2];
    }
    NSDictionary * adressDic = @{@"accessToken":[UserModel getUser].accessToken,@"nowMail":@(isNow), @"mailName":cell1.inputTF.text,@"mailPhone":cell2.inputTF.text,@"province":province,@"city":city,@"county":county,@"mailAddress":cell4.inputTF.text};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AdressModel addAdresstWithParament:adressDic success:^(NSDictionary *dic) {
        NSLog(@"dic%@ --- %@",dic,dic[@"msg"]);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifitercationAddAdressSuccess" object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"%@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
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
