//
//  CollectionTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "CollectionTableViewCell.h"
#import "SCollectionViewCell.h"

@interface CollectionTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray<NSString *> *_titlesArray;
    NSArray<NSString *> *_imagesArray;
}
@property (strong, nonatomic) UICollectionView* collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;

@end


@implementation CollectionTableViewCell

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
        self.contentView.backgroundColor = BackGroundColor;
        [self.contentView addSubview:self.collectionView];
    }
    return self;
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        // 设置每个item的大小，
        _layOut.itemSize = CGSizeMake(SCREEN_WIDTH / 4 , 58+17);
        
        // 设置列的最小间距
        _layOut.minimumInteritemSpacing = 0;
        
        // 设置最小行间距
        _layOut.minimumLineSpacing = 0;
        
        // 设置布局的内边距
        //        _layOut.sectionInset = UIEdgeInsetsMake(0, 15, 15, 15);
        
        // 滚动方向
        _layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return _layOut;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 58+17) collectionViewLayout:self.layOut];
        _collectionView.backgroundColor = [UIColor whiteColor];
        // 设置代理
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[SCollectionViewCell class] forCellWithReuseIdentifier:@"NRtypeCollectionViewCell"];
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
    return 4;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SCollectionViewCell *cell = (SCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"NRtypeCollectionViewCell" forIndexPath:indexPath];
    cell.typeImageView.image  = [UIImage imageNamed:_imagesArray[indexPath.row]];
    cell.typeLabel.text = _titlesArray[indexPath.row];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate clickType:indexPath];
}

- (void)layoutSubviews
{
    _collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 90);
}
@end
