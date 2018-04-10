//
//  LoveViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "LoveViewController.h"

@interface LoveViewController ()

@end

@implementation LoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"爱心"];
    
    
    
    UIImageView * bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 80, 400)];
    bottomView.image = [UIImage imageNamed:@"bottomImage"];
    bottomView.backgroundColor = [UIColor yellowColor];
    bottomView.contentMode = UIViewContentModeScaleAspectFit;
//    bottomView.clipsToBounds = YES;
//    [self.view addSubview:bottomView];
    
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
