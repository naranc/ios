//
//  CycleTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/18.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "CycleTableViewCell.h"
#import "NewPagedFlowView.h"
#import "TAPageControl.h"

@interface CycleTableViewCell ()<NewPagedFlowViewDelegate,NewPagedFlowViewDataSource>

@property (nonatomic, strong) NSMutableArray *imageArray;

@end


@implementation CycleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {

    self.pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_WIDTH - 60) * 157 / 311 + 18)];
    _pageFlowView.delegate = self;
    _pageFlowView.dataSource = self;
    _pageFlowView.minimumPageAlpha = 0.1;
//    _pageFlowView.isCarousel = NO;
    _pageFlowView.autoTime = 2.0;
    _pageFlowView.orientation = NewPagedFlowViewOrientationHorizontal;
    _pageFlowView.isOpenAutoScroll = YES;

    
    
    TAPageControl *pageControl = [[TAPageControl alloc] initWithFrame:CGRectMake(0, _pageFlowView.frame.size.height - 20, SCREEN_WIDTH , 8)];
//    pageControl.numberOfPages = self.imagePathsGroup.count;
//    pageControl.dotColor = self.currentPageDotColor;
    pageControl.userInteractionEnabled = NO;
    pageControl.currentDotImage = [UIImage imageNamed:@"banner_roll_pre"];
    pageControl.dotImage = [UIImage imageNamed:@"banner_roll_normal"];

//    pageControl.currentPage = indexOnPageControl;
//    [self addSubview:pageControl];
    _pageFlowView.pageControl = pageControl;
    
    [_pageFlowView addSubview:pageControl];


    [_pageFlowView reloadData];
    
    [self addSubview:_pageFlowView];
}

#pragma mark NewPagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(SCREEN_WIDTH - 60, (SCREEN_WIDTH - 60) * 157 / 311);
}

- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
    
    NSLog(@"点击了第%ld张图",(long)subIndex + 1);
    
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(NewPagedFlowView *)flowView {
    
//    NSLog(@"ViewController 滚动到了第%ld页",pageNumber);
}

#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    return self.imageArray.count;
}

- (PGIndexBannerSubiew *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    PGIndexBannerSubiew *bannerView = [flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGIndexBannerSubiew alloc] init];
        bannerView.tag = index;
        bannerView.layer.cornerRadius = 4;
        bannerView.layer.masksToBounds = YES;
    }
    //在这里下载网络图片
    //  [bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:hostUrlsImg,imageDict[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
    bannerView.mainImageView.image = self.imageArray[index];
    return bannerView;
}
- (void)configDataWithArtray:(NSMutableArray *)array
{
    _imageArray = array;
    [_pageFlowView reloadData];
}
- (void)adjustCenterSubview
{
    [_pageFlowView adjustCenterSubview];
}

#pragma mark --懒加载
- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
@end
