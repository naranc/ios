//
//  QuestionViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2017/12/22.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuestionModel.h"
#import "QuestionTableViewCell.h"
#import "TimeTableViewCell.h"
#import "CarryTableViewCell.h"
#import "SelectFreightTableViewCell.h"
#import "PublishModel.h"

static NSString * cellitifter0 = @"cellitifter0";
static NSString * cellitifter1 = @"cellitifter1";
static NSString * cellitifter2 = @"cellitifter2";

@interface QuestionViewController ()<UITableViewDataSource, UITableViewDelegate,QuestionTableViewCellDelegate>
{
    SelectFreightTableViewCell * cell;
}
@property (nonatomic, strong) UITableView * questionTableView;

@property (nonatomic, strong) NSMutableArray * questionArray;

@property (nonatomic, strong) UIView * footView;

@property (nonatomic, strong) ImageTextButton * anonyButton;

@end

@implementation QuestionViewController
- (NSMutableArray *)questionArray
{
    if (!_questionArray) {
        _questionArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _questionArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.customNavBar setTitle:@"发布捐赠"];
    
    UIButton * doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
    doneButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    [doneButton setTitle:@"发布" forState:UIControlStateNormal];
    doneButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    [doneButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
    doneButton.backgroundColor = kUIColorFromRGB(0x4FCD9E);
    [self.view addSubview:doneButton];


    
    [self getData];
    [self.view addSubview:self.questionTableView];
    
}
- (UITableView *)questionTableView
{
    if (!_questionTableView) {
        _questionTableView = [[UITableView alloc] init];
        _questionTableView.dataSource = self;
        _questionTableView.delegate = self;
        _questionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _questionTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _questionTableView.tableFooterView = self.footView;
        
        cell = [[SelectFreightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
        cell.frame = CGRectMake(0, 0, SCREEN_WIDTH, 97);
        [_footView addSubview:cell];
        
    }
    return _questionTableView;
}
 - (UIView *)footView
{
    if (!_footView) {
        _footView = [[UIView alloc] init];
        _footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 97);
        _footView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _footView;
}
- (ImageTextButton *)anonyButton
{
    if (!_anonyButton) {
        _anonyButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _anonyButton.midSpacing = 4;
        _anonyButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _anonyButton.imageSize = CGSizeMake(12, 12);
        _anonyButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
        _anonyButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
        [_anonyButton setTitle:@"匿名" forState:UIControlStateNormal];
        [_anonyButton setTitleColor:kUIColorFromRGB(0x666666) forState:UIControlStateNormal];
        _anonyButton.layoutStyle = ImageTextButtonNSTextAlignmentLeft;
        [_anonyButton setSelected:NO];
        [_anonyButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
        [_anonyButton addTarget:self action:@selector(publishWishButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _anonyButton;
}
- (void)publishWishButton:(UIButton *)btn
{
    if (btn.isSelected) {
        [btn setSelected:NO];
        [_anonyButton setImage:[UIImage imageNamed:@"zan_gray_s"] forState:UIControlStateNormal];
    }else{
        [btn setSelected:YES];
        [_anonyButton setImage:[UIImage imageNamed:@"zan_green_s"] forState:UIControlStateNormal];
    }
}
- (void)getData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [PublishModel getDonateQuestionsWithParament:nil success:^(NSDictionary *dic) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSArray * array = [QuestionModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"questionnaires"]];
        [self.questionArray addObjectsFromArray:array];
        [_questionTableView reloadData];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionModel* model = _questionArray[indexPath.section];
    Answer * answer = model.options[indexPath.row];
    QuestionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter0];
    if (!cell) {
        cell = [[QuestionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setAnswerButtonText:answer indexPath:indexPath];
    cell.delegate = self;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QuestionModel * model = _questionArray[section];
    return model.options.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _questionArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 33;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 55;
}
- (void)selectAnswerWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath====%@",indexPath);
    
    QuestionModel * model = _questionArray[indexPath.section];
    NSArray * array = model.options;
    NSMutableArray * tempArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < array.count ; i ++) {
        Answer * answer = model.options[i];
        if (i == indexPath.row) {
            if (answer.answerIsSelect) {
                answer.answerIsSelect = NO;
            }else{
                answer.answerIsSelect = YES;
            }
        }else{
            answer.answerIsSelect = NO;
        }
        NSLog(@"%d",answer.answerIsSelect);
        [tempArray addObject:answer];
    }
    model.options = (NSArray *)tempArray;
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:indexPath.section];
    [_questionTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headView;
    if (!headView) {
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
        headView = [[UIView alloc] init];
        headView.backgroundColor = [UIColor whiteColor];
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        titleLabel.textColor = kUIColorFromRGB(0x666666);
        titleLabel.frame = CGRectMake(15, 0, SCREEN_WIDTH - 30, 38);
        QuestionModel * model = _questionArray[section];
        titleLabel.text = model.questionnaireContent;
        lineView.frame = CGRectMake(0, 6, SCREEN_WIDTH, 0.5);
        titleLabel.frame = CGRectMake(15, lineView.bottom + 18, SCREEN_WIDTH - 30, 24);
        if (section != 0) {
            [headView addSubview:lineView];
        }
        [headView addSubview:titleLabel];
    }
    return headView;
}
- (void)doneButton:(UIButton *)btn
{
    
    NSMutableArray * answesArray = [NSMutableArray arrayWithCapacity:1];
    
    for (QuestionModel * model in _questionArray) {
        for (Answer * anwer in model.options) {
            NSLog(@"answerIsSelect = %d",anwer.answerIsSelect);
            if (anwer.answerIsSelect) {
                [answesArray addObject:anwer.optionId];
            }
        }
    }
    if (answesArray.count != _questionArray.count) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"请选择完整答案！" duration:MBProgressHUDDuration];
        return;
    }
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSString * answerStr = [answesArray componentsJoinedByString:@","];

    //添加字典
    [dictionary setObject:answerStr forKey:@"questionnaireOptionIds"];
    [dictionary setObject:@(cell.yesSelect) forKey:@"willing"];
    [dictionary addEntriesFromDictionary:_paraments];
    NSLog(@"dictionary = %@",dictionary);
    
    if (!dictionary) {
        return;
    }
    [PublishModel pushlishDonateWithParament:dictionary success:^(NSDictionary *dic) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"pnlishDic = %@",dic);
        NSLog(@"pnlishMsg = %@",dic[@"msg"]);
        [self dismissViewControllerAnimated:YES completion:nil];
    } withFailureBlock:^(NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"error = %@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 55;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
    
    _questionTableView.frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - 49 - top);
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
