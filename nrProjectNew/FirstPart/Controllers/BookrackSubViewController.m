//
//  BookrackSubViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookrackSubViewController.h"
#import "BookrackCollectionViewCell.h"

@interface BookrackSubViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView* collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;
@end

@implementation BookrackSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        // 设置每个item的大小，
        _layOut.itemSize = CGSizeMake(SCREEN_WIDTH / 3 , 170);
        
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



//- (ImageTextButton *)changeButton
//{
//    if (!_changeButton) {
//        _changeButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
//        _changeButton.frame = CGRectMake((SCREEN_WIDTH - 78)/2, _collectionView.bottom + 24, 78, 33);
//        _changeButton.midSpacing = 4;
//        _changeButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
//        _changeButton.imageSize = CGSizeMake(14, 12);
//        _changeButton.backgroundColor = kUIColorFromRGB(0x359FFF);
//        [_changeButton setTitle:@"换一换" forState:UIControlStateNormal];
//        [_changeButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
//        _changeButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
//        [_changeButton setImage:[UIImage imageNamed:@"icon_huanyipi"] forState:UIControlStateNormal];
//        _changeButton.layer.cornerRadius = 4.0f;
//        [_changeButton.layer masksToBounds];
//
//        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//        gradientLayer.frame = _changeButton.frame;
//        gradientLayer.colors = @[(id)kUIColorFromRGB(0x359FFF).CGColor,(id)kUIColorFromRGB(0x65CDFF).CGColor];
//        gradientLayer.startPoint = CGPointMake(0, 0);
//        gradientLayer.endPoint = CGPointMake(1, 0);
//        //        [_changeButton.layer addSublayer:gradientLayer];
//        //        [_changeButton.layer insertSublayer:gradientLayer below:_changeButton.layer];
//    }
//    return _changeButton;
//}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 51 - top) collectionViewLayout:self.layOut];
        _collectionView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        // 设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[BookrackCollectionViewCell class] forCellWithReuseIdentifier:@"BookCollectionViewCell"];
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
    return 20;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookrackCollectionViewCell *cell = (BookrackCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"BookCollectionViewCell" forIndexPath:indexPath];
    //    cell.typeImageView.image  = [UIImage imageNamed:_imagesArray[indexPath.row]];
    //    cell.typeLabel.text = _titlesArray[indexPath.row];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    [_delegate clickType:indexPath];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
