//
//  PersonalInfoDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PersonalInfoDetailViewController.h"
#import "PInfoDetailCell.h"
static NSString * cellitifter1 = @"personalInfo1";
static NSString * cellitifter2 = @"personalInfo2";

@interface PersonalInfoDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * infoTableView;

@property (nonatomic, strong) NSArray * titleArray;

@property (nonatomic, strong) UIImageView * fowordImageView;

@property (nonatomic, strong) UIImageView * userImageView;

@end

@implementation PersonalInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"个人资料"];
    

    _titleArray = @[@"昵称",@"性别",@"联系方式",@"生日",@"地区",@"个性签名"];
    
    [self.view addSubview:self.infoTableView];
    
}
- (UIImageView *)fowordImageView
{
    if (!_fowordImageView) {
        _fowordImageView = [[UIImageView alloc] init];
        _fowordImageView.frame = CGRectMake(SCREEN_WIDTH - 15 - 6.4, 33, 6.4, 14.1);
        _fowordImageView.image = [UIImage imageNamed:@"me_forword"];
    }
    return _fowordImageView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView ){
        _userImageView = [[UIImageView alloc] init];
        _userImageView.frame = CGRectMake(_fowordImageView.left - 24 - 48, 16, 48, 48);
        _userImageView.layer.cornerRadius = 24.0f;
        _userImageView.clipsToBounds = YES;
        _userImageView.image = [UIImage imageNamed:@"zw_morentouxiang"];
    }
    return _userImageView;
}
- (UITableView *)infoTableView
{
    if (!_infoTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _infoTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _infoTableView.delegate = self;
        _infoTableView.dataSource = self;
        _infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _infoTableView.showsVerticalScrollIndicator = NO;
        _infoTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _infoTableView.estimatedRowHeight = 0;
        _infoTableView.estimatedSectionHeaderHeight = 0;
        _infoTableView.estimatedSectionFooterHeight = 0;
    }
    return _infoTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        if (indexPath.row == 1) {
            cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
            cell.textLabel.textColor = kUIColorFromRGB(0x666666);
            cell.textLabel.text = @"头像";
            cell.backgroundColor = kUIColorFromRGB(0xFFFFFF);
            [cell addSubview:self.fowordImageView];
            [cell addSubview:self.userImageView];
        }else{
            cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        }
        return cell;
    }else{
        PInfoDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
        if (!cell) {
            cell = [[PInfoDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2];
        }
        cell.titleLabel.text = _titleArray[indexPath.row - 3];
        cell.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        return cell;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 2) {
        return 12;
    }else if(indexPath.row == 1){
        return 80;
    }else{
        return 46;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
