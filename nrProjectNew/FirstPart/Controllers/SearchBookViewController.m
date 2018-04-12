//
//  SearchBookViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/11.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SearchBookViewController.h"
#import "SearchTagsViewController.h"
#import "SearchResultViewController.h"
#import "SearchTagHistory.h"
@interface SearchBookViewController ()<UITextFieldDelegate>
{
    CGFloat searchViewHeight;
}
@property (nonatomic, strong) UIView * searchBGView;

@property (nonatomic, strong) UIView * searchView;

@property (nonatomic, strong) UIImageView * searchImageView;

@property (nonatomic, strong) UITextField * searchTF;

@property (nonatomic, strong) UIButton * cancelButton;

@end

@implementation SearchBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customNavBar.hidden = YES;
    searchViewHeight = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    [self.view addSubview:self.searchBGView];
    [_searchBGView addSubview:self.searchView];
    [_searchBGView addSubview:self.cancelButton];
    
    [_searchView addSubview:self.searchImageView];
    [_searchView addSubview:self.searchTF];
}
- (UIView *)searchBGView
{
    if (!_searchBGView) {
        _searchBGView = [[UIView alloc] init];
        _searchBGView.frame = CGRectMake(0, 0, SCREEN_WIDTH, searchViewHeight);
        _searchBGView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
    }
    return _searchBGView;
}

- (UIView *)searchView
{
    if (!_searchView) {
        _searchView = [[UIView alloc] init];
        if ([WRNavigationBar isIphoneX]) {
            _searchView.frame = CGRectMake(17, 27 + 24, SCREEN_WIDTH - 17 - 61, 30);
        }else{
            _searchView.frame = CGRectMake(17, 27, SCREEN_WIDTH - 17 - 61, 30);
        }
        _searchView.backgroundColor = kUIColorFromRGB(0xF5F5F5);
        _searchView.layer.cornerRadius = 4.0f;
        _searchView.clipsToBounds = YES;
    }
    return _searchView;
}
- (UIImageView *)searchImageView
{
    if (!_searchImageView) {
        _searchImageView = [[UIImageView alloc] init];
        _searchImageView.frame = CGRectMake(12, 8, 15, 15);
        _searchImageView.image = [UIImage imageNamed:@"topnav_btn_sousuo"];
    }
    return _searchImageView;
}
- (UITextField *)searchTF
{
    if (!_searchTF) {
        _searchTF = [[UITextField alloc] init];
        _searchTF.frame = CGRectMake(_searchImageView.right + 8, 0, _searchView.width - 45, 30);
        _searchTF.backgroundColor = [UIColor clearColor];
        _searchTF.placeholder = @"红楼梦";
        _searchTF.delegate = self;
        _searchTF.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        _searchTF.returnKeyType = UIReturnKeySearch;
        [_searchTF becomeFirstResponder];
    }
    return _searchTF;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"搜索");
    
    if (textField.text.length == 0 || [textField.text isEqualToString:@""]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请输入关键词" duration:MBProgressHUDDuration];
        return YES;
    }else{
        [SearchTagHistory insertMessageContent:textField.text];
        [_searchTF resignFirstResponder];
        if ([self isKindOfClass:[SearchTagsViewController class]]) {
            SearchResultViewController * searchVC = [[SearchResultViewController alloc] init];
            [self.navigationController pushViewController:searchVC animated:YES];
        }else{
            //搜索结果页面去刷新
            [(SearchResultViewController *)self.navigationController.childViewControllers[1] refeshSearchTags];

        }
        return YES;
    }
}
- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        if ([WRNavigationBar isIphoneX]) {
            _cancelButton.frame = CGRectMake(SCREEN_WIDTH - 13 - 30, 56, 30, 21);
        }else{
            _cancelButton.frame = CGRectMake(SCREEN_WIDTH - 13 - 30, 32, 30, 21);
        }
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        [_cancelButton setTitleColor:kUIColorFromRGB(0x363636) forState:UIControlStateNormal];
        weakify(self);
        [_cancelButton addAction:^(UIButton *btn) {
            [weakSelf.searchTF resignFirstResponder];
            if ([weakSelf isKindOfClass:[SearchResultViewController class]]) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
//                SearchTagsViewController * searchVC = [SearchTagsViewController new];
                [weakSelf refeshSearchTags];
            }else{
                 [weakSelf dismissViewControllerAnimated:YES completion:nil];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}
- (void)refeshSearchTags
{
    [(SearchTagsViewController *)self.navigationController.childViewControllers[0] refeshSearchTags];
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
