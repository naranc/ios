//
//  AffirmBookViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "AffirmBookViewController.h"
#import "ZLPhotoActionSheet.h"
#import "ZLShowBigImage.h"
#import "ZLDefine.h"
#import "ZLCollectionCell.h"
#import "PYPhotosView.h"
#import "PYPhotosPreviewController.h"
#import "AffBookTitleTableViewCell.h"
#import "BookBreakdownTableViewCell.h"
#import "AFFBookNewTableViewCell.h"

static NSString * cellitifter0 = @"cellitifter0";
static NSString * cellitifter1 = @"cellitifter1";
static NSString * cellitifter2 = @"cellitifter2";
static NSString * cellitifter3 = @"cellitifter3";

@interface AffirmBookViewController ()<UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PYPhotosViewDelegate>
{
    NSMutableArray * dateSourceArray;
    NSArray * selectPhotosArray;
}
@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) UITableView * affirmBookTBView;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (strong, nonatomic) NSArray<ZLSelectPhotoModel *> *lastSelectMoldels;

@property (nonatomic, weak) PYPhotosView *publishPhotosView;

@property (strong, nonatomic)UILabel * titleLabel;

@end

@implementation AffirmBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.affirmBookTBView];
    [self.view addSubview:self.doneButton];
    [self.customNavBar setTitle:@"确认收书"];
    dateSourceArray = [NSMutableArray arrayWithCapacity:1];
    
}

- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_doneButton setTitle:@"确认收书" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [_doneButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
        _doneButton.backgroundColor = MainColor;
    }
    return _doneButton;
}
- (UITableView *)affirmBookTBView
{
    if (!_affirmBookTBView) {
        _affirmBookTBView = [[UITableView alloc] init];
        _affirmBookTBView.dataSource = self;
        _affirmBookTBView.delegate = self;
        _affirmBookTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _affirmBookTBView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _affirmBookTBView;
}


#pragma mark - PYPhotosViewDelegate
- (void)photosView:(PYPhotosView *)photosView didAddImageClickedWithImages:(NSMutableArray *)images
{
    [self setuserImage];
}
// 进入预览图片时调用, 可以在此获得预览控制器，实现对导航栏的自定义
- (void)photosView:(PYPhotosView *)photosView didPreviewImagesWithPreviewControlelr:(PYPhotosPreviewController *)previewControlelr
{
    NSLog(@"进入预览图片");
}
- (void)setuserImage
{
    UIAlertController *alertController;
    if (!alertController) {
        alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击取消");
        }]];
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
            
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self pickerShow];
        }]];
        
    }else{
        [alertController addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self pickerShow];
        }]];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (selectPhotosArray.count == 9) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"最多9张图片" duration:MBProgressHUDDuration];
        NSLog(@"最多9张图片");
    }else{
        [dateSourceArray addObject:image];
        
    }
    [_publishPhotosView reloadDataWithImages:dateSourceArray];
}
- (void)pickerShow
{
    
    ZLPhotoActionSheet *actionSheet1 = [[ZLPhotoActionSheet alloc] init];
    //设置照片最大选择数
    actionSheet1.maxSelectCount = 9;
    [actionSheet1 showPhotoLibraryWithSender:self lastSelectPhotoModels:self.lastSelectMoldels completion:^(NSArray<UIImage *> * _Nonnull selectPhotos, NSArray<ZLSelectPhotoModel *> * _Nonnull selectPhotoModels) {
        selectPhotosArray = selectPhotos;
        for (int i = 0; i < selectPhotos.count; i ++) {
            [dateSourceArray insertObject:selectPhotos[i] atIndex:0];
            if (dateSourceArray.count > 9) {
                [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"最多9张图片" duration:MBProgressHUDDuration];
                NSLog(@"最多9张图片");
                [dateSourceArray removeLastObject];
                break;
            }
        }
        [_affirmBookTBView reloadData];
        [_publishPhotosView reloadDataWithImages:dateSourceArray];
        NSLog(@"%@", selectPhotos);
    }];
}

#pragma mark -----UITableViewDelegate---------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AffBookTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
        if (!cell) {
            cell = [[AffBookTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
        }
        return cell;
    }else if (indexPath.row == 1){
        BookBreakdownTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        
        if (!cell) {
            cell = [[BookBreakdownTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 2){
        AFFBookNewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
        
        if (!cell) {
            cell = [[AFFBookNewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter3];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter3];
        }
        [cell addSubview:self.titleLabel];
        if (!_publishPhotosView) {
            PYPhotosView *publishPhotosView = [PYPhotosView photosView];
            // 2. 添加本地图片
            NSMutableArray *imagesM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(0); i++) {
                [imagesM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%02d", i + 1]]];
            }
            publishPhotosView.py_x = 15;
            publishPhotosView.py_y = 70;
            // 2.1 设置本地图片
            publishPhotosView.images = imagesM;
            publishPhotosView.photosMaxCol = 4;
            // 3. 设置代理
            publishPhotosView.delegate = self;
            publishPhotosView.photoMargin = 8;
            publishPhotosView.photoWidth = (SCREEN_WIDTH - 30 - 24) / 4;
            publishPhotosView.photoHeight = (SCREEN_WIDTH - 30 - 24) / 4;
            // 4. 添加photosView
            [cell addSubview:publishPhotosView];
            self.publishPhotosView = publishPhotosView;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 88;
    }else if (indexPath.row == 1){
        return 126;
    }else if (indexPath.row == 2){
        return 105;
    }else {
        return [self getlineCount:dateSourceArray.count];
    }
}
- (CGFloat)getlineCount:(NSInteger)count
{
    if (count < 4) {
        return 80 + (SCREEN_WIDTH - 30 - 24) / 4;
    }else if (count >= 4 & count < 8){
        return 80 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 2 + 8;
    }else{
        return 80 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 3 + 16;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 24, SCREEN_WIDTH - 30, 21);
        _titleLabel.text = @"如有损坏，上传图片";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _titleLabel;
}

- (void)doneButton:(UIButton *)btn
{
    //    if (dateSourceArray.count < 1) {
    //        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"至少选择一张图" duration:MBProgressHUDDuration];
    //        return;
    //    }
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    _affirmBookTBView.frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - 49 - top);
    
    _doneButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    
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
