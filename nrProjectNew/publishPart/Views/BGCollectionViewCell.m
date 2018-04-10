//
//  BGCollectionViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/22.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "BGCollectionViewCell.h"

@implementation BGCollectionViewCell


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        [self.contentView addSubview:self.bgView];
        
        [self.contentView addSubview:self.bgImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    _bgView.frame = CGRectMake(0, 0, 79, 125);

    _bgImageView.frame = CGRectMake(3, 3, 73, 119);
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.clipsToBounds = YES;
        _bgImageView.backgroundColor = [UIColor whiteColor];
    }
    return _bgImageView;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
    }
    return _bgView;
}
@end
