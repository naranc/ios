//
//  PersonalCollectionViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PersonalCollectionViewCell.h"
#define typeFont [UIFont fontWithName:@"PingFangSC-Regular" size:12]

@implementation PersonalCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        [self.contentView addSubview:self.bgImageView];
        [self.contentView addSubview:self.typeLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    _typeImageView.frame = CGRectMake((((SCREEN_WIDTH-2)/3)-37)/2, 24, 37, 37);
    _typeLabel.frame = CGRectMake(0, _typeImageView.bottom + 4, (SCREEN_WIDTH -1)/ 3, 20);
}
- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = typeFont;
        _typeLabel.textColor = kUIColorFromRGB(0x999999);
        _typeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _typeLabel;
}
- (UIImageView *)bgImageView
{
    if (!_typeImageView) {
        _typeImageView = [[UIImageView alloc] init];
        _typeImageView.contentMode = UIViewContentModeCenter;
        _typeImageView.clipsToBounds = YES;
    }
    return _typeImageView;
}
@end
