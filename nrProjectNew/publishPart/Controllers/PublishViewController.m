//
//  PublishViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/21.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "PublishViewController.h"
#import "PWishViewController.h"
#import "SelectTagsViewController.h"
#import "ApproveView.h"
#import "PersonApproveViewController.h"

@interface PublishViewController ()

@property (nonatomic, strong) UIButton * closeButton;

@property (nonatomic, strong) ImageTextButton * publishWishButton;

@property (nonatomic, strong) ImageTextButton * publishDonateButton;

@property (nonatomic, strong) ApproveView * approveView;


@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    [self.view addSubview:self.closeButton];
    [self.view addSubview:self.publishWishButton];
    [self.view addSubview:self.publishDonateButton];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.approveView];
}
- (ApproveView *)approveView
{
    if (!_approveView) {
        _approveView = [[ApproveView alloc] init];
        _approveView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _approveView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _approveView.hidden = YES;
        weakify(self);
        _approveView.onClickCloseButton = ^{
            weakSelf.approveView.hidden = YES;
        };
        _approveView.onClickApproveButton = ^{
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"去认证" duration:MBProgressHUDDuration];
            
            PersonApproveViewController * approveVC = [[PersonApproveViewController alloc] init];
            [weakSelf.navigationController pushViewController:approveVC animated:YES];

            
        };
    }
    return _approveView;
}
- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"fabu_btn_cha"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closePublishPage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}
- (ImageTextButton *)publishWishButton
{
    if (!_publishWishButton) {
        _publishWishButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _publishWishButton.midSpacing = 13;
        _publishWishButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:17];
        _publishWishButton.imageSize = CGSizeMake(170, 170);
        [_publishWishButton setTitle:@"发布心愿" forState:UIControlStateNormal];
        [_publishWishButton setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _publishWishButton.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_publishWishButton setImage:[UIImage imageNamed:@"fabu_btn_fabuxinyuan"] forState:UIControlStateNormal];
        [_publishWishButton addTarget:self action:@selector(publishPushTagsButton:) forControlEvents:UIControlEventTouchUpInside];
        _publishWishButton.tag = 1001;

    }
    return _publishWishButton;
}

- (ImageTextButton *)publishDonateButton
{
    if (!_publishDonateButton) {
        _publishDonateButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _publishDonateButton.midSpacing = 13;
        _publishDonateButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:17];
        _publishDonateButton.imageSize = CGSizeMake(170, 170);
        [_publishDonateButton setTitle:@"发布捐赠" forState:UIControlStateNormal];
        [_publishDonateButton setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _publishDonateButton.layoutStyle = ImageTextButtonStyleUpImageDownTitle;
        [_publishDonateButton setImage:[UIImage imageNamed:@"fabu_btn_fabujuanzeng"] forState:UIControlStateNormal];
        [_publishDonateButton addTarget:self action:@selector(publishPushTagsButton:) forControlEvents:UIControlEventTouchUpInside];
        _publishDonateButton.tag = 1002;
    }
    return _publishDonateButton;
}
- (void)publishPushTagsButton:(UIButton *)btn
{
    
    if ([[UserModel getUser].certificationType isEqualToString:@"SUCCESS"]) {
        
        SelectTagsViewController * tagsVC = [[SelectTagsViewController alloc] init];
        //    UINavigationController * navc = [[UINavigationController alloc] initWithRootViewController:tagsVC];
        if (btn.tag == 1001) {
            tagsVC.publishTP = @"wish";
        }else{
            tagsVC.publishTP = @"donate";
        }
        [self.navigationController pushViewController:tagsVC animated:YES];
        //    [self presentViewController:navc animated:YES completion:nil];
    }else{
        self.approveView.hidden = NO;
    }
}

- (void)closePublishPage:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
 -(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top;
    if ([WRNavigationBar isIphoneX]) {
        top = 137;
    }else{
        top = 80;
    }
    CGFloat wight = SCREEN_WIDTH - 200;
    
    _closeButton.frame = CGRectMake((SCREEN_WIDTH - 28) / 2, SCREEN_HEIGHT - 40 - 28, 28, 28);
    
    _publishWishButton.frame = CGRectMake(100, top, wight, wight + 13 + 25);
    
    _publishDonateButton.frame = CGRectMake(100, _publishWishButton.bottom + 53, wight, wight + 13 + 25);

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
