//
//  DontaBookViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "DontaBookViewController.h"
#import "ZLPhotoActionSheet.h"
#import "ZLShowBigImage.h"
#import "ZLDefine.h"
#import "ZLCollectionCell.h"
#import "PYPhotosView.h"
#import "PYPhotosPreviewController.h"
#import "OldLevelTableViewCell.h"
#import "BookInfoTableViewCell.h"
#import "BookTagsTableViewCell.h"
#import "DBookCommentTableViewCell.h"

static NSString * cellitifter1 = @"cellitifter1";
static NSString * cellitifter2 = @"cellitifter2";
static NSString * cellitifter3 = @"cellitifter3";
static NSString * cellitifter4 = @"cellitifter4";
static NSString * cellitifter5 = @"cellitifter5";
static NSString * cellitifter6 = @"cellitifter6";

@interface DontaBookViewController ()<UITableViewDelegate, UITableViewDataSource,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PYPhotosViewDelegate>
{
    NSMutableArray * dateSourceArray;
    NSArray * selectPhotosArray;
    
    NSArray * bookInfoTitleArray;
    NSArray * bookContentPL;
    CGFloat keyboardHeight;

}
@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) UITableView * addImageTBView;

@property (nonatomic, strong) UITextView * textView;

@property (nonatomic, strong) UILabel * placeholder;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (strong, nonatomic) NSArray<ZLSelectPhotoModel *> *lastSelectMoldels;

@property (nonatomic, weak) PYPhotosView *publishPhotosView;

@property (strong, nonatomic)UILabel * titleLabel;

@property (strong, nonatomic)UIView * bgView;

@end

@implementation DontaBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.addImageTBView];
    [self.view addSubview:self.doneButton];
    bookInfoTitleArray = @[@"书名",@"作者",@"页数",@"价格"];
    [self.customNavBar setTitle:@"赠书"];
    [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"nav_back"]];
    weakify(self);
    self.customNavBar.onClickLeftButton = ^{
        [weakSelf.navigationController dismissViewControllerAnimated:YES completion:nil];
    };
    dateSourceArray = [NSMutableArray arrayWithCapacity:1];
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardHeight = keyboardRect.size.height;
    [_addImageTBView setContentOffset:CGPointMake(0, _addImageTBView.contentOffset.y + keyboardHeight - 49)];
    _addImageTBView.scrollEnabled = NO;
}
//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [_addImageTBView setContentOffset:CGPointMake(0, _addImageTBView.contentOffset.y - keyboardHeight + 49)];
    _addImageTBView.scrollEnabled = YES;
}

- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_doneButton setTitle:@"赠出" forState:UIControlStateNormal];
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
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 83 + (SCREEN_WIDTH - 30 - 24) / 4);
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}

#pragma mark - PYPhotosViewDelegate
- (void)photosView:(PYPhotosView *)photosView didAddImageClickedWithImages:(NSMutableArray *)images
{
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
        CGFloat height = [self getlineCount:dateSourceArray.count];
        _bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height - 8);
        NSLog(@"%@", selectPhotos);
    }];
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(15, 24, SCREEN_WIDTH - 30, 21);
        _titleLabel.text = @"添加图书封面";
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _titleLabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _titleLabel;
}
#pragma mark -----UITableViewDelegate---------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        [cell addSubview:self.bgView];
        [_bgView addSubview:self.titleLabel];
        if (!_publishPhotosView) {
            PYPhotosView *publishPhotosView = [PYPhotosView photosView];
            // 2. 添加本地图片
            NSMutableArray *imagesM = [NSMutableArray array];
            for (int i = 0; i < arc4random_uniform(0); i++) {
                [imagesM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%02d", i + 1]]];
            }
            publishPhotosView.py_x = 15;
            publishPhotosView.py_y = 67;
            // 2.1 设置本地图片
            publishPhotosView.images = imagesM;
            publishPhotosView.photosMaxCol = 4;
            // 3. 设置代理
            publishPhotosView.delegate = self;
            publishPhotosView.photoMargin = 8;
            publishPhotosView.photoWidth = (SCREEN_WIDTH - 30 - 24) / 4;
            publishPhotosView.photoHeight = (SCREEN_WIDTH - 30 - 24) / 4;
            // 4. 添加photosView
            [_bgView addSubview:publishPhotosView];
            self.publishPhotosView = publishPhotosView;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
        BookInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
        if (!cell) {
            cell = [[BookInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBookInfoCellTitleAndContent:bookInfoTitleArray[indexPath.row - 1] content:@"请输入" indexPath:indexPath];
        return cell;
        
    }else if (indexPath.row == 5){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter3];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter3];
        }
        cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 6){
        OldLevelTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter4];
        if (!cell) {
            cell = [[OldLevelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter4];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.row == 7){
        BookTagsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter5];
        if (!cell) {
            cell = [[BookTagsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter5];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        DBookCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter6];
        if (!cell) {
            cell = [[DBookCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter6];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [self getlineCount:dateSourceArray.count];
    }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
        return 50;
    }else if (indexPath.row == 5){
        return 105 + 8;
    }else if (indexPath.row == 6){
        return 105;
    }else if (indexPath.row == 7){
        return 149;
    }else{
        return 154;
    }
}
- (CGFloat)getlineCount:(NSInteger)count
{
    if (count < 4) {
        return 92 + (SCREEN_WIDTH - 30 - 24) / 4;
    }else if (count >= 4 & count < 8){
        return 92 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 2 + 8;
    }else{
        return 92 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 3 + 16;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_textView resignFirstResponder];
}

- (void)doneButton:(UIButton *)btn
{
    
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
    
    
    if (!oldLevelCell) {
        NSIndexPath * indexPtah = [NSIndexPath indexPathForRow:3 inSection:0];
        oldLevelCell = [_addImageTBView cellForRowAtIndexPath:indexPtah];
    }
    if (!oldLevelCell.oldLevel) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择新旧程度" duration:MBProgressHUDDuration];
        return;
    }
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
