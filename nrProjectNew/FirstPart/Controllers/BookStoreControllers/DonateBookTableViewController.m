//
//  DonateBookTableViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "DonateBookTableViewController.h"
#import "BookRackTableViewCell.h"

static NSString * cellitifter = @"cellitifter";

@interface DonateBookTableViewController ()

@property (nonatomic, strong) UIView * footerView;

@end

@implementation DonateBookTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.、
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 74, 0);
//    [self.view addSubview:self.footerView];

}


#pragma mark --
#pragma mark -------------UITableView------Delegate方法----------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookRackTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
    if (!cell) {
        cell = [[BookRackTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
    }
    [cell configCellWithModel:nil indexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
