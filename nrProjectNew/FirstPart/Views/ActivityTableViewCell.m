
//
//  ActivityTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "ActivityTableViewCell.h"

@interface ActivityTableViewCell ()

@property (nonatomic, strong) UIImageView * bgImageview;

@end

@implementation ActivityTableViewCell

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
        self.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [self addSubview:self.bgImageview];
    }
    return self;
}
- (UIImageView *)bgImageview
{
    if (!_bgImageview) {
        _bgImageview = [[UIImageView alloc] init];
        _bgImageview.clipsToBounds = YES;
        _bgImageview.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageview.image = [UIImage imageNamed:@"xhdpibanner.png"];
    }
    return _bgImageview;
}
- (void)layoutSubviews
{
    _bgImageview.frame = CGRectMake(15, 16, SCREEN_WIDTH - 30, (SCREEN_WIDTH - 30) * 125 / 345);
}
@end
