//
//  BookDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookDetailViewController.h"
#import "CommentModel.h"
#import "CommTableViewCell.h"

@interface BookDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * bookDetailTableView;
@property (nonatomic, assign) UIEdgeInsets insets;

@property (nonatomic, strong) NSMutableArray * commentArray;

@end

@implementation BookDetailViewController
- (NSMutableArray *)commentArray
{
    if (!_commentArray) {
        _commentArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _commentArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"图书详情"];
    self.insets = UIEdgeInsetsMake(0, 16, 0, 14); //只有左右间距可用,如果想将两边都补齐则设置为UIEdgeInsetsMake(0, 0, 0, 0)即可


    
    SubComment * subComment1 = [[SubComment alloc] init];
    subComment1.commentContent = @"你的书评好细腻，很感动。";
    
    subComment1.commentId = @12123123;
    
    subComment1.createTime = @"dasdawsd";
    
    subComment1.initiatorId = @3123123;
    
    subComment1.initiatorImg = @"dasdawsd";
    
    subComment1.initiatorNike = @"dasdawsd";
    
    subComment1.recipientId = @1312341234;
    
    subComment1.recipientNike = @"dasdawsd";

    
    
    CommentModel * commModel1 = [[CommentModel alloc] init];
    commModel1.commentContent = @"的那数量大老师打了卡撒大声地安达市大所大所大所大所大所大所大所多奥术大师大所大所大所大所大所多";
    commModel1.subComments = @[subComment1, subComment1, subComment1, subComment1];
    
    
    CommentModel * commModel2 = [[CommentModel alloc] init];
    commModel2.commentContent = @"股份公司发生的故事打开就好了环境的发生率达拉斯进口量达科技房价开始放寒假卡时间考虑房价快速的高科技设计开发环境卡萨";
    commModel2.subComments = @[subComment1, subComment1, subComment1, subComment1,subComment1,subComment1,subComment1,subComment1,subComment1,subComment1,subComment1];


    
    
    CommentModel * commModel3 = [[CommentModel alloc] init];
    commModel3.commentContent = @"覅US浩丰科技四大皆空富士康的脚步凤凰军事大部分能满足，按实际汇顶科技阿斯加德骄傲手机客户端喀什打款哈斯卡实践活动";
    commModel3.subComments = @[subComment1, subComment1, subComment1, subComment1];


    
    CommentModel * commModel4 = [[CommentModel alloc] init];
    commModel4.commentContent = @"阿斯顿发达实打实大师大师大师大师DAU由于原图玉兔玉兔一套图样图奥术大师大所大所大所大多大所";
    commModel4.subComments = @[subComment1, subComment1, subComment1, subComment1];


    
    CommentModel * commModel5 = [[CommentModel alloc] init];
    commModel5.commentContent = @"说到辛酸处，荒唐最可悲。由来同一梦，修笑世人痴——红楼梦结语,我一直以为，红楼梦的结局是家道中落，就没有起来了，读完本书之后，才明白，那句历史名言…";
    commModel5.subComments = @[subComment1, subComment1, subComment1, subComment1];


    
    CommentModel * commModel6 = [[CommentModel alloc] init];
    commModel6.commentContent = @"大叔大婶大所大所大所大所大色大所大所擦撒大所大所大所大所大所大所大所多撒大大所多大叔大婶大所大所大所";
    commModel6.subComments = @[subComment1, subComment1, subComment1, subComment1];


    [self.commentArray addObject:commModel1];
    [self.commentArray addObject:commModel2];
    [self.commentArray addObject:commModel3];
    [self.commentArray addObject:commModel4];
    [self.commentArray addObject:commModel5];
    [self.commentArray addObject:commModel6];

    [self.view addSubview:self.bookDetailTableView];
    
}
- (UITableView *)bookDetailTableView
{
    if (!_bookDetailTableView) {
         CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 48);
        _bookDetailTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _bookDetailTableView.delegate = self;
        _bookDetailTableView.dataSource = self;
        _bookDetailTableView.showsVerticalScrollIndicator = NO;
        _bookDetailTableView.backgroundColor = [UIColor whiteColor];
        _bookDetailTableView.estimatedRowHeight = 0;
        _bookDetailTableView.estimatedSectionHeaderHeight = 0;
        _bookDetailTableView.estimatedSectionFooterHeight = 0;
        [_bookDetailTableView setSeparatorColor:kUIColorFromRGB(0xEEEEEE)];
    }
    return _bookDetailTableView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentModel * model;
    if (_commentArray.count) {
        model= _commentArray[indexPath.row];
    }
    CommTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellitifter1212"];
    if (!cell) {
        cell = [[CommTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellitifter1212" model:model];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCommentContent:model indexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _commentArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentModel * comment;
    if (_commentArray.count) {
        comment = _commentArray[indexPath.row];
    }
    CGFloat height = [self cellForHeight:comment.subComments] + [[GlobalSingleton Singleton] getHeigthWithText:comment.commentContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height + 64 + 40;
    return height;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BookDetailViewController * bookDetailVC = [[BookDetailViewController alloc] init];
    bookDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:bookDetailVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)cellForHeight:(NSArray *)array
{
    CGFloat height = 0.0;
    for (SubComment *subComm in array) {
        height = height + [[GlobalSingleton Singleton] getHeigthWithText:subComm.commentContent width:SCREEN_WIDTH - 15 - 63 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height + 50;
    }
    return height;
}

-(void)viewDidLayoutSubviews {
    if ([self.bookDetailTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.bookDetailTableView setSeparatorInset:self.insets];
    }
    if ([self.bookDetailTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.bookDetailTableView setLayoutMargins:self.insets];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:self.insets];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:self.insets];
    }
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
