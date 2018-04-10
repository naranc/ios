//
//  PDonateViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "PDonateViewController.h"
#import "QuestionViewController.h"
#import "ReceivingAdressViewController.h"
#import "ZLPhotoActionSheet.h"
#import "ZLShowBigImage.h"
#import "ZLDefine.h"
#import "ZLCollectionCell.h"
#import "PYPhotosView.h"
#import "PYPhotosPreviewController.h"
#import "OldLevelTableViewCell.h"
#import "WeightTableViewCell.h"
#import "PriceTableViewCell.h"

static NSString * cellitifter0 = @"cellitifter0";
static NSString * cellitifter1 = @"cellitifter1";
static NSString * cellitifter2 = @"cellitifter2";
static NSString * selectOldLevelCell = @"selectOldLevelCell";
static NSString * selectWeightCell = @"selectWeightCell";
static NSString * selectPriceCell = @"selectPriceCell";


@interface PDonateViewController ()<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PYPhotosViewDelegate>
{
    NSMutableArray * dateSourceArray;
    NSArray * selectPhotosArray;
}
@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) UITableView * addImageTBView;

@property (nonatomic, strong) UITextField * textTF;

@property (nonatomic, strong) UIView * graylineView;

@property (nonatomic, strong) UITextView * textView;

@property (nonatomic, strong) UILabel * placeholder;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (strong, nonatomic) NSArray<ZLSelectPhotoModel *> *lastSelectMoldels;

@property (nonatomic, weak) PYPhotosView *publishPhotosView;

@end

@implementation PDonateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.addImageTBView];
    [self.view addSubview:self.doneButton];

    [self.customNavBar setTitle:@"发布捐赠"];
    dateSourceArray = [NSMutableArray arrayWithCapacity:1];
}


- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [_doneButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
        _doneButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
    }
    return _doneButton;
}
- (UITableView *)addImageTBView
{
    if (!_addImageTBView) {
        _addImageTBView = [[UITableView alloc] init];
        _addImageTBView.dataSource = self;
        _addImageTBView.delegate = self;
        _addImageTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _addImageTBView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _addImageTBView;
}


#pragma mark - PYPhotosViewDelegate
- (void)photosView:(PYPhotosView *)photosView didAddImageClickedWithImages:(NSMutableArray *)images
{
    [_textTF resignFirstResponder];
    [_textView resignFirstResponder];
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
        [_addImageTBView reloadData];
        [_publishPhotosView reloadDataWithImages:dateSourceArray];
        NSLog(@"%@", selectPhotos);
    }];
}

#pragma mark -----UITableViewDelegate---------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
        }
        cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [cell addSubview:self.textTF];
        [cell addSubview:self.graylineView];
        return cell;
    }else if (indexPath.row == 1){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.textView];
        [cell addSubview:self.placeholder];
        return cell;
        
    }else if (indexPath.row == 2){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2];
        }
        if (!_publishPhotosView) {
            PYPhotosView *publishPhotosView = [PYPhotosView photosView];
            // 2. 添加本地图片
            NSMutableArray *imagesM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(0); i++) {
                [imagesM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%02d", i + 1]]];
            }
            publishPhotosView.py_x = 15;
            publishPhotosView.py_y = 10;
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
    }else if (indexPath.row == 3){
        OldLevelTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:selectOldLevelCell];
        if (!cell) {
            cell = [[OldLevelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectOldLevelCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.row == 4){
        WeightTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:selectWeightCell];
        if (!cell) {
            cell = [[WeightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectWeightCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        PriceTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:selectPriceCell];
        if (!cell) {
            cell = [[PriceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectPriceCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60;
    }else if (indexPath.row == 1){
        return 143;
    }else if (indexPath.row == 2){
        return [self getlineCount:dateSourceArray.count];
    }else if (indexPath.row == 3){
        return 100;
    }else if (indexPath.row == 4){
        return 57;
    }else{
        return 93;
    }
}
- (CGFloat)getlineCount:(NSInteger)count
{
    if (count < 4) {
        return 20 + (SCREEN_WIDTH - 30 - 24) / 4;
    }else if (count >= 4 & count < 8){
        return 20 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 2 + 8;
    }else{
        return 20 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 3 + 16;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_textTF resignFirstResponder];
    [_textView resignFirstResponder];
}

- (void)doneButton:(UIButton *)btn
{
    
    
    if ([_textTF.text isEqualToString:@""] || _textTF.text.length == 0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入标题" duration:MBProgressHUDDuration];
        return;
    }else{
        NSString *str = [_textTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([str isEqualToString:@""] || str.length == 0) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入标题" duration:MBProgressHUDDuration];
            _textTF.text = @"";
            return ;
        }
    }
    if ([_textView.text isEqualToString:@""] || _textView.text.length == 0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入内容" duration:MBProgressHUDDuration];
        return;
    }else{
        NSString *str = [_textView.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([str isEqualToString:@""] || str.length == 0) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入内容" duration:MBProgressHUDDuration];
            _textView.text = @"";
            return ;
        }
    }
    if (dateSourceArray.count < 1) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"至少选择一张图" duration:MBProgressHUDDuration];
        return;
    }
    
    
    OldLevelTableViewCell * oldLevelCell;
    WeightTableViewCell * weightCell;
    PriceTableViewCell * priceCell;

    if (!oldLevelCell) {
        NSIndexPath * indexPtah = [NSIndexPath indexPathForRow:3 inSection:0];
        oldLevelCell = [_addImageTBView cellForRowAtIndexPath:indexPtah];
    }
    if (!weightCell) {
        NSIndexPath * indexPtah = [NSIndexPath indexPathForRow:4 inSection:0];
        weightCell = [_addImageTBView cellForRowAtIndexPath:indexPtah];
    }
    if (!priceCell) {
        NSIndexPath * indexPtah = [NSIndexPath indexPathForRow:5 inSection:0];
        priceCell = [_addImageTBView cellForRowAtIndexPath:indexPtah];
    }

    if (!oldLevelCell.oldLevel) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择新旧程度" duration:MBProgressHUDDuration];
        return;
    }
    
    //检查输入框是否为空
    if ([weightCell.priceTF.text isEqualToString:@""] || weightCell.priceTF.text.length == 0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写重量" duration:MBProgressHUDDuration];
        return;
    }else{
        NSString *str = [weightCell.priceTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([str isEqualToString:@""] || str.length == 0) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写重量" duration:MBProgressHUDDuration];
            weightCell.priceTF.text = @"";
            return;
        }
    }
    
    
    
    //检查输入框是否为空
    if ([priceCell.priceTF.text isEqualToString:@""] || priceCell.priceTF.text.length == 0) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写价格" duration:MBProgressHUDDuration];
        return;
    }else{
        NSString *str = [priceCell.priceTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([str isEqualToString:@""] || str.length == 0) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请填写价格" duration:MBProgressHUDDuration];
            priceCell.priceTF.text = @"";
            return;
        }
    }
    
    
    
    
    NSString * urlStr = [NSString stringWithFormat:@"%@/file/upload",BaseUrl];
//    NSString * adressString = [NSString stringWithFormat:@"%@%@%@%@",adressModel.province,adressModel.city,adressModel.county,adressModel.mailAddress];

    [AFNetworkingUtil uploadImageWithOperations:nil withImageArray:dateSourceArray withtargetWidth:SCREEN_WIDTH withUrlString:urlStr withSuccessBlock:^(NSDictionary *object) {
        NSLog(@"upImageObject === %@",object);
        NSArray * array = object[@"data"][@"data"];
        NSString * imageStr = [array componentsJoinedByString:@","];
        NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken,@"commodityType":_tag,@"orderTitle":_textTF.text,@"orderContent":_textView.text,@"orderImgs":imageStr,@"orderPrice":priceCell.priceTF.text,@"estimateWeight":weightCell.priceTF.text,@"agingDegree":oldLevelCell.oldLevel,@"province":@"全国",@"city":@"全国",@"county":@"全国"};
        NSLog(@"publish Paeament= %@",dic);
        QuestionViewController * questionVC = [[QuestionViewController alloc] init];
        questionVC.paraments = dic;
        [self.navigationController pushViewController:questionVC animated:YES];
    } withFailurBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } withUpLoadProgress:^(float progress) {
        NSLog(@"progress = %f",progress);
    }];
    
    
    
    
    
   
    
//    SelectFreightTableViewCell * fCell;
//    SelectAnonymityTableViewCell * acell;
//    if (!fCell) {
//        NSIndexPath * indexPtah = [NSIndexPath indexPathForRow:4 inSection:0];
//        fCell = [_addImageTBView cellForRowAtIndexPath:indexPtah];
//    }
//    if (!acell) {
//        NSIndexPath * indexPtah = [NSIndexPath indexPathForRow:5 inSection:0];
//        acell = [_addImageTBView cellForRowAtIndexPath:indexPtah];
//    }
//    return;
//    if ([_publishTP isEqualToString:@"wish"]) {
//        ReceivingAdressViewController * adressVC = [[ReceivingAdressViewController alloc] init];
//        adressVC.titleStr = @"发布心愿";
//        [self.navigationController pushViewController:adressVC animated:YES];
//    }else{
//        LastViewController * lastVC = [[LastViewController alloc] init];
//        lastVC.titleStr = @"发布捐赠";
//        [self.navigationController pushViewController:lastVC animated:YES];
//    }
    
}

#pragma mark ---- UITableViewCell ---  row = 0 ---------
- (UITextField *)textTF
{
    if (!_textTF) {
        UIFont * tfFont = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _textTF = [[UITextField alloc] init];
        _textTF.frame = CGRectMake(0, 10, SCREEN_WIDTH, 50);
        _textTF.placeholder = @"添加标题";
        _textTF.font = tfFont;
        _textTF.returnKeyType = UIReturnKeyDone;
        _textTF.delegate = self;
        //        [_textTF becomeFirstResponder];
        _textTF.backgroundColor =kUIColorFromRGB(0xFFFFFF);
        _textTF.textColor = kUIColorFromRGB(0x999999);
        _textTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)];
        _textTF.leftViewMode = UITextFieldViewModeAlways;
        _textTF.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)];
        _textTF.rightViewMode = UITextFieldViewModeAlways;
        
    }
    return _textTF;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (UIView *)graylineView
{
    if (!_graylineView) {
        _graylineView = [[UIView alloc] init];
        _graylineView.frame = CGRectMake(15, 59.5, SCREEN_WIDTH - 30, 0.5);
        _graylineView.backgroundColor = kUIColorFromRGB(0xBBBBBB);
    }
    return _graylineView;
}

#pragma mark ---- UITableViewCell ---  row = 1 ---------

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.frame =  CGRectMake(10, 5, SCREEN_WIDTH - 20, 130);
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _textView.font = font;
        _textView.scrollEnabled = YES;
        _textView.delegate = self;
        _textView.returnKeyType = UIReturnKeyDone;
        _textView.font = [UIFont systemFontOfSize:16];
    }
    return _textView;
}
- (UILabel *)placeholder
{
    if (!_placeholder) {
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _placeholder = [[UILabel alloc] init];
        _placeholder.frame =  CGRectMake(15, 9, SCREEN_WIDTH - 48, 25);
        _placeholder.textColor = kUIColorFromRGB(0x999999);
        _placeholder.font = font;
        _placeholder.text = @"请开始你的表演，介绍一下你所捐赠的物品...";
    }
    return _placeholder;
}

#pragma mark -- UITextViewDelgate 方法-----------

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    if (textView.text.length == 0){
        if ([text isEqualToString:@""]) {
            _placeholder.hidden = NO;
        } else {
            _placeholder.hidden = YES;
        }
    }else{
        if (textView.text.length == 1) {
            if ([text isEqualToString:@""]) {
                _placeholder.hidden = NO;
            } else {
                _placeholder.hidden = YES;
            }
        } else {
            _placeholder.hidden = YES;
        }
    }
    return YES;
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    _addImageTBView.frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - 49 - top);
    
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
