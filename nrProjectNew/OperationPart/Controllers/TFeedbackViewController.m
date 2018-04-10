//
//  TFeedbackViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "TFeedbackViewController.h"
#import "ZLPhotoActionSheet.h"
#import "ZLShowBigImage.h"
#import "ZLDefine.h"
#import "ZLCollectionCell.h"
#import "PYPhotosView.h"
#import "PYPhotosPreviewController.h"

@interface TFeedbackViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PYPhotosViewDelegate>
{
    NSMutableArray * dateSourceArray;
    
    NSArray * selectPhotosArray;
}

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UITextView * textView;

@property (nonatomic, strong) UILabel * placeholder;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (strong, nonatomic) NSArray<ZLSelectPhotoModel *> *lastSelectMoldels;

@property (nonatomic, weak) PYPhotosView *publishPhotosView;

@end

@implementation TFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"感谢反馈"];
    dateSourceArray = [NSMutableArray arrayWithCapacity:1];

    
    [self.view addSubview:self.bgView];
    [_bgView addSubview:self.textView];
    
    if (!_publishPhotosView) {
        PYPhotosView *publishPhotosView = [PYPhotosView photosView];
        // 2. 添加本地图片
        NSMutableArray *imagesM = [NSMutableArray array];
        for (int i = 0; i < arc4random_uniform(0); i++) {
            [imagesM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%02d", i + 1]]];
        }
        publishPhotosView.py_x = 15;
        publishPhotosView.py_y = 176;
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
    

}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.userInteractionEnabled = YES;
        _bgView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _bgView;
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;

    _bgView.frame = CGRectMake(0, top + 12, SCREEN_WIDTH, 176 + 20 + (SCREEN_WIDTH - 30 - 24) / 4 + 20);
    
    _textView.frame = CGRectMake(15, 25, SCREEN_WIDTH - 15, 176 - 25);

}
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
        _placeholder.text = @"请说说你的故事吧...";
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
        //        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"最多9张图片" duration:MBProgressHUDDuration];
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
                //                [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"最多9张图片" duration:MBProgressHUDDuration];
                NSLog(@"最多9张图片");
                [dateSourceArray removeLastObject];
                break;
            }
        }
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        [self getlineCount:dateSourceArray.count];
        _bgView.frame = CGRectMake(0, top + 12, SCREEN_WIDTH, 176 + 20 + [self getlineCount:dateSourceArray.count] + 20);
        [_publishPhotosView reloadDataWithImages:dateSourceArray];
        NSLog(@"%@", selectPhotos);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
