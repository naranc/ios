//
//  RecommendBookCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "RecommendBookCell.h"
#import "BookCollectionViewCell.h"


@interface RecommendBookCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray<NSString *> *_titlesArray;
    NSArray<NSString *> *_imagesArray;
}
@property (strong, nonatomic) UICollectionView* collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;

@property (strong, nonatomic) UIImageView* lineView;

@property (strong, nonatomic) UILabel* cellTitleLabel;

@property (strong, nonatomic) UIView* underLineView;

@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@property (strong, nonatomic) ImageTextButton *changeButton;

@end

@implementation RecommendBookCell

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
        self.backgroundColor = [UIColor whiteColor];
        _titlesArray = @[@"每周推荐",@"援助任务",@"专题报道",@"公益榜"];
        _imagesArray = @[@"meizhoutuijian",@"yuanzhurenwu",@"zhuantibaodao",@"gongyibang"];
        [self addSubview:self.lineView];
        
        [self addSubview:self.cellTitleLabel];
        [self addSubview:self.underLineView];
        
        [self addSubview:self.collectionView];
        [self addSubview:self.changeButton];
        
    }
    return self;
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        // 设置每个item的大小，
        _layOut.itemSize = CGSizeMake(SCREEN_WIDTH / 3 , 145);
        
        // 设置列的最小间距
        _layOut.minimumInteritemSpacing = 0;
        
        // 设置最小行间距
        _layOut.minimumLineSpacing = 24;
        
        // 设置布局的内边距
        _layOut.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        // 滚动方向
        _layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return _layOut;
}
- (UILabel *)cellTitleLabel
{
    if (!_cellTitleLabel) {
        _cellTitleLabel = [[UILabel alloc] init];
        _cellTitleLabel.frame = CGRectMake(100, _lineView.bottom + 24, SCREEN_WIDTH - 200, 25);
        _cellTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
        _cellTitleLabel.textAlignment = NSTextAlignmentCenter;
        _cellTitleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _cellTitleLabel;
}
- (UIView *)underLineView
{
    if (!_underLineView) {
        _underLineView = [[UIView alloc] init];
        _underLineView.frame = CGRectMake(0, _cellTitleLabel.bottom, 100, 8);
        self.gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = _underLineView.frame;  // 设置显示的frame
        _gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];  // 设置渐变颜色
        //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
        _gradientLayer.startPoint = CGPointMake(0, 0);   //
        _gradientLayer.endPoint = CGPointMake(1, 0);     //
        [_underLineView.layer addSublayer:_gradientLayer];
    }
    return _underLineView;
   
}

- (ImageTextButton *)changeButton
{
    if (!_changeButton) {
        _changeButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _changeButton.frame = CGRectMake((SCREEN_WIDTH - 78)/2, _collectionView.bottom + 24, 78, 33);
        _changeButton.midSpacing = 4;
        _changeButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
        _changeButton.imageSize = CGSizeMake(14, 12);
        _changeButton.backgroundColor = kUIColorFromRGB(0x359FFF);
        [_changeButton setTitle:@"换一换" forState:UIControlStateNormal];
        [_changeButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _changeButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_changeButton setImage:[UIImage imageNamed:@"icon_huanyipi"] forState:UIControlStateNormal];
        _changeButton.layer.cornerRadius = 4.0f;
        [_changeButton.layer masksToBounds];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = _changeButton.frame;
        gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
//        [_changeButton.layer addSublayer:gradientLayer];
//        [_changeButton.layer insertSublayer:gradientLayer below:_changeButton.layer];
    }
    return _changeButton;
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 8);
        _lineView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _lineView;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _cellTitleLabel.bottom + 24, SCREEN_WIDTH, 145*2 + 24) collectionViewLayout:self.layOut];
        _collectionView.backgroundColor = [UIColor whiteColor];
        // 设置代理
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[BookCollectionViewCell class] forCellWithReuseIdentifier:@"BookCollectionViewCell"];
    }
    return _collectionView;
}


// 返回分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
// 每个分区多少个item
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookCollectionViewCell *cell = (BookCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BookCollectionViewCell" forIndexPath:indexPath];
//    cell.typeImageView.image  = [UIImage imageNamed:_imagesArray[indexPath.row]];
//    cell.typeLabel.text = _titlesArray[indexPath.row];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [_delegate clickType:indexPath];
}

- (void)layoutSubviews
{
//    _collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 90);
}
- (void)setCellTitle:(NSString *)cellTitle
{
    _cellTitleLabel.text = cellTitle;
   
    CGRect size = [[GlobalSingleton Singleton] getWidthWithText:cellTitle higth:25 font:[UIFont fontWithName:@"PingFangSC-Medium" size:18]];
    
    CGFloat wight = size.size.width + 20;
    
//    _underLineView.frame = CGRectMake((SCREEN_WIDTH - wight)/2, _lineView.bottom + 43, size.size.width + 12, 8);
    
//    _gradientLayer.frame = _underLineView.frame;
//    [_underLineView.layer addSublayer:_gradientLayer];
    
}
@end
