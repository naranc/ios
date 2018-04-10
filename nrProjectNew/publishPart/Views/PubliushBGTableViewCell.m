//
//  PubliushBGTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/22.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PubliushBGTableViewCell.h"
#import "BGCollectionViewCell.h"
#import "PublishModel.h"

@interface PubliushBGTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UILabel * titleLabel;

@property (strong, nonatomic) UIButton * refeshButton;

@property (strong, nonatomic) NSMutableArray * imagesArray;

@property (strong, nonatomic) UICollectionView * bgCollectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;

@end


@implementation PubliushBGTableViewCell
- (NSMutableArray *)imagesArray
{
    if (!_imagesArray) {
        _imagesArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _imagesArray;
}
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
//        _imagesArray = @[@"btn_meizhoutuijian",@"btn_yuanzhurenwu",@"btn_zhuantibaodao",@"btn_paihangbang",@"btn_meizhoutuijian",@"btn_meizhoutuijian",@"btn_meizhoutuijian"];
        self.contentView.backgroundColor = BackGroundColor;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.refeshButton];
        [self.contentView addSubview:self.bgCollectionView];
        
        [PublishModel getWishBgImageWithParament:nil success:^(NSDictionary *dic) {
            NSLog(@"bgImagesDic = %@",dic);
            NSArray * array = dic[@"data"][@"stationerys"];
            for (NSDictionary * imageDic in array) {
                [self.imagesArray addObject:imageDic];
            }
            [_bgCollectionView reloadData];
        } withFailureBlock:^(NSError *error) {
            NSLog(@"ewrror = %@",error);
        }];
        
    }
    return self;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x666666);
        _titleLabel.text = @"选择一款背景图片";
    }
    return _titleLabel;
}
- (UIButton *)refeshButton
{
    if (!_refeshButton) {
        _refeshButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_refeshButton setImage:[UIImage imageNamed:@"fabu_btn_suiji"] forState:UIControlStateNormal];
        [_refeshButton addTarget:self action:@selector(refeshButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refeshButton;
}
- (void)refeshButton:(UIButton *)btn
{
    
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        // 设置每个item的大小，
        _layOut.itemSize = CGSizeMake(79 , 125);
        
        // 设置列的最小间距
        _layOut.minimumInteritemSpacing = 15;
        
        // 设置最小行间距
        _layOut.minimumLineSpacing = 15;
        
        // 设置布局的内边距
        //        _layOut.sectionInset = UIEdgeInsetsMake(0, 15, 15, 15);
        
        // 滚动方向
        _layOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    return _layOut;
}
- (UICollectionView *)bgCollectionView
{
    if (!_bgCollectionView) {
        _bgCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 78, SCREEN_WIDTH, 125) collectionViewLayout:self.layOut];
        _bgCollectionView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _bgCollectionView.delegate = self;
        _bgCollectionView.dataSource = self;
        _bgCollectionView.showsHorizontalScrollIndicator = NO;
        [_bgCollectionView registerClass:[BGCollectionViewCell class] forCellWithReuseIdentifier:@"NRtypeCollectionViewCell"];
    }
    return _bgCollectionView;
}
// 返回分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
// 每个分区多少个item
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imagesArray.count;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic;
    if (_imagesArray.count) {
        dic = _imagesArray[indexPath.row];
    }
    BGCollectionViewCell *cell = (BGCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"NRtypeCollectionViewCell" forIndexPath:indexPath];
    [cell.bgImageView sd_setImageWithURL:[NSURL URLWithString:dic[@"stationeryImg"]] placeholderImage:nil];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
//选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BGCollectionViewCell *cell = (BGCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.bgView.backgroundColor = MainColor;
    NSLog(@"第%ld区，第%ld个",(long)indexPath.section,(long)indexPath.row);
    _imageStr = _imagesArray[indexPath.row][@"stationeryImg"];

}

//取消选定
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BGCollectionViewCell *cell = (BGCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.bgView.backgroundColor = [UIColor whiteColor];
    NSLog(@"1第%ld区，1第%ld个",(long)indexPath.section,(long)indexPath.row);
    _imageStr = nil;
}

- (void)layoutSubviews
{
    _titleLabel.frame = CGRectMake(15, 32, 120, 21);
    
    _refeshButton.frame = CGRectMake(SCREEN_WIDTH - 17 - 17, 32, 17, 18);

    _bgCollectionView.frame = CGRectMake(0, 78, SCREEN_WIDTH, 125);
}
@end
