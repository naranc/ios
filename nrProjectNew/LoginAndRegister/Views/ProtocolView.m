//
//  ProtocolView.m
//  naran
//
//  Created by 那然 on 2017/3/8.
//  Copyright © 2017年 那然. All rights reserved.
//

#import "ProtocolView.h"

@implementation ProtocolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame text:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageButton.frame = CGRectMake(0, 2, 16, 16);
        
        [_imageButton setBackgroundImage:[UIImage imageNamed:@"xuankuang－gou"] forState:UIControlStateNormal];
        
        _imageButton.backgroundColor = [UIColor clearColor];
        [_imageButton setSelected:YES];
        [self addSubview:_imageButton];
        [_imageButton addAction:^(UIButton *btn) {
            if (!btn.isSelected) {
                [btn setBackgroundImage:[UIImage imageNamed:@"xuankuang－gou"] forState:UIControlStateNormal];
                [btn setSelected:YES];
            }else{
                [btn setBackgroundImage:[UIImage imageNamed:@"xuankuang"] forState:UIControlStateNormal];
                [btn setSelected:NO];
            }
        } forControlEvents:UIControlEventTouchUpInside];

        UIFont * font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];

        CGRect rect = [[GlobalSingleton Singleton] getWidthWithText:text higth:20 font:font];
        UIButton * textButton = [UIButton buttonWithType:UIButtonTypeCustom];
        textButton.frame = CGRectMake(_imageButton.right + 7, 0, rect.size.width, 20);
        textButton.backgroundColor = [UIColor clearColor];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
        NSRange strRange = {7, [str length] - 7};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        [str addAttribute:NSForegroundColorAttributeName value:kUIColorFromRGB(0x999999) range:NSMakeRange(0,7)];
        [textButton setAttributedTitle:str forState:UIControlStateNormal];
        [textButton setTitle:text forState:UIControlStateNormal];
        textButton.titleLabel.font = font;
        textButton.titleLabel.textColor = kUIColorFromRGB(0x151515);

        [self addSubview:textButton];
        [textButton addAction:^(UIButton *btn) {
            [_delegate pushWebView];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
@end
