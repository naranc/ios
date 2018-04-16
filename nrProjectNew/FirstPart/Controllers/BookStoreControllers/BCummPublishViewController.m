//
//  BCummPublishViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BCummPublishViewController.h"
#import "ReceivingAdressViewController.h"
#import "ZLPhotoActionSheet.h"
#import "ZLShowBigImage.h"
#import "ZLDefine.h"
#import "ZLCollectionCell.h"
#import "PYPhotosView.h"
#import "PYPhotosPreviewController.h"

static NSString * cellitifter0 = @"cellitifter0";
static NSString * cellitifter1 = @"cellitifter1";
static NSString * cellitifter2 = @"cellitifter2";
static NSString * cellitifter3 = @"cellitifter3";

@interface BCummPublishViewController ()<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PYPhotosViewDelegate>
{
    NSMutableArray * dateSourceArray;
    NSArray * selectPhotosArray;
}
@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) UITableView * addImageTBView;

@property (nonatomic, strong) UITextField * textTF;

@property (nonatomic, strong) UILabel * numberLabel;

@property (nonatomic, strong) UIView * graylineView;

@property (nonatomic, strong) UITextView * textView;

@property (nonatomic, strong) UILabel * placeholder;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (strong, nonatomic) NSArray<ZLSelectPhotoModel *> *lastSelectMoldels;

@property (nonatomic, weak) PYPhotosView *publishPhotosView;

@end

@implementation BCummPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.addImageTBView];
    [self.view addSubview:self.doneButton];
    [self.customNavBar setTitle:_titleStr];
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
        _doneButton.backgroundColor = MainColor;
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
        [cell addSubview:self.numberLabel];
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
        
    }else{
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
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60;
    }else if (indexPath.row == 1){
        return 143;
    }else{
        return [self getlineCount:dateSourceArray.count];
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
}

#pragma mark ---- UITableViewCell ---  row = 0 ---------
- (UITextField *)textTF
{
    if (!_textTF) {
        UIFont * tfFont = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _textTF = [[UITextField alloc] init];
        _textTF.frame = CGRectMake(0, 10, SCREEN_WIDTH, 50);
        _textTF.placeholder = @"添加标题（必须，最多50字）";
        _textTF.font = tfFont;
        _textTF.returnKeyType = UIReturnKeyDone;
        _textTF.delegate = self;
        _textTF.backgroundColor =kUIColorFromRGB(0xFFFFFF);
        _textTF.textColor = kUIColorFromRGB(0x999999);
        _textTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)];
        _textTF.leftViewMode = UITextFieldViewModeAlways;
        _textTF.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 0)];
        _textTF.rightViewMode = UITextFieldViewModeAlways;
    }
    return _textTF;
}
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.frame = CGRectMake(SCREEN_WIDTH - 54, 26, 30, 24);
        _numberLabel.text = @"50";
        _numberLabel.textColor = kUIColorFromRGB(0xBBBBBB);
        _numberLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    }
    return _numberLabel;
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
        _placeholder.text = @"说点什么吧";
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
