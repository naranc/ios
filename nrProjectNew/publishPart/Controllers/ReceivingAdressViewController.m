//
//  ReceivingAdressViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/22.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "ReceivingAdressViewController.h"
#import "TimeTableViewCell.h"
#import "CarryTableViewCell.h"
#import "AdressListViewController.h"

static NSString * cellitifter0 = @"cellitifter0";
static NSString * cellitifter1 = @"cellitifter1";
static NSString * cellitifter2 = @"cellitifter2";

@interface ReceivingAdressViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * recevingTBView;

@property (nonatomic, strong) ImageTextButton * anonyButton;

@end

@implementation ReceivingAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.customNavBar setTitle:_titleStr];

    UIButton * doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    doneButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    [doneButton setTitle:@"发布" forState:UIControlStateNormal];
    doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    [doneButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    doneButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
    [self.view addSubview:doneButton];
    

    
    [self.view addSubview:self.recevingTBView];
    
    
}
- (UITableView *)recevingTBView
{
    if (!_recevingTBView) {
        _recevingTBView = [[UITableView alloc] init];
        _recevingTBView.dataSource = self;
        _recevingTBView.delegate = self;
        _recevingTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _recevingTBView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _recevingTBView;
}
- (ImageTextButton *)anonyButton
{
    if (!_anonyButton) {
        _anonyButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _anonyButton.frame = CGRectMake(15, 14, 46, 21);
        _anonyButton.midSpacing = 4;
        _anonyButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _anonyButton.imageSize = CGSizeMake(12, 12);
        [_anonyButton setTitle:@"匿名" forState:UIControlStateNormal];
        [_anonyButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _anonyButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_anonyButton setSelected:NO];
        [_anonyButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
        [_anonyButton addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _anonyButton;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 6) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
        }
        cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        if (indexPath.row == 1) {
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
            }
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 3) {
            TimeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
            if (!cell) {
                cell = [[TimeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
            }
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            return cell;
        }else if(indexPath.row == 5){
            CarryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
            if (!cell) {
                cell = [[CarryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
            }
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
            }
            [cell addSubview:self.anonyButton];
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            return cell;

        }
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 6) {
        if (indexPath.row == 0) {
            return 12;
        }else{
            return 27;
        }
    }else if (indexPath.row == 1){
        return 109;
    }else if (indexPath.row == 3){
        return 88;
    }else{
        return 49;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        AdressListViewController * adressVC = [[AdressListViewController alloc] init];
        [self.navigationController pushViewController:adressVC animated:YES];
    }
}
- (void)doneButton:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)publishWishButton:(UIButton *)btn
{
    if (btn.isSelected) {
        [btn setSelected:NO];
        [_anonyButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
    }else{
        [btn setSelected:YES];
        [_anonyButton setImage:[UIImage imageNamed:@"zan_green_s"] forState:UIControlStateNormal];
    }
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

    _recevingTBView.frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - 49 - top);
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
