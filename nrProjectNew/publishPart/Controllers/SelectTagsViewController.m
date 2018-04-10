//
//  SelectTagsViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/6.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SelectTagsViewController.h"
#import "PWishViewController.h"
#import "PDonateViewController.h"
#import "TagsCollectionViewCell.h"

@interface SelectTagsViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray<NSString *> *titlesArray;
    NSArray<NSString *> *selectedImagesArray;
    NSArray<NSString *> *unSelectedImagesArray;
    
    CGFloat cellHeight;
    
    CGFloat cellWight;
    
    NSString * selectedTag;
}
@property (strong, nonatomic) UICollectionView* collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout* layOut;

@property (strong, nonatomic) UIButton * nextButton;
@end

@implementation SelectTagsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.frame = CGRectMake((SCREEN_WIDTH - 80) / 2, 300, 80, 40);
    [addButton setTitle:@"汽车" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    [addButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
    addButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
//    [self.view addSubview:addButton];
    
    cellWight = 98;
    cellHeight = 106;
    
//    [self.customNavBar wr_setRightButtonWithTitle:@"取消" titleColor:kUIColorFromRGB(0x333333)];
//    self.customNavBar.onClickRightButton = ^{
//        [self dismissViewControllerAnimated:YES completion:nil];
//    };
    
    

    
    [self.customNavBar setTitle:@"选择物品标签"];

    
    
    titlesArray = @[@"书籍",@"家具",@"文具",@"玩具",@"鞋包服饰",@"母婴用品",@"美妆护理",@"钟表首饰",@"工具器材",@"宠物用品",@"数码电器",@"同城服务"];
    
    selectedImagesArray = @[@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre",@"fabu_btn_meizhuanghuli_pre"];
    unSelectedImagesArray = @[@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli",@"fabu_btn_meizhuanghuli"];
    
    

    [self.view addSubview:self.collectionView];
    
    [self.view addSubview:self.nextButton];
}
- (void)addButton:(UIButton *)btn
{
    if ([_publishTP isEqualToString:@"wish"]) {
        PWishViewController * wishVC = [[PWishViewController alloc] init];
        wishVC.tag = @"汽车";
        [self.navigationController pushViewController:wishVC animated:YES];
    }else{
        PDonateViewController * donateVC = [[PDonateViewController alloc] init];
        donateVC.tag = @"汽车";
        [self.navigationController pushViewController:donateVC animated:YES];
    }
}

- (void)nextButton:(UIButton *)btn
{
    if (selectedTag) {
        if ([_publishTP isEqualToString:@"wish"]) {
            PWishViewController * wishVC = [[PWishViewController alloc] init];
            wishVC.tag = selectedTag;
            [self.navigationController pushViewController:wishVC animated:YES];
        }else{
            PDonateViewController * donateVC = [[PDonateViewController alloc] init];
            donateVC.tag = selectedTag;
            [self.navigationController pushViewController:donateVC animated:YES];
        }
    }else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择一个标签" duration:MBProgressHUDDuration];
    }
}
- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _nextButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        _nextButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [_nextButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(nextButton:) forControlEvents:UIControlEventTouchUpInside];
        //        _nextButton.userInteractionEnabled = YES;
        _nextButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
    }
    return _nextButton;
}
- (UICollectionViewFlowLayout *)layOut
{
    if (!_layOut) {
        _layOut = [[UICollectionViewFlowLayout alloc] init];
        // 设置每个item的大小，
        _layOut.itemSize = CGSizeMake(cellWight , cellHeight);
        
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
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGFloat widht = 3 * 98;
        CGFloat left = (SCREEN_WIDTH - widht) / 2;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(left, top + (SCREEN_HEIGHT - top - 49 - cellHeight * 4) / 2 - 30, widht, cellHeight * 4) collectionViewLayout:self.layOut];
        _collectionView.backgroundColor = [UIColor whiteColor];
        // 设置代理
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[TagsCollectionViewCell class] forCellWithReuseIdentifier:@"TagsCollectionViewCell"];
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
    return 12;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagsCollectionViewCell *cell = (TagsCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"TagsCollectionViewCell" forIndexPath:indexPath];
    [cell.tagButton setTitle:titlesArray[indexPath.row] forState:UIControlStateNormal];
    [cell.tagButton setImage:[UIImage imageNamed:unSelectedImagesArray[indexPath.row]] forState:UIControlStateNormal];
    return cell;
}
#pragma  mark ------------------ UICollectionViewCellSelected ----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中  1第%ld区，1第%ld个",(long)indexPath.section,(long)indexPath.row);
    TagsCollectionViewCell *cell = (TagsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.tagButton setTitleColor:MainColor forState:UIControlStateNormal];
    [cell.tagButton setImage:[UIImage imageNamed:selectedImagesArray[indexPath.row]] forState:UIControlStateNormal];
    selectedTag = cell.tagButton.titleLabel.text;
    
}

#pragma  mark ------------------ UICollectionViewCellSelected ----------------


//取消选定
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TagsCollectionViewCell *cell = (TagsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor whiteColor];
    NSLog(@"取消  1第%ld区，1第%ld个",(long)indexPath.section,(long)indexPath.row);
    [cell.tagButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
    [cell.tagButton setImage:[UIImage imageNamed:unSelectedImagesArray[indexPath.row]] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
