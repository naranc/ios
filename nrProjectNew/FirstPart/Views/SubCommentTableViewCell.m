//
//  SubCommentTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SubCommentTableViewCell.h"
#import "CommentModel.h"

@interface SubCommentTableViewCell ()

@property (nonatomic, strong) UIImageView * lineImageView;

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * namelabel;

@property (nonatomic, strong) UILabel * contentLabel;

@end

@implementation SubCommentTableViewCell

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
        
        [self addSubview:self.lineImageView];
        [self addSubview:self.userImageView];
        [self addSubview:self.namelabel];
        [self addSubview:self.contentLabel];
    }
    return self;
}
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.frame = CGRectMake(48, 0, 0.5, 30);
        _lineImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineImageView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.frame = CGRectMake(63, 6, 30, 30);
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.clipsToBounds = YES;
        _userImageView.layer.cornerRadius = 15.0f;
        
    }
    return _userImageView;
}
- (UILabel *)namelabel
{
    if (!_namelabel) {
        _namelabel = [[UILabel alloc] initWithFrame:CGRectMake(_userImageView.right + 8, 14, 200, 20)];
        _namelabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _namelabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _namelabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _contentLabel.textColor = kUIColorFromRGB(0x666666);
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (void)configCommentViewWithSubModel:(SubComment *)subModel indexPath:(NSIndexPath *)indexPath
{
    CGRect rect = [[GlobalSingleton Singleton]getHeigthWithText:subModel.commentContent width:SCREEN_WIDTH - 63 - 15 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
    
    _lineImageView.frame = CGRectMake(48, 0, 0.5, 12 + 30 + 8 + rect.size.height);

    [_userImageView sd_setImageWithURL:[NSURL URLWithString:subModel.initiatorImg] placeholderImage:nil];
    
    _contentLabel.frame = CGRectMake(63, _userImageView.bottom + 8, SCREEN_WIDTH - 63 - 15, rect.size.height);
    
    _contentLabel.text = subModel.commentContent;
    
    if (subModel.recipientNike) {
        if (subModel.initiatorId != subModel.recipientId) {
            _namelabel.text = [NSString stringWithFormat:@"%@ 回复 %@",subModel.initiatorNike,subModel.recipientNike];
        }else{
            _namelabel.text = subModel.initiatorNike;
        }
    }else{
        _namelabel.text = subModel.initiatorNike;
    }
}

@end
