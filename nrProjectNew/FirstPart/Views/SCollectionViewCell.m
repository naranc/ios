//
//  SCollectionViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "SCollectionViewCell.h"
#define imageSize 52
#define typeFont [UIFont fontWithName:@"PingFangSC-Regular" size:12]

@implementation SCollectionViewCell


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
    _typeImageView.frame = CGRectMake(((SCREEN_WIDTH/4)-imageSize)/2, 0, imageSize, imageSize);
    _typeLabel.frame = CGRectMake(0, _typeImageView.bottom + 6, SCREEN_WIDTH / 4, 17);
}
- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = typeFont;
        _typeLabel.textColor = kUIColorFromRGB(0x666666);
        _typeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _typeLabel;
}
- (UIImageView *)bgImageView
{
    if (!_typeImageView) {
        _typeImageView = [[UIImageView alloc] init];
        _typeImageView.contentMode = UIViewContentModeScaleAspectFill;
        _typeImageView.clipsToBounds = YES;
    }
    return _typeImageView;
}
@end
