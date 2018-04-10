//
//  CarriagingViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "CarriagingViewController.h"

@interface CarriagingViewController ()

@end

@implementation CarriagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"运输中"];
    
    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 200, SCREEN_WIDTH, 40);
    titleLabel.text = [NSString stringWithFormat:@"快递运单号 :%@",_mailCodeNumber];
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    titleLabel.textColor = kUIColorFromRGB(0x999999);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    
    
    UIButton * saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
    saveButton.frame = CGRectMake(15, titleLabel.bottom + 10, SCREEN_WIDTH - 30, 38);
    [saveButton setTitle:@"确认收货" forState:UIControlStateNormal];
    saveButton.backgroundColor = MainColor;
    [saveButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    saveButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [self.view addSubview:saveButton];
    

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
