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
#import "BookDetailHeadView.h"
#import "CommentBottomView.h"
#import "WantBookView.h"
#import "CommentTitleView.h"
#import "BookCommentViewController.h"

@interface BookDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView * bookDetailTableView;

@property (nonatomic, assign) UIEdgeInsets insets;

@property (nonatomic, strong) NSMutableArray * commentArray;

@property (nonatomic, strong) UIButton * wantButton;

@property (strong, nonatomic) CommentBottomView * commentView;

@property (nonatomic, strong) UIView * headView;


@property (nonatomic, strong) BookDetailHeadView * bookDetailHeadView;

@property (nonatomic, strong) WantBookView * wantBookView;

@property (nonatomic, strong) NSMutableArray * wantBookArray;


@property (nonatomic, strong) CommentTitleView * commentTitleView;

@end

@implementation BookDetailViewController
- (NSMutableArray *)commentArray
{
    if (!_commentArray) {
        _commentArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _commentArray;
}
- (NSMutableArray *)wantBookArray
{
    if (!_wantBookArray) {
        _wantBookArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _wantBookArray;
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
    [self.view addSubview:self.wantButton];
    
  
    
    CGFloat cellHeight = 12 + 20 + 12 + 20 + 12;
    NSString * intro = @"《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说 ，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统，程...";
    CGFloat firstCellHeight = cellHeight - 20 + [[GlobalSingleton Singleton] getHeigthWithText:intro width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height;
    CGFloat headViewHeight = 20 + 215 + 12 + firstCellHeight + cellHeight*3;
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, headViewHeight);
    _bookDetailTableView.tableHeaderView = self.headView;
    [_headView addSubview:self.bookDetailHeadView];
    [_headView addSubview:self.commentView];
 
    
    [self.wantBookArray addObject:@"userimagePic.jpg"];
    [self.wantBookArray addObject:@"userimagePic.jpg"];
    [self.wantBookArray addObject:@"userimagePic.jpg"];
    [self.wantBookArray addObject:@"userimagePic.jpg"];
    [self.wantBookArray addObject:@"userimagePic.jpg"];
    [_headView addSubview:self.wantBookView];
    [_headView addSubview:self.commentTitleView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickBookComment) name:@"ClickBookCommentNSNotification" object:nil];

}
- (void)clickBookComment
{
    //123
    BookCommentViewController * bookCommentVC = [[BookCommentViewController alloc] init];
    [self.navigationController pushViewController:bookCommentVC animated:YES];
}
- (CommentTitleView *)commentTitleView
{
    if (!_commentTitleView) {
        _commentTitleView = [[CommentTitleView alloc] initWithFrame:CGRectMake(0, _wantBookView.bottom + 8, SCREEN_WIDTH, 49)];
    }
    return _commentTitleView;
}
- (WantBookView *)wantBookView
{
    if (!_wantBookView) {
        _wantBookView = [[WantBookView alloc] initWithFrame:CGRectMake(0, _commentView.bottom + 8, SCREEN_WIDTH, 128)];
        [_wantBookView creatWantPersonUserImageViewWithArray:_wantBookArray];
    }
    return _wantBookView;
}
- (UIView *)headView
{
    if (!_headView) {
        CGFloat cellHeight = 12 + 20 + 12 + 20 + 12;
        NSString * intro = @"《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说 ，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统，程...";
        CGFloat firstCellHeight = cellHeight - 20 + [[GlobalSingleton Singleton] getHeigthWithText:intro width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height;
        CGFloat headViewHeight = 20 + 215 + 12 + firstCellHeight + cellHeight*3;
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headViewHeight + 40 + 8 + 128 + 8 + 50)];
        _headView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _headView;
}
- (BookDetailHeadView *)bookDetailHeadView
{
    if (!_bookDetailHeadView) {
        CGFloat cellHeight = 12 + 20 + 12 + 20 + 12;
        NSString * intro = @"《红楼梦》，中国古典四大名著之首，清代作家曹雪芹创作的章回体长篇小说 ，又名《石头记》《金玉缘》。此书分为120回“程本”和80回“脂本”两种版本系统，程...";
        CGFloat firstCellHeight = cellHeight - 20 + [[GlobalSingleton Singleton] getHeigthWithText:intro width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]].size.height;
        CGFloat headViewHeight = 20 + 215 + 12 + firstCellHeight + cellHeight*3;
        _bookDetailHeadView = [[BookDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headViewHeight)];
    }
    return _bookDetailHeadView;
}


- (CommentBottomView *)commentView
{
    if (!_commentView) {
        NSArray * imageArray = @[@"list_Bookbtn_shoucang",@"list_btn_pinglun3",@"list_btn_zan_s_gre2"];
        _commentView = [[CommentBottomView alloc] initWithFrame:CGRectMake(0, _bookDetailHeadView.bottom, SCREEN_WIDTH, 40) ImageArray:imageArray];
        _commentView.onClickCommentButton = ^{
//            [self showKeyboardWithOrder:_wishModel.orderId commentedId:nil nick:@""];
        };
    }
    return _commentView;
}
//- (BOOL)isInScreenView:(UIView *)inView withRect:(CGRect)rect{
//    return CGRectIntersectsRect(inView.frame, rect);
//}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    BOOL isShow =[self isInScreenView:self.view withRect:_commentView.frame];
//    NSLog(@"isShow = %d",isShow);
//}

- (UIButton *)wantButton
{
    if (!_wantButton) {
        _wantButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _wantButton.frame = CGRectMake(0, SCREEN_HEIGHT - 48, SCREEN_WIDTH, 48);
        _wantButton.backgroundColor = MainColor;
        [_wantButton setTitle:@"想要" forState:UIControlStateNormal];
        [_wantButton setTitleColor:kUIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _wantButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    }
    return _wantButton;
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
