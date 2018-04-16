//
//  BookInfoTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookInfoTableViewCell.h"

@implementation BookInfoTableViewCell

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
        self.backgroundColor = kUIColorFromRGB(0xffffff);
        [self addSubview:self.bookInfottTitleL];
        [self addSubview:self.bookInfoTF];
        [self addSubview:self.lineView];
    }
    return self;
}
- (UILabel *)bookInfottTitleL
{
    if (!_bookInfottTitleL) {
        _bookInfottTitleL = [[UILabel alloc] init];
        _bookInfottTitleL.frame = CGRectMake(15, 16, 30, 21);
        _bookInfottTitleL.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _bookInfottTitleL.textColor = kUIColorFromRGB(0x333333);
    }
    return _bookInfottTitleL;
}
- (UITextField *)bookInfoTF
{
    if (!_bookInfoTF) {
        UIFont * tfFont = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _bookInfoTF = [[UITextField alloc] init];
        _bookInfoTF.frame = CGRectMake(_bookInfottTitleL.right + 20, 16, SCREEN_WIDTH - 30 - 30 - 20, 21);
//        _bookInfoTF.placeholder = @"添加标题";
        _bookInfoTF.font = tfFont;
        _bookInfoTF.returnKeyType = UIReturnKeyDone;
//        _bookInfoTF.delegate = self;
        _bookInfoTF.backgroundColor =kUIColorFromRGB(0xFFFFFF);
        _bookInfoTF.textColor = kUIColorFromRGB(0x999999);
//        _bookInfoTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)];
//        _bookInfoTF.leftViewMode = UITextFieldViewModeAlways;
//        _bookInfoTF.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)];
//        _bookInfoTF.rightViewMode = UITextFieldViewModeAlways;
        
    }
    return _bookInfoTF;
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.frame = CGRectMake(0, 49, SCREEN_WIDTH, 1);
        _lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineView;
}
- (void)setBookInfoCellTitleAndContent:(NSString *)title content:(NSString *)content indexPath:(NSIndexPath *)indexPath
{
    _bookInfottTitleL.text = title;
    _bookInfoTF.placeholder = content;
}

@end
