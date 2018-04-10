
//
//  TypeView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/9.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TypeView.h"
#import "TypeTableViewCell.h"

#define LINEHEIGHT 1

static NSString * cellitifter = @"cellitifter";
@interface TypeView ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIImageView* topTitleView;

@property (strong, nonatomic) UIImageView* topLineView;

@property (strong, nonatomic) UIView* bookeView;

@property (strong, nonatomic) UIImageView* picImageView;

@property (strong, nonatomic) ImageTextButton* bookBtn;

@property (strong, nonatomic) UILabel* introLabel;

@property (strong, nonatomic) UITableView* typeTBView;

@property (strong, nonatomic) UIImageView* fabuView;

@property (strong, nonatomic) UIImageView* bottomLineView;

@end

@implementation TypeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self addSubview:self.topTitleView];
        [self addSubview:self.topLineView];
        [self addSubview:self.bookeView];
        [_bookeView addSubview:self.picImageView];
        [_bookeView addSubview:self.bookBtn];
        [_bookeView addSubview:self.introLabel];

        [self addSubview:self.typeTBView];
        [self addSubview:self.fabuView];
        [self addSubview:self.bottomLineView];

    }
    return self;
}
- (UIImageView *)topTitleView
{
    if (!_topTitleView) {
        _topTitleView = [[UIImageView alloc] init];
        _topTitleView.backgroundColor = [UIColor yellowColor];
    }
    return _topTitleView;
}
- (UIImageView *)topLineView
{
    if (!_topLineView) {
        _topLineView = [[UIImageView alloc] init];
        _topLineView.backgroundColor = kUIColorFromRGB(0XEEEEEE);
    }
    return _topLineView;
}
- (UIView *)bookeView
{
    if (!_bookeView) {
        _bookeView = [[UIView alloc] init];
    }
    return _bookeView;
}
- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.layer.cornerRadius = 4.0f;
        _picImageView.clipsToBounds = YES;
        _picImageView.image = [UIImage imageNamed:@"aixinshuwu"];
    }
    return _picImageView;
}
- (ImageTextButton *)bookBtn
{
    if (!_bookBtn) {
        _bookBtn = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _bookBtn.midSpacing = 5;
        _bookBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
        _bookBtn.imageSize = CGSizeMake(30, 15);
        [_bookBtn setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _bookBtn.layoutStyle = ImageTextButtonStyleLeftTitleRightImage;
        [_bookBtn setTitle:@"爱的书屋" forState:UIControlStateNormal];
        [_bookBtn setImage:[UIImage imageNamed:@"hot"] forState:UIControlStateNormal];
        
    }
    return _bookBtn;
    
}
- (UILabel *)introLabel
{
    if (!_introLabel) {
        _introLabel = [[UILabel alloc] init];
        _introLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _introLabel.textColor = kUIColorFromRGB(0x999999);
        _introLabel.text = @"书籍是人类进步的阶梯";
    }
    return _introLabel;
}
- (UIImageView *)fabuView
{
    if (!_fabuView) {
        _fabuView = [[UIImageView alloc] init];
        _fabuView.backgroundColor = [UIColor yellowColor];
    }
    return _fabuView;
}
- (UIImageView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIImageView alloc] init];
        _bottomLineView.backgroundColor = kUIColorFromRGB(0XEEEEEE);
    }
    return _bottomLineView;
}
- (UITableView *)typeTBView
{
    if (!_typeTBView) {
        CGRect frame = CGRectMake(0, 0, 95, SCREEN_WIDTH);
        _typeTBView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _typeTBView.delegate = self;
        _typeTBView.dataSource = self;
        _typeTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _typeTBView.showsVerticalScrollIndicator = NO;
        _typeTBView.backgroundColor = [UIColor whiteColor];
        _typeTBView.estimatedRowHeight = 0;
        _typeTBView.transform = CGAffineTransformMakeRotation(-M_PI/2);
        _typeTBView.estimatedSectionHeaderHeight = 0;
        _typeTBView.estimatedSectionFooterHeight = 0;
        
    }
    return _typeTBView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TypeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[TypeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI /2);
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)layoutSubviews
{
    _topTitleView.frame = CGRectMake(15, 0, 71, 25);
    
    _topLineView.frame = CGRectMake(15, _topTitleView.bottom + 7, SCREEN_WIDTH - 15, LINEHEIGHT);
    
    _bookeView.frame = CGRectMake(15, _topLineView.bottom, SCREEN_WIDTH - 30, 129);

    _typeTBView.frame = CGRectMake(0, _bookeView.bottom, SCREEN_WIDTH, 95);
    
    _fabuView.frame = CGRectMake(15, _typeTBView.bottom + 27, 71, 25);
    
    _bottomLineView.frame = CGRectMake(15, _fabuView.bottom + 7, SCREEN_WIDTH - 15, LINEHEIGHT);
    
    
    _picImageView.frame = CGRectMake(0, 15, 193, 100);
    
    _bookBtn.frame = CGRectMake(_picImageView.right + 15, 25, 96, 21);
    
    _introLabel.frame = CGRectMake(_picImageView.right + 15, _bookBtn.bottom + 4, _bookeView.width - 193 - 29, 17);
}
@end
