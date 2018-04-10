//
//  TimeTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/25.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "TimeTableViewCell.h"

@interface TimeTableViewCell ()

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UIButton * allDayButton;

@property (nonatomic, strong) UIButton * holidayButton;

@property (nonatomic, strong) UIButton * workdayButton;

@end   

@implementation TimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.allDayButton];
        [self addSubview:self.holidayButton];
        [self addSubview:self.workdayButton];
    }
    return self;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"方便时间";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titleLabel;
}

- (UIButton *)allDayButton
{
    if (!_allDayButton) {
        _allDayButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_allDayButton setTitle:@"全天" forState:UIControlStateNormal];
        _allDayButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _allDayButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _allDayButton.backgroundColor = kUIColorFromRGB(0x666666);
        [_allDayButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _allDayButton.layer.borderWidth = 0.5f;
        _allDayButton.layer.cornerRadius = 17/2;
        _allDayButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _allDayButton.clipsToBounds = YES;
        _allDayButton.tag = 1001;
        [_allDayButton addTarget:self action:@selector(clickTimeSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allDayButton;
}

- (UIButton *)holidayButton
{
    if (!_holidayButton) {
        _holidayButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_holidayButton setTitle:@"节假日" forState:UIControlStateNormal];
        _holidayButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _holidayButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_holidayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _holidayButton.layer.borderWidth = 0.5f;
        _holidayButton.layer.cornerRadius = 17/2;
        _holidayButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _holidayButton.clipsToBounds = YES;
        _holidayButton.tag = 1002;
        [_holidayButton addTarget:self action:@selector(clickTimeSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _holidayButton;
}
- (UIButton *)workdayButton
{
    if (!_workdayButton) {
        _workdayButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_workdayButton setTitle:@"工作日" forState:UIControlStateNormal];
        _workdayButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _workdayButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        [_workdayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _workdayButton.layer.borderWidth = 0.5f;
        _workdayButton.layer.cornerRadius = 17/2;
        _workdayButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _workdayButton.clipsToBounds = YES;
        _workdayButton.tag = 1003;
        [_workdayButton addTarget:self action:@selector(clickTimeSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _workdayButton;
}
- (void)layoutSubviews
{
    _titleLabel.frame = CGRectMake(15, 16, 70, 21);
    
    _allDayButton.frame = CGRectMake(15, _titleLabel.bottom + 13, 40, 17);
    
    _holidayButton.frame = CGRectMake(_allDayButton.right + 16, _titleLabel.bottom + 13, 52, 17);

    _workdayButton.frame = CGRectMake(_holidayButton.right + 16, _titleLabel.bottom + 13, 52, 17);

}
- (void)clickTimeSelect:(UIButton *)btn
{
    if (btn.tag == 1001) {
        _allDayButton.backgroundColor = kUIColorFromRGB(0x666666);
        _holidayButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _workdayButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        [_allDayButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_holidayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_workdayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];

    }else if (btn.tag == 1002){
        _allDayButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _holidayButton.backgroundColor = kUIColorFromRGB(0x666666);
        _workdayButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        [_allDayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_holidayButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_workdayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
    }else{
        _allDayButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _holidayButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _workdayButton.backgroundColor = kUIColorFromRGB(0x666666);
        [_allDayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_holidayButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [_workdayButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
    }
}
@end
