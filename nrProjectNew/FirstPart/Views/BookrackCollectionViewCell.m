//
//  BookrackCollectionViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookrackCollectionViewCell.h"
#define imageSize 52
#define typeFont [UIFont fontWithName:@"PingFangSC-Medium" size:14]
@implementation BookrackCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self.contentView addSubview:self.bgImageView];
        [self.contentView addSubview:self.typeLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    
    _typeImageView.frame = CGRectMake(((SCREEN_WIDTH / 3)-80)/2, 24, 80, 120);
    _typeLabel.frame = CGRectMake(0, _typeImageView.bottom + 6, SCREEN_WIDTH / 3, 20);
}
- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = typeFont;
        _typeLabel.textColor = kUIColorFromRGB(0x333333);
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        _typeLabel.text = @"红楼梦";
    }
    return _typeLabel;
}
- (UIImageView *)bgImageView
{
    if (!_typeImageView) {
        _typeImageView = [[UIImageView alloc] init];
        _typeImageView.contentMode = UIViewContentModeScaleAspectFill;
        _typeImageView.clipsToBounds = YES;
        _typeImageView.image = [UIImage imageNamed:@"bitmap"];
    }
    return _typeImageView;
}
@end
