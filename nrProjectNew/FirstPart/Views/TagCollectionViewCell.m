//
//  TagCollectionViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/2/1.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TagCollectionViewCell.h"

@implementation TagCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
     
        [self addSubview:self.button];
    }
    return self;
}
- (UIButton *)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(0, 0, (SCREEN_WIDTH - 89 - 26) / 3, 36);
        _button.backgroundColor = kUIColorFromRGB(0xf0f0f0);
        _button.layer.cornerRadius = 4.0f;
        _button.clipsToBounds = YES;
        [_button setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        [_button addAction:^(UIButton *btn) {
            NSLog(@"%@",btn.titleLabel.text);
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (UIImageView *)imageView
{
    if (!_imageView) {
        
        
    }
    return _imageView;
}
@end
