//
//  BookStoreTopCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookStoreTopCell.h"

@implementation BookStoreTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        
        [self.imageArray addObject:@"banner"];
        [self.imageArray addObject:@"banner"];
        [self.imageArray addObject:@"banner"];
        [self.imageArray addObject:@"banner"];
        [self.imageArray addObject:@"banner"];
        
        _arr1 = @[@"那然公益一些资讯在资讯在在资这里…",
                  @"那然公益一些资讯在资讯在在资这里…",
                  @"那然公益一些资讯在资讯在在资这里…",
                  @"那然公益一些资讯在资讯在在资这里…",
                  @"那然公益一些资讯在资讯在在资这里…"
                  ];
        [self addSubview:self.topBgView];
        
        [self addSubview:self.topSelectView];
        
        [self addSubview:self.noticeBgView];
        
        [_noticeBgView addSubview:self.noticeImageView];
        [_noticeBgView addSubview:self.noticeView];
        
        [self addSubview:self.cycleScrollView];
    }
    return self;
}


- (UIView *)topBgView
{
    if (!_topBgView) {
        _topBgView = [[UIView alloc] init];
        _topBgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = _topBgView.frame;  // 设置显示的frame
        gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];  // 设置渐变颜色
        //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
        gradientLayer.startPoint = CGPointMake(0, 0);   //
        gradientLayer.endPoint = CGPointMake(1, 0);     //
        [_topBgView.layer addSublayer:gradientLayer];
    }
    return _topBgView;
}
- (TopSelectView *)topSelectView
{
    if (!_topSelectView) {
        _topSelectView = [[TopSelectView alloc] init];
        _topSelectView.frame = CGRectMake(15, 0, SCREEN_WIDTH - 30, 107);
        _topSelectView.layer.cornerRadius = 4.0f;
        [_topSelectView.layer masksToBounds];
        _topSelectView.backgroundColor = kUIColorFromRGB(0xffffff);
        _topSelectView.layer.shadowColor = kUIColorFromRGBWithAlpha(0x6FBBFF, 0.32).CGColor;
        _topSelectView.layer.shadowOffset = CGSizeMake(0, 0);
        _topSelectView.layer.shadowOpacity = 15;
        _topSelectView.layer.shadowRadius = 15;
        _topSelectView.delegate = self;
    }
    return _topSelectView;
}

- (void)clickTopSlectType:(NSInteger)type
{
    [_delegate clickTopSlectType:type];
}


- (UIView *)noticeBgView
{
    if (!_noticeBgView) {
        _noticeBgView = [[UIView alloc] init];
        _noticeBgView.frame = CGRectMake(30, _topSelectView.bottom + 24, SCREEN_WIDTH - 60, 33);
        _noticeBgView.layer.cornerRadius = 33/2;
        [_noticeBgView.layer masksToBounds];
        _noticeBgView.backgroundColor = kUIColorFromRGB(0xffffff);
        _noticeBgView.layer.shadowColor = kUIColorFromRGBWithAlpha(0x6FBBFF, 0.5).CGColor;
        _noticeBgView.layer.shadowOffset = CGSizeMake(0, 0);
        _noticeBgView.layer.shadowOpacity = 4;
        _noticeBgView.layer.shadowRadius = 4;
    }
    return _noticeBgView;
}

- (UIImageView *)noticeImageView
{
    if (!_noticeImageView) {
        _noticeImageView = [[UIImageView alloc] init];
        _noticeImageView.frame = CGRectMake(17, 10, 27, 14);
        _noticeImageView.image = [UIImage imageNamed:@"tongzhi"];
    }
    return _noticeImageView;
}

- (void)creatRollingViewWithArray:(NSArray *)arr
{
    
}
- (GYRollingNoticeView *)noticeView
{
    if (!_noticeView) {
        CGRect frame = CGRectMake(52, 0, _noticeBgView.width - 52 - 19, 33);
        _noticeView = [[GYRollingNoticeView alloc]initWithFrame:frame];
        _noticeView.dataSource = self;
        _noticeView.delegate = self;
        [_noticeBgView addSubview:_noticeView];
        _noticeView.backgroundColor = kUIColorFromRGB(0xffffff);
        _temoNoticeView = _noticeView;
        [_noticeView registerClass:[GYNoticeViewCell class] forCellReuseIdentifier:@"GYNoticeViewCell"];
        [_noticeView beginScroll];
    }
    return _noticeView;
}
- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [[SDCycleScrollView alloc] init];
        _cycleScrollView.frame = CGRectMake(30, _noticeBgView.bottom + 24, SCREEN_WIDTH - 60, 130);
        _cycleScrollView.delegate = self;
        _cycleScrollView.placeholderImage =[UIImage imageNamed:@"firstBannerImage"];
        _cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"roll1"];//当前圆点的image
        _cycleScrollView.pageDotImage = [UIImage imageNamed:@"roll"];//滑过的圆点的image
        _cycleScrollView.pageControlDotSize = CGSizeMake(10, 10);
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.pageControlBottomOffset = -36;
        //kDefaultSpacingBetweenDots    dots 间距
    }
    _cycleScrollView.imageURLStringsGroup = (NSArray*)self.imageArray;
    return _cycleScrollView;
}

- (NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView
{
    return _arr1.count;
}
- (__kindof GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    // 普通用法，只有一行label滚动显示文字
    // normal use, only one line label rolling
    GYNoticeViewCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"GYNoticeViewCell"];
    cell.textLabel.text = _arr1[index];
    cell.contentView.backgroundColor = kUIColorFromRGB(0xffffff);
    return cell;
}

- (void)didClickRollingNoticeView:(GYRollingNoticeView *)rollingView forIndex:(NSUInteger)index
{
    NSLog(@"点击的index: %ld", index);
}
@end
