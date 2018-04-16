//
//  BookRackTableViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookRackTableViewController.h"
#import "DonateBookTableViewController.h"
#define textFont [UIFont fontWithName:@"PingFangSC-Regular" size:10.5]
#define labelTextColor kUIColorFromRGB(0x999999)

@interface BookRackTableViewController ()

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) UILabel * userRankeingL;

@property (nonatomic, strong) UILabel * markLabel;


@end

@implementation BookRackTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(28, 0, 74, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] init];
        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 28);
        _headView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _headView;
}
- (UILabel *)userRankeingL
{
    if (!_userRankeingL) {
        _userRankeingL = [[UILabel alloc] init];
        _userRankeingL.frame = CGRectMake(15, 0, 50, 28);
        _userRankeingL.font = textFont;
        _userRankeingL.textColor = labelTextColor;
    }
    return _userRankeingL;
}
- (UILabel *)markLabel
{
    if (!_markLabel) {
        _markLabel = [[UILabel alloc] init];
        _markLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - 50, 0, 50, 28);
        _markLabel.textAlignment = NSTextAlignmentRight;
        _markLabel.font = textFont;
        _markLabel.textColor = labelTextColor;
    }
    return _markLabel;
}


//- (void)clickOnRnkingType:(UIButton *)btn
//{
//    for (int i = 0; i < 4; i ++) {
//        UIButton * button = [_gyHeadView viewWithTag:i + 1001];
//        if (btn.tag == i + 1001) {
//            button.layer.borderWidth = 0.5;
//            button.layer.borderColor = kUIColorFromRGB(0x666666).CGColor;
//        }else{
//            button.layer.borderWidth = 0;
//        }
//    }
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
