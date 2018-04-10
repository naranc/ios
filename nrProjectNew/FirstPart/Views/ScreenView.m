//
//  ScreenView.m
//  nrProjectNew
//
//  Created by 那然 on 2018/2/1.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "ScreenView.h"
#import "TitleLabelTableViewCell.h"
#import "TagTableViewCell.h"

@interface ScreenView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * screenTBView;

@property (nonatomic, strong) UIButton * resetButton;

@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) NSArray * titleArray;

@property (nonatomic, strong) UIButton * locationButton;

@property (nonatomic, strong) UIButton * pullButton;

@property (nonatomic, strong) ImageTextButton * resetLocationButton;

@property (nonatomic, strong) NSArray * sortArray;

@property (nonatomic, strong) NSArray * mnewOrOldArray;

@property (nonatomic, strong) NSArray * typeArray;

@property (nonatomic, strong) NSArray * cityArray;

@property (nonatomic, strong) NSArray * provinceArray;

@property (nonatomic, strong) UIView * searchBGView;

@property (nonatomic, strong) UIImageView * searchBarImageView;

@property (nonatomic, strong) UITextField * searchTF;

@end

@implementation ScreenView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init
{
    if ([super init]) {
        
        _titleArray = @[@"",@"排序",@"",@"新旧",@"",@"分类",@"",@"发货地",@"",@"城市",@"",@"省份"];
        
        _sortArray = @[@"最新",@"最热"];

        _mnewOrOldArray = @[@"全新",@"九成新",@"七成新",@"六成新以下"];
        
        _typeArray = @[@"文具",@"家具",@"玩具",@"数码电器",@"鞋包服饰",@"母婴用品",@"美妆护理",@"钟表首饰",@"工具器材",@"宠物用品",@"同城服务"];

        _cityArray = @[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"温州",@"宁波",@"南京",@"苏州"];

        _provinceArray = @[@"安徽",@"福建",@"甘肃",@"广东",@"广西",@"贵州",@"湖北",@"湖南",@"海南"];

        [self addSubview:self.screenTBView];
        
        self.resetButton.frame = CGRectMake(0, SCREEN_HEIGHT - 40, (SCREEN_WIDTH-89)/2, 40);
        [self addSubview:_resetButton];
        
        self.doneButton.frame = CGRectMake((SCREEN_WIDTH - 89) / 2, SCREEN_HEIGHT - 40, (SCREEN_WIDTH - 89) / 2, 40);
        [self addSubview:_doneButton];

        
    }
    return self;
}
- (CGFloat)cellHeight:(int)count
{
    int a = count / 3;
    int b = count % 3;
    NSLog(@"a = %d  b = %d",a, b);
    if (b > 0) {
        CGFloat height = 36 * (a + 1) + 5 * a;
        return 25 + height;
    }else{
        CGFloat height = 36 * a + 5 * (a - 1);
        return 25 + height;
    }
}
- (UITableView *)screenTBView
{
    if (!_screenTBView) {
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH - 89, SCREEN_HEIGHT - 40);
        _screenTBView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _screenTBView.delegate = self;
        _screenTBView.dataSource = self;
        _screenTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _screenTBView.showsVerticalScrollIndicator = NO;
        _screenTBView.backgroundColor = kUIColorFromRGB(0xffffff);
        _screenTBView.estimatedRowHeight = 0;
        _screenTBView.estimatedSectionHeaderHeight = 0;
        _screenTBView.estimatedSectionFooterHeight = 0;
        _screenTBView.autoresizesSubviews = YES;
    }
    return _screenTBView;
}
- (UIView *)searchBGView
{
    if (!_searchBGView) {
        _searchBGView = [[UIView alloc] init];
        if ([WRNavigationBar isIphoneX]) {
            _searchBGView.frame = CGRectMake(6, 60, SCREEN_WIDTH - 89 - 16, 33);
        }else{
            _searchBGView.frame = CGRectMake(6, 30, SCREEN_WIDTH - 89 - 16, 33);
        }
        _searchBGView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _searchBGView.layer.cornerRadius = 4.0f;
        _searchBGView.clipsToBounds = YES;
    }
    return _searchBGView;

}
- (UIImageView *)searchBarImageView
{
    if (!_searchBarImageView) {
        _searchBarImageView = [[UIImageView alloc] init];
        _searchBarImageView.frame = CGRectMake(17, 11, 12, 12);
        _searchBarImageView.image = [UIImage imageNamed:@"topnav_btn_sousuo"];
    }
    return _searchBarImageView;
}

- (UITextField *)searchTF
{
    if (!_searchTF) {
        _searchTF = [[UITextField alloc] init];
        _searchTF.frame = CGRectMake(_searchBarImageView.right + 10, 6, _searchBGView.width - 17 - 12 - 10 - 10 - 10, 20);
        _searchTF.placeholder = @"搜索你想要的";
        _searchTF.textColor = kUIColorFromRGB(0x999999);
        _searchTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    return _searchTF;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 7|| indexPath.row == 9 ||indexPath.row == 11){
        static NSString * cellitifter1 = @"cell1";
        TitleLabelTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter1];
        if (!cell) {
            cell = [[TitleLabelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = _titleArray[indexPath.row];
        return cell;
    }else if(indexPath.row == 2){
        static NSString * cellitifter2 = @"cell2";
        TagTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter2];
        if (!cell) {
            cell = [[TagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter2 tagsArray:_sortArray];
        }
        return cell;
    }else if(indexPath.row == 4){
        static NSString * cellitifter4 = @"cell4";
        TagTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter4];
        if (!cell) {
            cell = [[TagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter4 tagsArray:_mnewOrOldArray];
        }
        return cell;
    }else if(indexPath.row == 6){
        static NSString * cellitifter3 = @"cell3";
        TagTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter3];
        if (!cell) {
            cell = [[TagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter3 tagsArray:_typeArray];
        }
        return cell;
    }else if(indexPath.row == 8){
        static NSString * cellitifter8 = @"cell8";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter8];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter8];
        }
        [cell addSubview:self.locationButton];
        [cell addSubview:self.resetLocationButton];
        [cell addSubview:self.pullButton];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = kUIColorFromRGB(0xffffff);
        return cell;
    }else if(indexPath.row == 10){
        static NSString * cellitifter10 = @"cell10";
        TagTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter10];
        if (!cell) {
            cell = [[TagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter10 tagsArray:_cityArray];
        }
        return cell;
    }else if(indexPath.row == 12){
        static NSString * cellitifter12 = @"cell12";
        TagTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter12];
        if (!cell) {
            cell = [[TagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter12 tagsArray:_provinceArray];
        }
        return cell;
    }else{
        
        static NSString * cellitifter = @"cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = kUIColorFromRGB(0xffffff);
        [cell addSubview:self.searchBGView];
        [_searchBGView addSubview:self.searchBarImageView];
        [_searchBGView addSubview:self.searchTF];
        return cell;
        
    }
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if ([WRNavigationBar isIphoneX]) {
            return 100;
        }else{
            return 68;
        }
    }else if (indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 7|| indexPath.row == 9 ||indexPath.row == 11){
        return 28;
    }else if(indexPath.row == 2){
        return [self cellHeight:(int)_sortArray.count];
    }else if (indexPath.row == 4){
        return [self cellHeight:(int)_mnewOrOldArray.count];
    }else if (indexPath.row == 6){
        return [self cellHeight:(int)_typeArray.count];
    }else if (indexPath.row == 8){
        return 48;
    }else if (indexPath.row == 10){
        return [self cellHeight:(int)_cityArray.count];
    }else if (indexPath.row == 12){
        return [self cellHeight:(int)_provinceArray.count];
    }else{
        return 200;
    }
}


- (UIButton *)locationButton
{
    if (!_locationButton) {
        _locationButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _locationButton.frame = CGRectMake(6, 12, (SCREEN_WIDTH - 89 - 26) / 3, 36);
        _locationButton.backgroundColor = kUIColorFromRGB(0xf0f0f0);
        [_locationButton setTitle:@"杭州" forState:UIControlStateNormal];
        [_locationButton setTitleColor:kUIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _locationButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _locationButton.layer.cornerRadius = 4.0f;
        _locationButton.clipsToBounds = YES;
    }
    return _locationButton;
}
- (UIButton *)pullButton
{
    if (!_pullButton) {
        _pullButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pullButton.frame = CGRectMake(SCREEN_WIDTH - 89 - 50, 15, 20, 10);
        [_pullButton setImage:[UIImage imageNamed:@"btn_shaixuan"] forState:UIControlStateNormal];
    }
    return _pullButton;
}
- (ImageTextButton *)resetLocationButton
{
    if (!_resetLocationButton) {
        _resetLocationButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _resetLocationButton.frame = CGRectMake(_locationButton.right + 13, 20, 44, 17);
        _resetLocationButton.midSpacing = 5;
        _resetLocationButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _resetLocationButton.imageSize = CGSizeMake(15, 16);
        [_resetLocationButton setTitle:@"定位" forState:UIControlStateNormal];
        [_resetLocationButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _resetLocationButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_resetLocationButton setImage:[UIImage imageNamed:@"fabu_btn_suiji"] forState:UIControlStateNormal];
    }
    return _resetLocationButton;
}

- (UIButton *)resetButton
{
    if (!_resetButton) {
        _resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _resetButton.backgroundColor = kUIColorFromRGB(0x65BCFF);
        [_resetButton setTitle:@"重置" forState:UIControlStateNormal];
        [_resetButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _resetButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    }
    return _resetButton;
}
- (UIButton *)doneButton
{
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _doneButton.backgroundColor = MainColor;
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        [_doneButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    }
    return _doneButton;
}
@end
