//
//  SearchTagsViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/11.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "SearchTagsViewController.h"
#import "SearchResultViewController.h"
#import "SearchTagHistory.h"
#import "HotBorrowTableViewCell.h"
@interface SearchTagsViewController ()<UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate>
{
    UIView * hView;
}
@property (nonatomic, strong)UITableView * searchTagsTableView;
@property (nonatomic, strong)UILabel * searchLabel;
@property (nonatomic, strong)UIButton * deletebutton;
@property (strong, nonatomic) NSMutableArray * tagArray;
@property (strong, nonatomic) UILabel * noHisLabel;

@end

@implementation SearchTagsViewController
- (NSMutableArray *)tagArray
{
    if (!_tagArray) {
        self.tagArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _tagArray;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.tagArray = [SearchTagHistory getAllMessageContent];
//    self.tagArray = [_tagArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
//    if (_tagArray.count > 0) {
////        [_noHisLabel removeFromSuperview];
//        _deletebutton.hidden = NO;
//        [hView removeFromSuperview];
//        hView = [self creatUI:_tagArray];
//        cellHeight = hView.height + 50;
//    }
//=        hView = [self creatUI:_tagArray];
//        hView.frame = CGRectMake(hView.origin.x, historyImageView.bottom, hView.width, hView.height);
//        [_scrollView addSubview:hView];
//        [self setScrollViewContentOffset];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tagArray = [SearchTagHistory getAllMessageContent];
    _tagArray = [_tagArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    [self.view addSubview:self.searchTagsTableView];
}
- (UITableView *)searchTagsTableView
{
    if (!_searchTagsTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top + 1, SCREEN_WIDTH, SCREEN_HEIGHT - top - 1);
        _searchTagsTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _searchTagsTableView.delegate = self;
        _searchTagsTableView.dataSource = self;
        _searchTagsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _searchTagsTableView.showsVerticalScrollIndicator = NO;
        _searchTagsTableView.backgroundColor = [UIColor whiteColor];
        _searchTagsTableView.estimatedRowHeight = 0;
        _searchTagsTableView.estimatedSectionHeaderHeight = 0;
        _searchTagsTableView.estimatedSectionFooterHeight = 0;
    }
    return _searchTagsTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        [cell addSubview:self.searchLabel];
        [cell addSubview:self.deletebutton];
        self.tagArray = [SearchTagHistory getAllMessageContent];
        _tagArray = [_tagArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
        if (_tagArray.count) {
            [_noHisLabel removeFromSuperview];
            _deletebutton.hidden = NO;
            hView = [self creatUI:_tagArray];
            hView.frame = CGRectMake(hView.origin.x, _searchLabel.bottom + 10, hView.width, hView.height);
            [cell addSubview:hView];
        }else{
            [hView removeFromSuperview];
            _deletebutton.hidden = YES;
            [cell addSubview:self.noHisLabel];
        }
        return cell;
    }else{
        HotBorrowTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter11"];
        if (!cell) {
            cell = [[HotBorrowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter11"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        if (_tagArray.count) {
            return hView.height + 50;
        }else{
            return 100;
        }
        
    }else{
        return 218;
    }
}
- (UILabel *)searchLabel
{
    if (!_searchLabel) {
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 12, 50, 17)];
        _searchLabel.font = font;
        _searchLabel.textColor = kUIColorFromRGB(0x333333);
        _searchLabel.text = @"搜索历史";
    }
    return _searchLabel;
}
- (UILabel *)noHisLabel
{
    if (!_noHisLabel) {
        _noHisLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 30)];
        _noHisLabel.textAlignment = NSTextAlignmentCenter;
        _noHisLabel.textColor = kUIColorFromRGB(0x999999);
        _noHisLabel.font = [UIFont systemFontOfSize:15];
        _noHisLabel.text = @"暂无历史搜索";
    }
    return _noHisLabel;
}
- (UIButton *)deletebutton
{
    if (!_deletebutton) {
        _deletebutton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deletebutton.frame = CGRectMake(SCREEN_WIDTH - 15 - 16, 13, 16, 16);
        [_deletebutton setImage:[UIImage imageNamed:@"tanchuang_cha"] forState:UIControlStateNormal];
        [_deletebutton addAction:^(UIButton *btn) {
            //删除历史搜索
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"确定删除历史记录" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _deletebutton;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        for (NSString * str in _tagArray) {
            [SearchTagHistory deleteInspectContent:str];
        }
//        [hView removeFromSuperview];
//        _deletebutton.hidden = YES;
//        [_tagArray removeAllObjects];
//        cellHeight = 0;
        [_searchTagsTableView reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *)creatUI:(NSArray *)array{
    CGFloat bgViewWight = SCREEN_WIDTH - 40;
    CGFloat top = 31;
    // 保存前一个button的宽以及前一个button距离屏幕边缘的距
    CGFloat edge = 0;
    //设置button 距离父视图的高
    CGFloat h = 7;
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(7, top, bgViewWight, 200)];
    bgView.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:bgView];
    
    CGFloat y = 0.0;
    for (int i = 0; i < array.count; i ++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
        button.tag =100+i;
        button.backgroundColor = kUIColorFromRGB(0xEEEEEE);
        [button addTarget:self action:@selector(selectClick:) forControlEvents:(UIControlEventTouchUpInside)];
        button.clipsToBounds = YES;
        button.layer.cornerRadius = 4.0f;
        //确定文字的字号
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        
        //计算文字的长度值
        CGFloat length = [[GlobalSingleton Singleton] getWidthWithText:array[i] higth:36 font:font].size.width;
        
        //为button赋值
        [button setTitle:array[i] forState:(UIControlStateNormal)];
        button.titleLabel.font = font;
        //设置button的frame
        button.frame =CGRectMake(edge + 10, h, length + 10, 36);
        
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if (edge+10+length +15 >bgViewWight) {
            //换行时将左边距设置为10
            edge =0;
            //距离父视图的高度变化
            h=h+button.frame.size.height +10;
            //标签换行后的frame
            button.frame =CGRectMake(edge+10, h, length+10, 36);
        }
        //获取前一个button的尾部位置位置
        edge = button.frame.size.width +button.frame.origin.x;
        [button setTitleColor:kUIColorFromRGB(0x999999) forState:(UIControlStateNormal)];
        
        [bgView addSubview:button];
        
        //用来记录最后一个button的位置
        y = button.origin.y;
    }
    bgView.frame = CGRectMake(7, top, bgViewWight, y + 40);
    return bgView;
}
- (void)refeshData
{
    [_searchTagsTableView reloadData];
}
- (void)refeshSearchTags
{
    [_searchTagsTableView reloadData];
}
- (void)selectClick:(UIButton *)btn
{
    NSLog(@"btn.text === %@",btn.titleLabel.text);
    SearchResultViewController * searchVC = [[SearchResultViewController alloc] init];
//    searchVC.isSearchResult = YES;
//    searchVC.titleString = btn.titleLabel.text;
    [self.navigationController pushViewController:searchVC animated:YES];
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
