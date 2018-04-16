//
//  BookIntroView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookIntroView.h"
#define LEFT 23


@implementation BookIntroView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
     
        self.picImageView.frame = CGRectMake(12, 11, 100, 150);
        [self addSubview:_picImageView];
        

        self.bookNameLabel.frame = CGRectMake(_picImageView.right + LEFT, 14, SCREEN_WIDTH - 30 - 124 - LEFT - 70, 24);
        [self addSubview:_bookNameLabel];

        
        self.bookauthorLabel.frame = CGRectMake(_picImageView.right + LEFT, _bookNameLabel.bottom + 4, _bookNameLabel.width, 20);
        [self addSubview:_bookauthorLabel];

        
        self.donateLabel.frame = CGRectMake(_picImageView.right + LEFT, _bookauthorLabel.bottom + 12, 55, 20);
        [self addSubview:_donateLabel];

        
        self.userImageView.frame = CGRectMake(_donateLabel.right, _bookauthorLabel.bottom + 12, 80, 20);
        [self addSubview:_userImageView];

        
        self.borrowButton.frame = CGRectMake(SCREEN_WIDTH - 30 - 70, 14, 58, 25);
        [self addSubview:_borrowButton];

        
        self.gradeLabel.frame = CGRectMake(_picImageView.right + LEFT, _donateLabel.bottom + 13, 40, 30);
        [self addSubview:_gradeLabel];

        
        self.starView.frame = CGRectMake(_picImageView.right + LEFT, _gradeLabel.bottom, 50, 8);
        [self addSubview:_starView];

        
        self.verticalImageView.frame = CGRectMake(_picImageView.right + 91, _donateLabel.bottom + 16, 1, 35);
        [self addSubview:_verticalImageView];

        
        self.reviewerButton.frame = CGRectMake(_verticalImageView.right + 18, _donateLabel.bottom + 24, 55, 20);
        [self addSubview:_reviewerButton];

        
        self.horizontalImageView.frame = CGRectMake(12, _picImageView.bottom + 12, SCREEN_WIDTH - 30 - 24, 1);
        [self addSubview:_horizontalImageView];

        
        self.statusButton.frame = CGRectMake(12, _horizontalImageView.bottom + 9, (SCREEN_WIDTH -24)/2, 20);
        [self addSubview:_statusButton];

        
        self.locationButton.frame = CGRectMake(SCREEN_WIDTH - 30 - 12 - 55, _horizontalImageView.bottom + 8, 55, 20);
        [self addSubview:_locationButton];
        
    }
    return self;
}
//图书图片
- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.image = [UIImage imageNamed:@"bookImage.png"];
        _picImageView.contentMode = UIViewContentModeScaleAspectFill;
        _picImageView.clipsToBounds = YES;
    }
    return _picImageView;
}


- (UILabel *)bookNameLabel
{
    if (!_bookNameLabel) {
        _bookNameLabel = [[UILabel alloc] init];
        _bookNameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
        _bookNameLabel.textColor = kUIColorFromRGB(0x333333);
        _bookNameLabel.text = @"红楼梦";
    }
    return _bookNameLabel;
}
- (UIButton *)borrowButton
{
    if(!_borrowButton){
        _borrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_borrowButton setTitle:@"借阅卡" forState:UIControlStateNormal];
        [_borrowButton setTitleColor:kUIColorFromRGB(0x000000) forState:UIControlStateNormal];
    }
    return _borrowButton;
}
- (UILabel *)bookauthorLabel
{
    if (!_bookauthorLabel) {
        _bookauthorLabel = [[UILabel alloc] init];
        _bookauthorLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _bookauthorLabel.textColor = kUIColorFromRGB(0x999999);
        _bookauthorLabel.text = @"作者：曹雪芹";
    }
    return _bookauthorLabel;
}

- (UILabel *)donateLabel
{
    if (!_donateLabel) {
        _donateLabel = [[UILabel alloc] init];
        _donateLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _donateLabel.textColor = kUIColorFromRGB(0x333333);
        _donateLabel.text = @"捐赠者：";
    }
    return _donateLabel;
}

- (ImageTextButton *)userImageView
{
    if (!_userImageView) {
        _userImageView = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _userImageView.midSpacing = 4;
        _userImageView.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _userImageView.imageSize = CGSizeMake(20, 20);
        _userImageView.imageView.layer.cornerRadius = 20/2;
        _userImageView.imageView.clipsToBounds = YES;
        [_userImageView setTitle:@"大道希音" forState:UIControlStateNormal];
        [_userImageView setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _userImageView.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_userImageView setImage:[UIImage imageNamed:@"userimagePic.jpg"] forState:UIControlStateNormal];
    }
    return _userImageView;
}


- (UILabel *)gradeLabel
{
    if (!_gradeLabel) {
        _gradeLabel = [[UILabel alloc] init];
        _gradeLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:22];
        _gradeLabel.textColor = kUIColorFromRGB(0x6FBBFF);
        _gradeLabel.text = @"4.8分";
    }
    return _gradeLabel;
}


- (UIView *)starView
{
    if (!_starView) {
        _starView = [[UIView alloc] init];
    }
    return _starView;
}

- (UIImageView *)verticalImageView
{
    if (!_verticalImageView) {
        _verticalImageView = [[UIImageView alloc] init];
        _verticalImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _verticalImageView;
}


- (ImageTextButton *)reviewerButton
{
    if (!_reviewerButton) {
        _reviewerButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _reviewerButton.midSpacing = 8;
        _reviewerButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _reviewerButton.imageSize = CGSizeMake(15, 15);
        _reviewerButton.imageView.layer.cornerRadius = 15/2;
        _reviewerButton.imageView.clipsToBounds = YES;
        [_reviewerButton setTitle:@"书评" forState:UIControlStateNormal];
        [_reviewerButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _reviewerButton.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_reviewerButton setImage:[UIImage imageNamed:@"userimagePic.jpg"] forState:UIControlStateNormal];
        [_reviewerButton addAction:^(UIButton *btn) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ClickBookCommentNSNotification" object:nil];
        }];
    }
    return _reviewerButton;
}

- (UIImageView *)horizontalImageView
{
    
    if (!_horizontalImageView) {
        _horizontalImageView = [[UIImageView alloc] init];
        _horizontalImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _horizontalImageView;
}
- (ImageTextButton *)statusButton
{
    if (!_statusButton) {
        _statusButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _statusButton.midSpacing = 8;
        _statusButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _statusButton.imageSize = CGSizeMake(15, 15);
        _statusButton.imageView.layer.cornerRadius = 15/2;
        _statusButton.imageView.clipsToBounds = YES;
        [_statusButton setTitle:@"爱如繁星在借阅中…" forState:UIControlStateNormal];
        [_statusButton setTitleColor:kUIColorFromRGB(0x6FBBFF) forState:UIControlStateNormal];
        _statusButton.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_statusButton setImage:[UIImage imageNamed:@"userimagePic.jpg"] forState:UIControlStateNormal];
        
    }
    return _statusButton;
}
- (ImageTextButton *)locationButton
{
    if (!_locationButton) {
        _locationButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _locationButton.midSpacing = 5;
        _locationButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _locationButton.imageSize = CGSizeMake(15, 15);
        [_locationButton setTitle:@"23km" forState:UIControlStateNormal];
        [_locationButton setTitleColor:kUIColorFromRGB(0x6FBBFF) forState:UIControlStateNormal];
        _locationButton.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_locationButton setImage:[UIImage imageNamed:@"list_icon_weizhi"] forState:UIControlStateNormal];
    }
    return _locationButton;
}

@end
