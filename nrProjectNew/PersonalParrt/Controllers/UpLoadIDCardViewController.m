//
//  UpLoadIDCardViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/27.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "UpLoadIDCardViewController.h"
#import "AVCaptureViewController.h"

@interface UpLoadIDCardViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    BOOL isFront;
    BOOL hasFrontImage;
    BOOL hasSideImage;

}

@property (nonatomic, strong) UILabel * firstLabel;

@property (nonatomic, strong) UILabel * secondLabel;

@property (nonatomic, strong) UIImageView * frontButton;

@property (nonatomic, strong) UIImageView * sideButton;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (nonatomic, strong) UIButton * doneButton;

@end

@implementation UpLoadIDCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"上传身份证"];
    [self.view addSubview:self.firstLabel];
    [self.view addSubview:self.frontButton];
    [self.view addSubview:self.sideButton];
    [self.view addSubview:self.secondLabel];
    [self.view addSubview:self.doneButton];


}
- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_doneButton setTitle:@"提交" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        [_doneButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
        _doneButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
    }
    return _doneButton;
}
- (void)doneButton:(UIButton *)btn
{
    if (hasFrontImage) {
        if (!hasSideImage) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请上传身份证背面照片" duration:MBProgressHUDDuration];
            return;
        }
    }
    if (hasSideImage) {
        if (!hasFrontImage) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请上传身份证正面照片" duration:MBProgressHUDDuration];
            return;
        }
    }
    
    if (!hasFrontImage && !hasSideImage) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请上传身份证照片" duration:MBProgressHUDDuration];
        return;
    }
    
    NSArray * imageArray = @[_frontButton.image, _sideButton.image];
    NSString * urlStr = [NSString stringWithFormat:@"%@/file/upload",BaseUrl];
    [AFNetworkingUtil uploadImageWithOperations:nil withImageArray:imageArray withtargetWidth:SCREEN_WIDTH withUrlString:urlStr withSuccessBlock:^(NSDictionary *object) {
        NSLog(@"upImageObject === %@",object);
        NSArray * array = object[@"data"][@"data"];
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        //添加字典
        [dictionary setObject:array[0] forKey:@"cardPositive"];
        [dictionary setObject:array[1] forKey:@"cardOpposite"];
        [dictionary addEntriesFromDictionary:_paraments];
        
        if (dictionary) {
            [UserModel postIdCardInfomationWithParament:dictionary success:^(NSDictionary *dic) {
                NSLog(@"%@",dic);
                NSLog(@"msg = %@",dic[@"msg"]);
                if ([dic[@"code"] isEqualToString:NormalStatus]) {
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES
                                             text:dic[@"msg"] duration:MBProgressHUDDuration];
                }
            } withFailureBlock:^(NSError *error) {
                NSLog(@"error = %@",error);
            }];
        }

    } withFailurBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } withUpLoadProgress:^(float progress) {
        NSLog(@"progress = %f",progress);
    }];
    
}

- (UILabel *)firstLabel
{
    if (!_firstLabel) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _firstLabel.textColor = kUIColorFromRGB(0x999999);
        _firstLabel.textAlignment = NSTextAlignmentCenter;
        _firstLabel.text = @"拍摄您的二代身份证原件，请确保图片清晰、四角完整";
    }
    return _firstLabel;
}
- (UILabel *)secondLabel
{
    if (!_secondLabel) {
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _secondLabel.textAlignment = NSTextAlignmentCenter;
        _secondLabel.textColor = kUIColorFromRGB(0x999999);
        _secondLabel.text = @"信息仅用于身份验证，那然公益会保障您的信息安全";

    }
    return _secondLabel;
}
- (UIImageView *)frontButton
{
    if (!_frontButton) {
        _frontButton = [[UIImageView alloc] init];
        _frontButton.image = [UIImage imageNamed:@"renxiangye"];
        _frontButton.contentMode = UIViewContentModeScaleAspectFill;
        _frontButton.clipsToBounds = YES;
        _frontButton.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFrontButton)];
        [_frontButton addGestureRecognizer:singleTap];

    }
    return _frontButton;
}
- (void)clickFrontButton
{
//    AVCaptureViewController *avCaptureVC = [[AVCaptureViewController alloc] init];
//    [self.navigationController pushViewController:avCaptureVC animated:YES];
    isFront = YES;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
    

}
- (UIImageView *)sideButton
{
    if (!_sideButton) {
        _sideButton = [[UIImageView alloc] init];
        _sideButton.image = [UIImage imageNamed:@"guohuiye"];
        _sideButton.contentMode = UIViewContentModeScaleAspectFill;
        _sideButton.clipsToBounds = YES;
        _sideButton.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSideButton)];
        [_sideButton addGestureRecognizer:singleTap];
    }
    return _sideButton;
}
- (void)clickSideButton
{
//    扫描
//    AVCaptureViewController *avCaptureVC = [[AVCaptureViewController alloc] init];
//    [self.navigationController pushViewController:avCaptureVC animated:YES];
    isFront = NO;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
    
}
- (UIImagePickerController *)imagePickerController
{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.editing = YES;
        _imagePickerController.allowsEditing = YES;
        _imagePickerController.delegate = self;
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    return _imagePickerController;
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (isFront) {
        _frontButton.image = image;
        hasFrontImage = YES;
    }else{
        hasSideImage = YES;
        _sideButton.image = image;
    }
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    _firstLabel.frame = CGRectMake(0, top + 26, SCREEN_WIDTH, 23);
    
    _secondLabel.frame = CGRectMake(0, SCREEN_HEIGHT - top - 50 - 17, SCREEN_WIDTH, 17);
    
    CGFloat wight = (SCREEN_WIDTH - 78*2);
    
    CGFloat height = wight * 140 / 219;
    
    CGFloat top1 = (SCREEN_HEIGHT - top - 26 - 23 - 50 - 17 - height*2 - 50) * 41 / 157;

    _frontButton.frame = CGRectMake(78, _firstLabel.bottom + top1, wight, height);
    
    _sideButton.frame = CGRectMake(78, _frontButton.bottom + 50, wight, height);

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
