//
//  BookTagsTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookTagsTableViewCell.h"
#import "BookTagsCollectionViewCell.h"

@interface BookTagsTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray<NSString *> *titlesArray;
    NSArray<NSString *> *selectedImagesArray;
    NSArray<NSString *> *unSelectedImagesArray;
    
    CGFloat cellHeight;
    
    CGFloat cellWight;
    
    NSString * selectedTag;
}

@property (nonatomic, strong) UIView * bgView;

@property (strong, nonatomic) UICollectionView* collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;

@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation BookTagsTableViewCell

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
        [self addSubview:self.bgView];
        [_bgView addSubview:self.titleLabel];
        [_bgView addSubview:self.collectionView];
    }
    return self;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 141);
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 16, 40, 21);
        _titleLabel.text = @"类别";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        // 设置每个item的大小，
        _layOut.itemSize = CGSizeMake(SCREEN_WIDTH/4 , 36);
        
        // 设置列的最小间距
        _layOut.minimumInteritemSpacing = 0;
        
        // 设置最小行间距
        _layOut.minimumLineSpacing = 0;
        
        // 设置布局的内边距
        //        _layOut.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        
        // 滚动方向
        _layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return _layOut;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CGFloat top = _titleLabel.bottom + 16;
        CGFloat left = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(left, top, SCREEN_WIDTH, 28*2 + 16) collectionViewLayout:self.layOut];
        _collectionView.backgroundColor = [UIColor whiteColor];
        // 设置代理
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[BookTagsCollectionViewCell class] forCellWithReuseIdentifier:@"TagsCollectionViewCell"];
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
    return 8;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookTagsCollectionViewCell *cell = (BookTagsCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"TagsCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中  1第%ld区，1第%ld个",(long)indexPath.section,(long)indexPath.row);
    BookTagsCollectionViewCell *cell = (BookTagsCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
//    [cell.tagButton setTitleColor:MainColor forState:UIControlStateNormal];
//    [cell.tagButton setImage:[UIImage imageNamed:selectedImagesArray[indexPath.row]] forState:UIControlStateNormal];
//    selectedTag = cell.tagButton.titleLabel.text;
    
}

#pragma  mark ------------------ UICollectionViewCellSelected ----------------


//取消选定
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookTagsCollectionViewCell *cell = (BookTagsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor whiteColor];
    NSLog(@"取消  1第%ld区，1第%ld个",(long)indexPath.section,(long)indexPath.row);
    [cell.tagButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
    [cell.tagButton setImage:[UIImage imageNamed:unSelectedImagesArray[indexPath.row]] forState:UIControlStateNormal];
}

@end
