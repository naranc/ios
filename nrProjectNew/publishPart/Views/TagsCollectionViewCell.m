//
//  TagsCollectionViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/9.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TagsCollectionViewCell.h"
#import "TagModel.h"

@implementation TagsCollectionViewCell

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
    
    _tagButton.frame = CGRectMake(24, 16, 50, 74);
}

- (ImageTextButton *)tagButton
{
    if (!_tagButton) {
        _tagButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _tagButton.midSpacing = 4;
        _tagButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        _tagButton.imageSize = CGSizeMake(50, 50);
        [_tagButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _tagButton.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_tagButton setImage:[UIImage imageNamed:@"fabu_btn_chongwuyongpin"] forState:UIControlStateNormal];
        [_tagButton setTitle:@"书籍" forState:UIControlStateNormal];
        _tagButton.userInteractionEnabled = NO;
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
- (void)configeCellWithTagModel:(TagModel *)model indexPath:(NSIndexPath *)indexPath
{
    _tagButton.tag = indexPath.row;
    [_tagButton setTitle:model.tagText forState:UIControlStateNormal];

    if (model.isSelect) {
        [_tagButton setTitleColor:MainColor forState:UIControlStateNormal];
        [_tagButton setImage:[UIImage imageNamed:model.tagSelectImageStr] forState:UIControlStateNormal];
    }else{
        [_tagButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        [_tagButton setImage:[UIImage imageNamed:model.tagUnSelectImageStr] forState:UIControlStateNormal];

    }
}

@end
