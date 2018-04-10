//
//  TaskDoneViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/24.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TaskDoneViewController.h"
#import "OrderDoneView.h"

@interface TaskDoneViewController ()

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * fImageView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * subTitleLabel;

@property (nonatomic, strong) OrderDoneView * expView;

@property (nonatomic, strong) OrderDoneView * loveView;

@property (nonatomic, strong) UIButton * doneButton;

@end

@implementation TaskDoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.customNavBar setTitle:@"援助任务"];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    self.bgView.frame = CGRectMake(0, top + 1, SCREEN_WIDTH, SCREEN_HEIGHT - top - 1);
    [self.view addSubview:_bgView];
    
    self.doneButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    [self.view addSubview:_doneButton];
    
    self.fImageView.frame = CGRectMake((SCREEN_WIDTH - 65.9) / 2, 51, 65.9, 98.3);
    [_bgView addSubview:_fImageView];
    
    self.titleLabel.frame = CGRectMake(15, _fImageView.bottom + 16, SCREEN_WIDTH - 30, 24);
    [_bgView addSubview:_titleLabel];
    
    self.subTitleLabel.frame = CGRectMake(15, _titleLabel.bottom, SCREEN_WIDTH - 30, 24);
    [_bgView addSubview:_subTitleLabel];
    
   
    [_bgView addSubview:self.expView];
    [_bgView addSubview:self.loveView];
    _expView.dImageView.image = [UIImage imageNamed:@"wancheng_icon_jingyanzhi"];
    _loveView.dImageView.image = [UIImage imageNamed:@"wancheng_icon_aixinzhi"];
    _expView.dTitleLabel.text = @"经验值";
    _loveView.dTitleLabel.text = @"爱心值";
    
    _expView.contentLabel.text = @"+100";
    _loveView.contentLabel.text = @"+100";
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}
- (UIImageView *)fImageView
{
    if (!_fImageView) {
        _fImageView = [[UIImageView alloc] init];
        _fImageView.image = [UIImage imageNamed:@"icon_chengzhifengshang"];
    }
    return _fImageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:17];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"辛苦了！任务结束后我们";
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:17];
        _subTitleLabel.textColor = kUIColorFromRGB(0x666666);
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.text = @"将诚挚奉上～";
    }
    return _subTitleLabel;
}

- (OrderDoneView *)expView
{
    if (!_expView) {
        _expView = [[OrderDoneView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 202 - 32) / 2, _subTitleLabel.bottom + 33, 101, 101)];
    }
    return _expView;
}
- (OrderDoneView *)loveView
{
    if (!_loveView) {
        _loveView = [[OrderDoneView alloc] initWithFrame:CGRectMake(_expView.right + 32, _subTitleLabel.bottom + 33, 101, 101)];
    }
    return _loveView;
}
- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _doneButton.backgroundColor = MainColor;
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        [_doneButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    }
    return _doneButton;
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
