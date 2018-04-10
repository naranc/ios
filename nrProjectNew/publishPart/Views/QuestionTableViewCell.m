//
//  QuestionTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/25.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "QuestionTableViewCell.h"
#import "QuestionModel.h"

@interface QuestionTableViewCell ()

@property (nonatomic, strong) NSIndexPath * indexPath;

@end

@implementation QuestionTableViewCell

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
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.answerButton];
    }
    return self;
}
- (UIButton *)answerButton
{
    if (!_answerButton) {
        _answerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _answerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _answerButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        [_answerButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _answerButton.layer.borderWidth = 0.5f;
        _answerButton.layer.cornerRadius = 21/2;
        _answerButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
        _answerButton.clipsToBounds = YES;
        _answerButton.tag = 1003;
        [_answerButton addTarget:self action:@selector(clickAnswerSelect:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _answerButton;
}
- (void)clickAnswerSelect:(UIButton *)btn
{
    [_delegate selectAnswerWithIndexPath:_indexPath];
}
- (void)layoutSubviews
{
//    _answerButton.frame = CGRectMake(15, 10, SCREEN_WIDTH - 30, 21);
}
- (void)setAnswerButtonText:(Answer *)answer indexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    CGRect rect = [[GlobalSingleton Singleton] getWidthWithText:answer.optionTitle higth:21 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
    
    _answerButton.frame = CGRectMake(15, 6, rect.size.width + 20, 21);
    
    [_answerButton setTitle:answer.optionTitle forState:UIControlStateNormal];
    
    if (answer.answerIsSelect) {
        _answerButton.backgroundColor = MainColor;
        [_answerButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _answerButton.layer.borderColor = MainColor.CGColor;
    }else{
        _answerButton.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        [_answerButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _answerButton.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
    }
    
}
@end
