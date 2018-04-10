//
//  HelpProtocolTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "HelpProtocolTableViewCell.h"

@implementation HelpProtocolTableViewCell

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
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSString * text = @"我已阅读并同意《服务协议》查看协议";
        
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageButton.frame = CGRectMake(15, 12, 20, 20);
        
        [_imageButton setBackgroundImage:[UIImage imageNamed:@"list_gou_pre"] forState:UIControlStateNormal];
        
        _imageButton.backgroundColor = [UIColor clearColor];
        [_imageButton setSelected:YES];
        [self addSubview:_imageButton];
        [_imageButton addAction:^(UIButton *btn) {
            if (!btn.isSelected) {
                [btn setBackgroundImage:[UIImage imageNamed:@"list_gou_pre"] forState:UIControlStateNormal];
                [btn setSelected:YES];
            }else{
                [btn setBackgroundImage:[UIImage imageNamed:@"list_gou"] forState:UIControlStateNormal];
                [btn setSelected:NO];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        
        CGRect rect = [[GlobalSingleton Singleton] getWidthWithText:text higth:20 font:font];
        UIButton * textButton = [UIButton buttonWithType:UIButtonTypeCustom];
        textButton.frame = CGRectMake(_imageButton.right + 7, 14, rect.size.width, 17);
        textButton.backgroundColor = [UIColor clearColor];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
        [str addAttribute:NSForegroundColorAttributeName value:kUIColorFromRGB(0x333333) range:NSMakeRange(0,13)];
        [textButton setAttributedTitle:str forState:UIControlStateNormal];
        [textButton setTitle:text forState:UIControlStateNormal];
        textButton.titleLabel.font = font;
        textButton.titleLabel.textColor = kUIColorFromRGB(0x4A90E2);
        
        [self addSubview:textButton];
        [textButton addAction:^(UIButton *btn) {
            [_delegate pushWebView];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
