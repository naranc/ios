//
//  AdvertisTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "AdvertisTableViewCell.h"
#import "DCTitleRolling.h"

@interface AdvertisTableViewCell ()

@property (nonatomic, strong)DCTitleRolling * nrRollingView;

@end

@implementation AdvertisTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//
//
//    }
//    return self;
//}

- (void)setUpJDRollingWithArtray:(NSArray *)array{
    
    if (!_nrRollingView) {
        
        _nrRollingView = [[DCTitleRolling alloc] initWithFrame:CGRectMake(20, 9, SCREEN_WIDTH - 40, 20) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
            
            *rollingTime = 0.5;
            *rolTags = @[@"HOT",@"HOT",@"",@"HOT"];
            *rolTitles = array;
            *leftImage = @"narankuaibao";
            *rightbuttonTitle = @"详情";
            *interval = 3.0;
            *titleFont = 10;
            *titleColor = kUIColorFromRGB(0x666666);
        }];
        
        _nrRollingView.moreClickBlock = ^{
            NSLog(@"jd----more");
        };
        
        [_nrRollingView dc_beginRolling];
        _nrRollingView.layer.cornerRadius = 10;
        [_nrRollingView.layer masksToBounds];
        _nrRollingView.backgroundColor = kUIColorFromRGB(0xffffff);
        
        _nrRollingView.layer.shadowColor = kUIColorFromRGBWithAlpha(0x000000, 0.15).CGColor;
        _nrRollingView.layer.shadowOffset = CGSizeMake(0, 0);
        _nrRollingView.layer.shadowOpacity = 1;
        _nrRollingView.layer.shadowRadius = 1;
        
        [self addSubview:_nrRollingView];

    }
}
@end
