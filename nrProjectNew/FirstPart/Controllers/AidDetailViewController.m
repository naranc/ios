//
//  AidDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/30.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "AidDetailViewController.h"
#import "AidModel.h"
#import "PartinTaskViewController.h"
#import "AidApplyDetailViewController.h"

@interface AidDetailViewController ()<UIWebViewDelegate,AidApplyDetailViewControllerDelegate,PartinTaskViewControllerDelegate>

@property (strong, nonatomic) UIWebView * webview;

@property (strong, nonatomic) UIButton * operationButton;

@property (strong, nonatomic) NSString * aidStatus;

@property (strong, nonatomic) NSDictionary * aidDic;

@property (strong, nonatomic) NSString * timeStr;

@property (strong, nonatomic) NSString * adressStr;

@end

@implementation AidDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"援助任务"];
    
    [self.view addSubview:self.webview];
    
    [self getAidStatus];
}
- (void)getAidStatus
{
    [AidModel getAidStatusWithParament:@{@"activityId":_aidId} success:^(NSDictionary *dic) {
        NSLog(@"aidStatusDic = %@",dic);
        NSString * aidStatus = dic[@"data"][@"activityStatus"];
        _timeStr = dic[@"data"][@"applyTime"];
        _adressStr = dic[@"data"][@"activityAddress"];
        if (!_operationButton) {
            [self.view addSubview:self.operationButton];
        }
        if ([aidStatus isEqualToString:@"INITIAL"]) {
            //报名中
            [self getMyApplyStatus];
        }else{
            [_operationButton setTitle:@"已结束" forState:UIControlStateNormal];
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (void)getMyApplyStatus
{
    [AidModel myApplyStatusWithParament:@{@"activityId":_aidId,@"accessToken":[UserModel getUser].accessToken} success:^(NSDictionary *dic) {
        NSString * aidStatus = dic[@"data"][@"applyStatus"];
        _aidStatus = aidStatus;
        _aidDic = dic[@"data"];
        NSLog(@"myApplyStatus = %@",dic);
        if (aidStatus) {
            if ([aidStatus isEqualToString:@"INITIAL"]) {
                //已报名
                [_operationButton setTitle:@"已报名" forState:UIControlStateNormal];
            }else if ([aidStatus isEqualToString:@"GOING"]){
                
                [_operationButton setTitle:@"完成中" forState:UIControlStateNormal];
            }else if ([aidStatus isEqualToString:@"SUCCESS"]){
                
                [_operationButton setTitle:@"已完成" forState:UIControlStateNormal];
            }else{
                [_operationButton setTitle:@"已拒绝" forState:UIControlStateNormal];
            }
            
        }else{
            //未报名
            [_operationButton setTitle:@"+ 接受任务" forState:UIControlStateNormal];
        }

    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (UIWebView *)webview
{
    if (!_webview) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        _webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top)];
        _webview.delegate = self;
//        _webview.scrollView.scrollEnabled = NO;
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.naranc.cn/rest/credentials/protocol"] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20.0]];
//        [_webview.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
        [_webview sizeToFit];
    }
    return _webview;
}
- (UIButton *)operationButton
{
    if (!_operationButton) {
        _operationButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _operationButton.frame = CGRectMake((SCREEN_WIDTH - 126)/2, SCREEN_HEIGHT - 81 - 41, 126, 41);
        _operationButton.backgroundColor = MainColor;
        _operationButton.layer.cornerRadius = 41/2;
        _operationButton.clipsToBounds = YES;
        [_operationButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _operationButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:18];
        weakify(self);
        [_operationButton addAction:^(UIButton *btn) {
            
            if ([btn.titleLabel.text isEqualToString:@"+ 接受任务"]) {
                //去报名
                PartinTaskViewController * partinVC = [[PartinTaskViewController alloc] init];
                partinVC.aidId = weakSelf.aidId;
                partinVC.delegate = weakSelf;
                [weakSelf.navigationController pushViewController:partinVC animated:YES];
                return;
            }
            
            if ([btn.titleLabel.text isEqualToString:@"已报名"]) {
                //已报名，查看报名详情
//                PartinTaskViewController * partinVC = [[PartinTaskViewController alloc] init];
//                partinVC.aidId = weakSelf.aidId;
//                [weakSelf.navigationController pushViewController:partinVC animated:YES];
                AidApplyDetailViewController * applyVC = [[AidApplyDetailViewController alloc] init];
                applyVC.delegate = self;
                applyVC.aidModel = _aidModel;
                applyVC.detailDic = _aidDic;
                applyVC.timeStr = _timeStr;
                applyVC.activityAddress = _adressStr;
                [self.navigationController pushViewController:applyVC animated:YES];
                return;
            }
            
            
            if ([weakSelf.aidStatus isEqualToString:@"waitApply"]) {
                //报名中
            }else if ([weakSelf.aidStatus isEqualToString:@"GOING"]){
                //正在进行中
            }else if ([weakSelf.aidStatus isEqualToString:@"SUCCESS"]){
                //结束或已完成
            }else{
                //放弃
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _operationButton;
}
- (void)refeshAidStatus
{
    [self getAidStatus];
}
- (void)partInSuccessRefeshAidStatus
{
    [self getAidStatus];
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
