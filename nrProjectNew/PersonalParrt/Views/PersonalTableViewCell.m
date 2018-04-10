//
//  PersonalTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/20.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PersonalTableViewCell.h"
#import "PersonalCollectionViewCell.h"

@interface PersonalTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray * titlesArray;
    NSArray * imagesArray;
}
@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;

@property (nonatomic, strong) UICollectionView * collectionView;

@end


@implementation PersonalTableViewCell

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
        titlesArray = @[@"我的签到",@"我收藏的",@"我参与的",@"我发布的",@"我送出的",@"我收到的",@"我的地址",@"联系客服",@"关于那然"];
        imagesArray = @[@"wode_btn_wodeqiandao",@"wode_btn_wodeshoucang",@"wode_btn_wocangyude",@"wode_btn_wofabude",@"wode_btn_wosongchude",@"wode_btn_woshoudaode",@"wode_btn_wodedizhi",@"wode_btn_lianxikefu",@"wode_btn_guanyunaran"];

        [self addSubview:self.collectionView];
    }
    return self;
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        _layOut.itemSize = CGSizeMake((SCREEN_WIDTH - 1) / 3 , ((SCREEN_WIDTH - 1) / 3) - 16);
        // 设置列的最小间距
        _layOut.minimumInteritemSpacing = 0.5;
        // 设置最小行间距
        _layOut.minimumLineSpacing = 0.5;
        //        _layOut.sectionInset = UIEdgeInsetsMake(0, 0.5, 0.5, 0.5);
        _layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layOut;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0.5, SCREEN_WIDTH, (((SCREEN_WIDTH - 2)/ 3) - 16)*3 + 1) collectionViewLayout:self.layOut];
        _collectionView.backgroundColor = kUIColorFromRGB(0xDDDDDD);
        // 设置代理
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[PersonalCollectionViewCell class] forCellWithReuseIdentifier:@"NRtypeCollectionViewCell"];
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
    return 9;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalCollectionViewCell *cell = (PersonalCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"NRtypeCollectionViewCell" forIndexPath:indexPath];
    cell.typeImageView.image  = [UIImage imageNamed:imagesArray[indexPath.row]];
    cell.typeLabel.text = titlesArray[indexPath.row];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        [_delegate clickWithIndexPath:indexPath];
}
- (void)layoutSubviews
{
    _collectionView.frame = CGRectMake(0, 0.5, SCREEN_WIDTH, (((SCREEN_WIDTH - 1)/ 3) - 16)*3 + 1);
}
@end
