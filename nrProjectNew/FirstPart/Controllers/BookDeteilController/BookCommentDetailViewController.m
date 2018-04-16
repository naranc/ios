//
//  BookCommentDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "BookCommentDetailViewController.h"
#import "BCDetailTableViewCell.h"

@interface BookCommentDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * bookCommentArray;

@property (nonatomic, strong) UITableView * bookCommentDetailTableView;

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * nameLabelabel;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIImageView * lineImageView;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) ImageTextButton * commentButton;

@property (nonatomic, strong) ImageTextButton * zanButton;

@end

@implementation BookCommentDetailViewController
- (NSMutableArray *)bookCommentArray
{
    if (!_bookCommentArray) {
        _bookCommentArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _bookCommentArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"书评"];
    
    
    
    NSDictionary * dic =@{@"picImage":@"userimagePic.jpg",@"name":@"乘风破浪",@"content":@"那一日正当三月中浣，早饭后，宝玉携了一套《会真记》，走到沁芳闸桥边桃花底下一块石上坐着，展开《会真记》，从头细玩。正看到“落红成阵”，只…"};
    
    NSDictionary * dic1 =@{@"picImage":@"userimagePic.jpg",@"name":@"乘风破浪",@"content":@"侬今葬花人笑痴，他年葬侬知是谁。 试看春残花渐落，便是红颜老死时。 一朝春尽红颜老，花落人 ..."};
    
    NSDictionary * dic2 =@{@"picImage":@"userimagePic.jpg",@"name":@"乘风破浪",@"content":@"侬今葬花人笑痴，他年葬侬知是谁。 试看春残花渐落，便是红颜老死时。 一朝春尽红颜老，花落人亡两不知。 ——节选林黛玉《葬花词》"};
    
    [self.bookCommentArray addObject:dic];
    [self.bookCommentArray addObject:dic1];
    [self.bookCommentArray addObject:dic2];
    [self.bookCommentArray addObject:dic];
    [self.bookCommentArray addObject:dic1];
    [self.bookCommentArray addObject:dic2];
    [self.bookCommentArray addObject:dic];
    [self.bookCommentArray addObject:dic1];
    [self.bookCommentArray addObject:dic2];
    
    [self.view addSubview:self.bookCommentDetailTableView];

    
    NSString * contentStr = @" 那一日正当三月中浣，早饭后，宝玉携了一套《会真记》，走到沁芳闸桥边桃花底下一块石上坐着，展开《会真记》，从头细玩。正看到“落红成阵”，只见一阵风过，把树头上桃花吹下一大半来，落的满身满书满地皆是。宝玉要抖将下来，恐怕脚步践踏了，只得兜了那花瓣，来至池边，抖在池内。 那花瓣浮在水面，飘飘荡荡，竟流出沁芳闸去了。 回来只见地下还有许多，宝玉正踟蹰间，只听背后有人说道：“你在这里做什么？”宝玉一回头， 却是林黛玉来了，肩上担着花锄，锄上挂着花囊，手内拿着花帚。宝玉笑道：“好，好，来把这个花扫起来，撂在那水里。我才撂了好些在那里呢。” 林黛玉道：“撂在水里不好。你看这里的水干净，只一流出去，有人家的地方脏的臭的混倒，仍旧把花遭塌了。那畸角上我有一个花冢，如今把他扫了，装在这绢袋里，拿土埋上，日久不过随土化了，岂不干净。” 黛玉之见解可不一般，为桃花立墓牌，可见爱怜惜花之非常，花之美应尽数释放，却不该任由之随波逐流，黛玉对美的独特见解，读到这儿，也让我为之记忆深刻，感慨良久，韵味绕梁，久久不散。 《红楼梦》这部作品被誉为中国历史上思想的最高峰。我想不仅是因为曹雪芹的文采与悲惨遭遇，更多的是书中人物活灵活现的思想高度。这本书，我没有一一尽数品尝，而是选择了一些较为经典的桥段来欣赏。我觉得这就是我的遗憾。光看那些经典桥段，就有一丝情感在我的心头悄然酝酿，我想，我是得好好的去看看了。 ";
    CGFloat contentHeight  = [[GlobalSingleton Singleton] getHeigthWithText:contentStr width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]].size.height;
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 190 + contentHeight);
    
    self.bgView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 190 + contentHeight - 61);
    self.contentLabel.frame = CGRectMake(15, _userImageView.bottom + 12, SCREEN_WIDTH - 30, contentHeight);
    self.lineImageView.frame = CGRectMake(15, _contentLabel.bottom + 12, SCREEN_WIDTH - 30, 1);
    self.timeLabel.frame = CGRectMake(15, _lineImageView.bottom + 12, (SCREEN_WIDTH -30)/ 3, 17);
    self.commentButton.frame = CGRectMake(_timeLabel.right, _lineImageView.bottom + 12, (SCREEN_WIDTH -30)/ 3, 17);
    self.zanButton.frame = CGRectMake(_commentButton.right, _lineImageView.bottom + 12, (SCREEN_WIDTH -30)/ 3, 17);
    
    self.bookCommentDetailTableView.tableHeaderView = _headView;
    
    [_headView addSubview:_bgView];
    [_bgView addSubview:self.userImageView];
    [_bgView addSubview:self.nameLabelabel];
    [_bgView addSubview:_contentLabel];
    [_bgView addSubview:_lineImageView];
    [_bgView addSubview:_timeLabel];
    [_bgView addSubview:_commentButton];
    [_bgView addSubview:_zanButton];
    
    
    
    
    
    _userImageView.image = [UIImage imageNamed:@"userimagePic.jpg"];
    _nameLabelabel.text = @"测试111";
    _contentLabel.text = contentStr;

}
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] init];
        _headView.frame = CGRectZero;
        _headView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    }
    return _headView;
}
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectZero;
        _bgView.backgroundColor = kUIColorFromRGB(0xffffff);
    }
    return _bgView;
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.frame = CGRectMake(15, 12, 40, 40);
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.clipsToBounds = YES;
        _userImageView.layer.cornerRadius = 40/2;
    }
    return _userImageView;
}
- (UILabel *)nameLabelabel
{
    if (!_nameLabelabel) {
        _nameLabelabel = [[UILabel alloc] init];
        _nameLabelabel.frame = CGRectMake(_userImageView.right + 12, 22, SCREEN_WIDTH - 30 - 52, 20);
        _nameLabelabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _nameLabelabel.textColor = kUIColorFromRGB(0x333333);
    }
    return _nameLabelabel;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.frame = CGRectZero;
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _contentLabel;
}

- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        _lineImageView.frame = CGRectZero;
        _lineImageView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineImageView;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectZero;
        _timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _timeLabel;
}
- (ImageTextButton *)commentButton
{
    if (!_commentButton) {
        _commentButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _commentButton.frame = CGRectZero;
        _commentButton.midSpacing = 6;
        _commentButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _commentButton.imageSize = CGSizeMake(16, 16);
        [_commentButton setTitleColor:kUIColorFromRGB(0x65BCFF) forState:UIControlStateNormal];
        _commentButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_commentButton setImage:[UIImage imageNamed:@"list_btn_pinglun3"] forState:UIControlStateNormal];
        
    }
    return _commentButton;
}

- (ImageTextButton *)zanButton
{
    if (!_zanButton) {
        _zanButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _zanButton.frame = CGRectZero;
        _zanButton.midSpacing = 6;
        _zanButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        _zanButton.imageSize = CGSizeMake(16, 16);
        [_zanButton setTitleColor:kUIColorFromRGB(0xFF739A) forState:UIControlStateNormal];
        _zanButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_zanButton setImage:[UIImage imageNamed:@"list_btn_zan_s_gre2"] forState:UIControlStateNormal];
        
    }
    return _zanButton;
}


- (UITableView *)bookCommentDetailTableView
{
    if (!_bookCommentDetailTableView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _bookCommentDetailTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _bookCommentDetailTableView.delegate = self;
        _bookCommentDetailTableView.dataSource = self;
        _bookCommentDetailTableView.showsVerticalScrollIndicator = NO;
        _bookCommentDetailTableView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _bookCommentDetailTableView.estimatedRowHeight = 0;
        _bookCommentDetailTableView.estimatedSectionHeaderHeight = 0;
        _bookCommentDetailTableView.estimatedSectionFooterHeight = 0;
        _bookCommentDetailTableView.alwaysBounceVertical = NO;
    }
    return _bookCommentDetailTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic;
    if (_bookCommentArray.count) {
        dic = _bookCommentArray[indexPath.row];
    }
    BCDetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[BCDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setCommentContent:dic indexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _bookCommentArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic;
    if (_bookCommentArray.count) {
        dic = _bookCommentArray[indexPath.row];
    }
    CGFloat contentHeight = [[GlobalSingleton Singleton]getHeigthWithText:dic[@"content"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:15]].size.height;
    return 101 + contentHeight;
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
