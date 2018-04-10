//
//  TagTableViewCell.m
//  nrProjectNew
//
//  Created by 那然 on 2018/2/1.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TagTableViewCell.h"
#import "TagCollectionViewCell.h"

@interface TagTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray<NSString *> *_titlesArray;
    CGFloat viewHeight;

}
@property (strong, nonatomic) UICollectionView* collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;

@property (nonatomic, strong) UIImageView * lineView;

@end


@implementation TagTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tagsArray:(NSArray*)tagsArray
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kUIColorFromRGB(0xffffff);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        viewHeight = [self cellHeight:(int)tagsArray.count];
        NSLog(@"viewHeight = %f",viewHeight);
        _titlesArray = tagsArray;
        self.contentView.backgroundColor = kUIColorFromRGB(0xffffff);
        [self.contentView addSubview:self.collectionView];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}
- (CGFloat)cellHeight:(int)count
{
    int a = count / 3;
    int b = count % 3;
    if (b > 0) {
        CGFloat height = 36 * (a + 1) + 5 * a;
        return height;
    }else{
        CGFloat height = 36 * a + 5 * (a - 1);
        return height;
    }
}
- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.frame = CGRectMake(0, _collectionView.bottom + 12, SCREEN_WIDTH - 89, 1);
        _lineView.backgroundColor = kUIColorFromRGB(0xeeeeee);
    }
    return _lineView;
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        // 设置每个item的大小，
        _layOut.itemSize = CGSizeMake((SCREEN_WIDTH - 89 - 26) / 3 , 36);
        
        // 设置列的最小间距
        _layOut.minimumInteritemSpacing = 5;
        
        // 设置最小行间距
        _layOut.minimumLineSpacing = 5;
        
        // 设置布局的内边距
//                _layOut.sectionInset = UIEdgeInsetsMake(8, 6, 8, 10);
        
        // 滚动方向
        _layOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return _layOut;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(6, 12, SCREEN_WIDTH - 89 - 10 - 6, viewHeight) collectionViewLayout:self.layOut];
        _collectionView.backgroundColor = [UIColor whiteColor];
        // 设置代理
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[TagCollectionViewCell class] forCellWithReuseIdentifier:@"NRtypeCollectionViewCell"];
    }
    return _collectionView;
}

// 每个分区多少个item
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _titlesArray.count;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagCollectionViewCell *cell = (TagCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"NRtypeCollectionViewCell" forIndexPath:indexPath];
//    cell.typeImageView.image  = [UIImage imageNamed:_imagesArray[indexPath.row]];
//    cell.typeLabel.text = _titlesArray[indexPath.row];
    [cell.button setTitle:_titlesArray[indexPath.row] forState:UIControlStateNormal];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [_delegate clickType:indexPath];
}

@end
