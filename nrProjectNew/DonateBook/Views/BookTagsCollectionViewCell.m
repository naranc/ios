//
//  BookTagsCollectionViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookTagsCollectionViewCell.h"

@implementation BookTagsCollectionViewCell


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        [self.contentView addSubview:self.tagButton];
        
    }
    return self;
}

- (void)layoutSubviews
{
    
    _tagButton.frame = CGRectMake(12, 4, 71, 28);
}

- (UIButton *)tagButton
{
    if (!_tagButton) {
        _tagButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _tagButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        [_tagButton setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_tagButton setTitle:@"教育教科" forState:UIControlStateNormal];
        _tagButton.layer.borderWidth = 0.5f;
        _tagButton.layer.cornerRadius = 28/2;
        _tagButton.layer.borderColor = MainColor.CGColor;
        _tagButton.clipsToBounds = YES;
        [_tagButton addTarget:self action:@selector(clickTagButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tagButton;
}
- (void)clickTagButton:(ImageTextButton *)btn
{
    if (self.onClickTagButton) {
        self.onClickTagButton(btn.tag);
    }
}
- (void)configeCellWithTagModel:(NSString *)model indexPath:(NSIndexPath *)indexPath
{
    _tagButton.tag = indexPath.row;
    [_tagButton setTitle:model forState:UIControlStateNormal];
//    if (model.isSelect) {
//        [_tagButton setTitleColor:MainColor forState:UIControlStateNormal];
//    }else{
//        [_tagButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
//    }
}
@end
