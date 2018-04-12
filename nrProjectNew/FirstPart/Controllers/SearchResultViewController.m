//
//  SearchResultViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/11.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SearchResultViewController.h"
#import "NoStatusTableViewCell.h"
#import "BookTableViewCell.h"

@interface SearchResultViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * booksArray;

@property (nonatomic, strong)UITableView * searchResultTableView;

@property (strong, nonatomic) UIImageView * noBooksImage;

@property (strong, nonatomic) UILabel * noBooksLabel;

@end

@implementation SearchResultViewController
- (NSMutableArray *)booksArray{
    if (!_booksArray) {
        _booksArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _booksArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.searchResultTableView];
    
    
}
- (UITableView *)searchResultTableView
{
    if (!_searchResultTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top + 1, SCREEN_WIDTH, SCREEN_HEIGHT - top - 1);
        _searchResultTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _searchResultTableView.delegate = self;
        _searchResultTableView.dataSource = self;
        _searchResultTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _searchResultTableView.showsVerticalScrollIndicator = NO;
        _searchResultTableView.backgroundColor = [UIColor whiteColor];
        _searchResultTableView.estimatedRowHeight = 0;
        _searchResultTableView.estimatedSectionHeaderHeight = 0;
        _searchResultTableView.estimatedSectionFooterHeight = 0;
    }
    return _searchResultTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_booksArray) {
        BookTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter1"];
        if (!cell) {
            cell = [[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter1"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }else{
        
        
        if (indexPath.row == 0) {
            NoStatusTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter2"];
            if (!cell) {
                cell = [[NoStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter2"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            NoStatusTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter3"];
            if (!cell) {
                cell = [[NoStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter3" noBookHelp:YES];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_booksArray.count) {
        return _booksArray.count;
    }else{
        return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_booksArray.count) {
        return 100;
    }else{
        
        if (indexPath.row == 0) {
            return 143;
        }else{
            return 106;
        }
    }
   
}
- (void)refeshSearchTags
{
    [self.booksArray addObject:@"1111"];
    [_searchResultTableView reloadData];
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
