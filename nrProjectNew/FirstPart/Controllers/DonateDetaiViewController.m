//
//  DonateDetaiViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/15.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "DonateDetaiViewController.h"
#import "DonateModel.h"
#import "JGGView.h"
#import "ExpandView.h"
#import "CommentBottomView.h"
#import "SendApplyViewController.h"
#import "CommentModel.h"
#import "CommentTableViewCell.h"
#import "SubCommentTableViewCell.h"
#import "UUKeyboardInputView.h"
#import "NeedDonateTableViewCell.h"
#import "NeedDonateDetailViewController.h"

@interface DonateDetaiViewController ()<UITableViewDelegate, UITableViewDataSource,NeedDonateDetailViewControllerDelegate,SendApplyViewControllerDelegate>
{
    UIView * hView;
    
    JGGView * jggView;
    
    CGFloat size;
    
    BOOL isShowComment;

}
@property (strong, nonatomic) UITableView * donateDetailTBView;

@property (strong, nonatomic) UIImageView * userImageView;

@property (strong, nonatomic) UILabel * userNickNameLabel;

@property (strong, nonatomic) ImageTextButton * cityButton;

@property (strong, nonatomic) UIImageView * lineView;

@property (strong, nonatomic) UILabel * titileLabel;

@property (strong, nonatomic) UIButton * typeImageView;

@property (strong, nonatomic) UILabel * contentLabel;

@property (strong, nonatomic) UILabel * timeLabel;

@property (strong, nonatomic) ExpandView * expandView;

@property (strong, nonatomic) CommentBottomView * commentView;

@property (nonatomic, strong) UIButton * statusButton;

@property (strong, nonatomic) NSMutableArray * dateArray;

@end

@implementation DonateDetaiViewController
- (NSMutableArray *)dateArray
{
    if (!_dateArray) {
        _dateArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dateArray;
}
- (void)refeshDetailStatus
{
    [_dateArray removeAllObjects];
    [self getNeedDonateListData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"捐赠详情"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refeshDetailStatus) name:@"InputWayNumberSuccess1" object:nil];

    if (SCREEN_WIDTH <= 375) {
        size = 40;
    }else{
        size = 50;
    }
    
    
    
    
    
    UIView * headView = [[UIView alloc] init];
    headView.backgroundColor = kUIColorFromRGB(0xffffff);
//    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, hView.height + 12);

    
    self.userImageView.frame = CGRectMake(15, 15, 40, 40);
    [_userImageView sd_setImageWithURL:[NSURL URLWithString:_donateModel.initiatorImg] placeholderImage:nil];
    [headView addSubview:_userImageView];
    
    
    self.lineView.frame = CGRectMake(16, _userImageView.bottom + 12, SCREEN_WIDTH - 32, 1);
    [headView addSubview:_lineView];
    
    self.userNickNameLabel.frame = CGRectMake(_userImageView.right + 4, _userImageView.bottom - 20, SCREEN_WIDTH - 30 - 40 - 4 - 100, 20);
    _userNickNameLabel.text = _donateModel.initiatorNike;
    [headView addSubview:_userNickNameLabel];
    
    
    self.cityButton.frame = CGRectMake(SCREEN_WIDTH - 15 - 45, 27, 45, 16);
    [_cityButton setTitle:_donateModel.city forState:UIControlStateNormal];
    [headView addSubview:_cityButton];

    
    self.titileLabel.frame = CGRectMake(15, _lineView.bottom + 12, SCREEN_WIDTH - 30 - 50 - 10, 24);
    _titileLabel.text = _donateModel.orderTitle;
    [headView addSubview:_titileLabel];

    
    self.typeImageView.frame = CGRectMake(SCREEN_WIDTH - 15 - 49, _lineView.bottom + 15, 49, 18);
    [_typeImageView setTitle:@"数码类" forState:UIControlStateNormal];
    [_typeImageView setImage:[UIImage imageNamed:@"biaoqian_blu"] forState:UIControlStateNormal];
    [headView addSubview:_typeImageView];
    
    
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:_donateModel.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
    self.contentLabel.frame = CGRectMake(15, _titileLabel.bottom + 12, SCREEN_WIDTH - 30, rect.size.height);
    _contentLabel.text = _donateModel.orderContent;
    [headView addSubview:_contentLabel];

    
    
    hView = [self creatUI:(NSArray *)_donateModel.questionnaireOptions];
    hView.frame = CGRectMake(hView.origin.x, _contentLabel.bottom, hView.width, hView.height);
    [headView addSubview:hView];
    
    
    NSArray * imageArray;
    if ([_donateModel.orderImgs containsString:@","]) {
        imageArray = [_donateModel.orderImgs componentsSeparatedByString:@","];//以“,”切割
    }else{
        imageArray = @[_donateModel.orderImgs];
    }
    
    jggView = [[JGGView alloc] init];
    jggView.frame = CGRectMake(15, hView.bottom, SCREEN_WIDTH - 30, [self getlineCount:imageArray.count]);
    
    [jggView JGGView:jggView DataSource:imageArray completeBlock:^(NSInteger index, NSArray *dataSource,NSIndexPath *indexpath) {
        jggView.tapBlock = ^(NSInteger index, NSArray *dataSource, NSIndexPath *indexpath) {
            
        };
    }];
    
    [headView addSubview:jggView];
    
    
    self.timeLabel.frame = CGRectMake(15, jggView.bottom + 20, SCREEN_WIDTH - 30, 17);
    [headView addSubview:_timeLabel];
    
    
    [headView addSubview:self.commentView];
    
    CGFloat headheight = 15 + 40 + 12 + 1 + 12 + 24 + 12 + rect.size.height + hView.height + [self getlineCount:imageArray.count] + 40 + 40;
    
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, headheight);
    
    [self.view addSubview:self.donateDetailTBView];
    _donateDetailTBView.tableHeaderView = headView;
    
    [self.view addSubview:self.expandView];
    
    
    
    if ([UserModel getUser].accountId != _donateModel.initiatorId) {
        [self.view addSubview:self.statusButton];
    }else{
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _donateDetailTBView.frame = frame;
    }
    
    [self getNeedDonateListData];
    [self getDonateDetailData];

}
- (void)getDonateDetailData
{
    NSLog(@"SCREEN_WIDTH = %f",SCREEN_WIDTH);
    NSDictionary * dic = @{@"orderId":_donateModel.orderId};
    [DonateModel getDonateDetailWithParament:dic success:^(NSDictionary *dic) {
        NSLog(@"donateDetail = %@",dic);
        _donateModel = [DonateModel mj_objectWithKeyValues:dic[@"data"]];
        
        [_commentView.leftButton setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];

        [_commentView.centerButton setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];

        if (dic[@"data"][@"commentTimes"]) {
            [_commentView.rightButton setTitle:[NSString stringWithFormat:@"%@",dic[@"data"][@"collectionTimes"]] forState:UIControlStateNormal];
        }else{
            [_commentView.rightButton setTitle:@"0" forState:UIControlStateNormal];

        }
        
        //此捐赠本人
        if (_donateModel.initiatorId == [UserModel getUser].accountId) {
            
            
            

        }else{
            //别人进来要判断是和此捐赠产生关系
            if ([_donateModel.orderStatus isEqualToString:@"INITIAL"]) {
                [_statusButton setTitle:@"我很需要" forState:UIControlStateNormal];
            }else{
                [_statusButton setTitle:_donateModel.orderStatus forState:UIControlStateNormal];
            }
            
        }
        
        
        
        
        
        
        
        
        
        
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error  = %@",error);
    }];
}

- (ExpandView *)expandView
{
    if (!_expandView) {
        _expandView = [[ExpandView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT - 24*2 - 3*size - 82, size, 24*2 + 3*size)];
        _expandView.onClickShareButton = ^{
            
        };
        _expandView.onClickCollectButton = ^{
            
        };
        _expandView.onClickCommentButton = ^{
            [self showKeyboardWithOrder:_donateModel.orderId commentedId:nil nick:@""];
        };
    }
    return _expandView;
}
- (CommentBottomView *)commentView
{
    if (!_commentView) {
        NSArray * imageArray = @[@"list_btn_fengxiang_org",@"list_btn_shoucang_gre",@"list_btn_pinglun_blu"];
        _commentView = [[CommentBottomView alloc] initWithFrame:CGRectMake(0, jggView.bottom + 40, SCREEN_WIDTH, 40) ImageArray:imageArray];
        
        
        _commentView.onClickShareButton = ^{
            
        };
        _commentView.onClickCollectButton = ^{
            [self collectDonate];
        };
        _commentView.onClickCommentButton = ^{
            [self showKeyboardWithOrder:_donateModel.orderId commentedId:nil nick:@""];
        };
    }
    return _commentView;
}

- (UIButton *)statusButton
{
    if (!_statusButton) {
        _statusButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _statusButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        [_statusButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _statusButton.backgroundColor = MainColor;
        weakify(self);
        [_statusButton addAction:^(UIButton *btn) {
            //别人进来申请捐赠
            if (![btn.titleLabel.text isEqualToString:@"我很需要"]) {
                return;
            }
            
            if (![[UserModel getUser].certificationType isEqualToString:@"SUCCESS"]) {
                [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES text:@"您未实名认证" duration:MBProgressHUDDuration];
                return;
            }
            SendApplyViewController * applyVC = [[SendApplyViewController alloc] init];
            applyVC.orderID = [NSString stringWithFormat:@"%@",weakSelf.donateModel.orderId];
            applyVC.province = weakSelf.donateModel.province;
            applyVC.city = weakSelf.donateModel.city;
            applyVC.delegate = weakSelf;
            [weakSelf.navigationController pushViewController:applyVC animated:YES];
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _statusButton;
}

- (void)sendApllySuccessRefeshDonateDetailView
{
    [_dateArray removeAllObjects];
    [self getNeedDonateListData];
}
- (UITableView *)donateDetailTBView
{
    if (!_donateDetailTBView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 49);
        _donateDetailTBView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _donateDetailTBView.delegate = self;
        _donateDetailTBView.dataSource = self;
        _donateDetailTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _donateDetailTBView.showsVerticalScrollIndicator = NO;
        _donateDetailTBView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _donateDetailTBView.estimatedRowHeight = 0;
        _donateDetailTBView.estimatedSectionHeaderHeight = 0;
        _donateDetailTBView.estimatedSectionFooterHeight = 0;
        _donateDetailTBView.autoresizesSubviews = YES;
    }
    return _donateDetailTBView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dateArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0){
        id ID = _dateArray[section];
        if ([ID isKindOfClass:[NSDictionary class]]) {
            return 42;
        }else{
            CommentModel * commentModel = _dateArray[section];
            CGRect rect = [[GlobalSingleton Singleton]getHeigthWithText:commentModel.commentContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
            return 60 + rect.size.height + 10;
        }
    }else{
        CommentModel * commentModel = _dateArray[section];
        CGRect rect = [[GlobalSingleton Singleton]getHeigthWithText:commentModel.commentContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
        return 60 + rect.size.height + 10;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        id ID = _dateArray[section];
        if ([ID isKindOfClass:[NSDictionary class]]) {
            NSDictionary * dic = _dateArray[section];
            NSArray * array = dic[@"applys"];
            return array.count;
        }else{
            CommentModel * model = _dateArray[section];
            if (model.subComments.count > 3) {
                return 3;
            }else{
                return model.subComments.count;
            }
        }
    }else{
        CommentModel * model = _dateArray[section];
        if (model.subComments.count > 3) {
            return 3;
        }else{
            return model.subComments.count;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        id ID = _dateArray[indexPath.section];
        if ([ID isKindOfClass:[NSDictionary class]]) {
            return 79 + 16;
        }else{
            CommentModel * model;
            SubComment * sub;
            if (_dateArray.count) {
                model = _dateArray[indexPath.section];
                sub = model.subComments[indexPath.row];
            }
            CGRect rect = [[GlobalSingleton Singleton]getHeigthWithText:sub.commentContent width:SCREEN_WIDTH - 63 - 15 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
            return 12 + 30 + 8 + rect.size.height;
        }
    }else{
        CommentModel * model;
        SubComment * sub;
        if (_dateArray.count) {
            model = _dateArray[indexPath.section];
            sub = model.subComments[indexPath.row];
        }
        CGRect rect = [[GlobalSingleton Singleton]getHeigthWithText:sub.commentContent width:SCREEN_WIDTH - 63 - 15 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
        return 12 + 30 + 8 + rect.size.height;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    UIView * headView;
    
    if (section == 0) {
        
        
        id ID = _dateArray[section];
        if ([ID isKindOfClass:[NSDictionary class]]) {
            if (!headView) {
                headView = [[UIView alloc] init];
                headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 42);
                headView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
                
                UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 13, 200, 17)];
                namelabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
                namelabel.textColor = kUIColorFromRGB(0x999999);
                namelabel.text = @"想要的人";
                [headView addSubview:namelabel];
                
                UIImageView * lineView = [[UIImageView alloc] init];
                lineView.frame = CGRectMake(0, 41, SCREEN_WIDTH, 1);
                lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
                [headView addSubview:lineView];
            }
            return headView;
        }else{
            if (!headView) {
                
                CommentModel * commentModel = _dateArray[section];
                CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:commentModel.commentContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
                
                headView = [[UIView alloc] init];
                headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60 + rect.size.height + 10);
                headView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
                
                
                UIImageView * userImageView = [[UIImageView alloc] init];
                userImageView.frame = CGRectMake(15, 12, 40, 40);
                userImageView.contentMode = UIViewContentModeScaleAspectFill;
                userImageView.clipsToBounds = YES;
                userImageView.layer.cornerRadius = 20.0f;
                [headView addSubview:userImageView];
                [userImageView sd_setImageWithURL:[NSURL URLWithString:commentModel.initiatorImg] placeholderImage:nil];
                
                
                UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(userImageView.right + 8, 22, 200, 20)];
                namelabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
                namelabel.textColor = kUIColorFromRGB(0x666666);
                namelabel.text = commentModel.initiatorNike;
                [headView addSubview:namelabel];
                
                UILabel * contentlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, userImageView.bottom + 8, SCREEN_WIDTH - 30, rect.size.height)];
                contentlabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
                contentlabel.text = commentModel.commentContent;
                contentlabel.textColor = kUIColorFromRGB(0x666666);
                contentlabel.numberOfLines = 0;
                [headView addSubview:contentlabel];
                
                UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
                [headView addGestureRecognizer:singleTap];
                UIView *singleTapView = [singleTap view];
                singleTapView.tag = section;

            }
            
            return headView;
        }
        
    }else{
        
        if (!headView) {
            
            CommentModel * commentModel = _dateArray[section];
            CGRect rect = [[GlobalSingleton Singleton]getHeigthWithText:commentModel.commentContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
            
            headView = [[UIView alloc] init];
            headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60 + rect.size.height + 10);
            headView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
            
            
            UIImageView * userImageView = [[UIImageView alloc] init];
            userImageView.frame = CGRectMake(15, 12, 40, 40);
            userImageView.contentMode = UIViewContentModeScaleAspectFill;
            userImageView.clipsToBounds = YES;
            userImageView.layer.cornerRadius = 20.0f;
            [headView addSubview:userImageView];
            [userImageView sd_setImageWithURL:[NSURL URLWithString:commentModel.initiatorImg] placeholderImage:nil];
            
            
            UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(userImageView.right + 8, 22, 200, 20)];
            namelabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
            namelabel.textColor = kUIColorFromRGB(0x666666);
            namelabel.text = commentModel.initiatorNike;
            [headView addSubview:namelabel];
            
            UILabel * contentlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, userImageView.bottom + 8, SCREEN_WIDTH - 30, rect.size.height)];
            contentlabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
            contentlabel.text = commentModel.commentContent;
            contentlabel.textColor = kUIColorFromRGB(0x666666);
            contentlabel.numberOfLines = 0;
            [headView addSubview:contentlabel];
            
            
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
            [headView addGestureRecognizer:singleTap];
            UIView *singleTapView = [singleTap view];
            singleTapView.tag = section;

        }
        return headView;
    }
}
-(void)tapImageAction:(id)sender
{
    UITapGestureRecognizer *singleTap = (UITapGestureRecognizer *)sender;
    //    NSLog(@"%d",[singleTap view].tag]);
    CommentModel * commentModel= _dateArray[[singleTap view].tag];
    
    [self showKeyboardWithOrder:nil commentedId:commentModel.commentId nick:commentModel.initiatorNike];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0){
        id ID = _dateArray[indexPath.section];
        if ([ID isKindOfClass:[NSDictionary class]]) {
            NSDictionary * model = _dateArray[indexPath.section];
            NSArray * array = model[@"applys"];
            NSDictionary * donateModle = array[indexPath.row];
            static NSString *donateCell = @"donateCell";
            NeedDonateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:donateCell];
            if (!cell) {
                cell = [[NeedDonateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:donateCell];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell donateDetailViewConfigCellWithModel:donateModle indexPath:indexPath];
            return cell;
            
        }else{
            
            CommentModel * model;
            SubComment *subModel;
            if (_dateArray.count) {
                model = _dateArray[indexPath.section];
                subModel = model.subComments[indexPath.row];
            }
            static NSString *cellitifter = @"cellitifter";
            SubCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
                if (!cell) {
                    cell = [[SubCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
                }
            
            [cell configCommentViewWithSubModel:subModel indexPath:indexPath];
            return cell;
        }
        
        
    }else{
        
        CommentModel * model;
        SubComment *subModel;
        if (_dateArray.count) {
            model = _dateArray[indexPath.section];
            subModel = model.subComments[indexPath.row];
        }
        static NSString *cellitifter = @"cellitifter";
        SubCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellitifter];
        if (!cell) {
            cell = [[SubCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellitifter];
        }
        [cell configCommentViewWithSubModel:subModel indexPath:indexPath];
        return cell;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.section == 0) {
        id ID = _dateArray[indexPath.section];
        if ([ID isKindOfClass:[NSDictionary class]]) {
            //想要西捐赠的人的详情页面
            NSDictionary * model = _dateArray[indexPath.section];
            NSArray * array = model[@"applys"];
            NSDictionary * donateModle = array[indexPath.row];
            NeedDonateDetailViewController * detailWishVC = [[NeedDonateDetailViewController alloc] init];
            detailWishVC.dicModel = donateModle;
            detailWishVC.delegate = self;
            detailWishVC.donateModel = _donateModel;
            [self.navigationController pushViewController:detailWishVC animated:YES];
        }else{
            CommentModel * model = _dateArray[indexPath.section];
            SubComment * sub = model.subComments[indexPath.row];
            [self showKeyboardWithOrder:nil commentedId:sub.commentId nick:sub.recipientNike];
        }
    }else{
        CommentModel * model = _dateArray[indexPath.section];
        SubComment * sub = model.subComments[indexPath.row];
        [self showKeyboardWithOrder:nil commentedId:sub.commentId nick:sub.recipientNike];
    }

}
- (void)refreshDonateDetailView
{
    [_dateArray removeAllObjects];
    [self getNeedDonateListData];
}
- (void)showKeyboardWithOrder:(NSNumber *)order commentedId:(NSNumber *)commentedId nick:(NSString *)nick
{
    [UUKeyboardInputView showKeyboardConfige:^(UUInputConfiger * _Nonnull configer) {
        // 配置信息（后续可继续添加）
        configer.keyboardType = UIKeyboardTypeDefault;
        configer.content = nick;
        configer.backgroundColor = [UIColor clearColor];
    } block:^(NSString * _Nonnull contentStr) {
        // 回调事件处理
        if (contentStr.length == 0)
            return;
        NSDictionary * dic;
        if (order) {
            dic = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_donateModel.orderId,@"commentContent":contentStr};
        }else{
            dic = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_donateModel.orderId,@"commentContent":contentStr,@"commentedId":commentedId};
        }
        [self commentWithParament:dic];
        NSLog(@"评论");
    }];
}
- (void)commentWithParament:(NSDictionary *)parament
{
    [CommentModel commentOrderWithParament:parament success:^(NSDictionary *dic) {
        NSLog(@"commentDic = %@",dic);
        NSLog(@"评论11111 = %@",dic[@"msg"]);
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (UIImageView *)userImageView
{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] init];
        _userImageView.clipsToBounds = YES;
        _userImageView.contentMode = UIViewContentModeScaleAspectFill;
        _userImageView.layer.cornerRadius = 20.0f;
    }
    return _userImageView;
}
- (UILabel *)userNickNameLabel
{
    if (!_userNickNameLabel) {
        _userNickNameLabel = [[UILabel alloc] init];
        _userNickNameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _userNickNameLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _userNickNameLabel;
}

- (ImageTextButton *)cityButton
{
    if (!_cityButton) {
        _cityButton = [ImageTextButton buttonWithType:UIButtonTypeCustom];
        _cityButton.midSpacing = 2;
        _cityButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        _cityButton.imageSize = CGSizeMake(9.9, 11.9);
        [_cityButton setTitleColor:kUIColorFromRGB(0x999999) forState:UIControlStateNormal];
        _cityButton.layoutStyle = ImageTextButtonStyleLeftImageRightTitle;
        [_cityButton setImage:[UIImage imageNamed:@"list_icon_weizhi"] forState:UIControlStateNormal];
    }
    return _cityButton;
}

- (UIImageView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIImageView alloc] init];
        _lineView.backgroundColor = kUIColorFromRGB(0xEEEEEE);
    }
    return _lineView;
}

- (UILabel *)titileLabel
{
    if (!_titileLabel) {
        _titileLabel = [[UILabel alloc] init];
        _titileLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
        _titileLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _titileLabel;
}

- (UIButton *)typeImageView
{
    if (!_typeImageView) {
        _typeImageView = [UIButton buttonWithType:UIButtonTypeCustom];
        _typeImageView.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11];
        [_typeImageView setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
    }
    return _typeImageView;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kUIColorFromRGB(0x666666);
    }
    return _contentLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        UIFont * nameFont = [UIFont fontWithName:@"PingFangSC-Light" size:11];
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = nameFont;
        _timeLabel.text = @"更新于1分钟前";
        _timeLabel.textColor = kUIColorFromRGB(0x999999);
    }
    return _timeLabel;
}

- (void)showCommentView
{
    if (!isShowComment) {
        [UIView animateWithDuration:0.5 animations:^{
            _expandView.frame = CGRectMake(SCREEN_WIDTH - size - 27, SCREEN_HEIGHT - 24*2 - 3*size - 82, size, 24*2 + 3*size);
        } completion:^(BOOL finished) {
            isShowComment = YES;
        }];
    }
}
- (void)hiddenCommentView
{
    if (isShowComment) {
        [UIView animateWithDuration:0.5 animations:^{
            _expandView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT - 24*2 - 3*size - 82, size, 24*2 + 3*size);
        } completion:^(BOOL finished) {
            isShowComment = NO;
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > _commentView.bottom) {
        [self showCommentView];
    }
    if (scrollView.contentOffset.y < _commentView.top) {
        [self hiddenCommentView];
    }

}
- (UIView *)creatUI:(NSArray *)array{
//    CGFloat bgViewWight = SCREEN_WIDTH - 18 - 30 - 15 - 7;
    CGFloat bgViewWight = SCREEN_WIDTH;

    
    CGFloat top = 31;
    // 保存前一个button的宽以及前一个button距离屏幕边缘的距
    CGFloat edge = 0;
    
    //设置button 距离父视图的高
    CGFloat h = 12;
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, top, bgViewWight, 200)];
    bgView.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:bgView];
    
    CGFloat y = 0.0;
    for (int i = 0; i < array.count; i ++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = 100 + i;
        button.backgroundColor = kUIColorFromRGB(0xFFFFFF);
//        [button addTarget:self action:@selector(selectClick:) forControlEvents:(UIControlEventTouchUpInside)];
        button.clipsToBounds = YES;
        button.layer.cornerRadius = 12.0f;
        button.layer.borderWidth = 0.5f;
        button.layer.borderColor = MainColor.CGColor;
        //确定文字的字号
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        
        //计算文字的长度值
        CGFloat length = [[GlobalSingleton Singleton] getWidthWithText:array[i] higth:24 font:font].size.width + 24;
        
        //为button赋值
        [button setTitle:array[i] forState:(UIControlStateNormal)];
        button.titleLabel.font = font;
        //设置button的frame
        button.frame =CGRectMake(edge + 14, h, length + 14, 24);
        
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if (edge + 14 + length + 14 > bgViewWight) {
            //换行时将左边距设置为10
            edge = 0;
            //距离父视图的高度变化
            h = h + button.frame.size.height + 12;
            //标签换行后的frame
            button.frame = CGRectMake(edge + 14, h, length + 14, 24);
        }
        //获取前一个button的尾部位置位置
        edge = button.frame.size.width + button.frame.origin.x;
        [button setTitleColor:kUIColorFromRGB(0x999999) forState:(UIControlStateNormal)];
        
        [bgView addSubview:button];
        
        //用来记录最后一个button的位置
        y = button.origin.y;
    }
    bgView.frame = CGRectMake(0, top, bgViewWight, y + 36);
    return bgView;
}

- (void)getNeedDonateListData
{
    NSDictionary * dic = @{@"orderId":_donateModel.orderId,@"page":@1,@"pageSize":@10};
    [DonateModel needTisDonateListWithParament:dic success:^(NSDictionary *dic) {
        NSLog(@"needTisDonateList = %@",dic);
        NSLog(@"needTisDonateList = %@",dic[@"msg"]);
        NSDictionary * model = dic[@"data"];
        [self.dateArray addObject:model];
        [self getCommentData];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (void)getCommentData
{
    if (![self checkLogin]) {
        return;
    }
    NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken,@"orderId":_donateModel.orderId,@"page":@1,@"pageSize":@10};
    [CommentModel getCommentListWithParament:dic success:^(NSDictionary *dic) {
        NSLog(@"commentDic = %@",dic);
        NSArray * commentArray = [CommentModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"comments"]];
        [self.dateArray addObjectsFromArray:commentArray];
        [_donateDetailTBView reloadData];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (void)collectDonate
{
    NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_donateModel.orderId};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [DonateModel collectTisDonateWithParament:dic success:^(NSDictionary *dic) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if ([dic[@"code"] isEqualToString:NormalStatus]) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"收藏成功" duration:MBProgressHUDDuration];
        }else{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"收藏失败" duration:MBProgressHUDDuration];
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}
- (CGFloat)getlineCount:(NSInteger)count
{
    if (count < 4) {
        return 20 + (SCREEN_WIDTH - 30 - 24) / 4;
    }else if (count >= 4 & count < 8){
        return 20 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 2 + 8;
    }else{
        return 20 + ((SCREEN_WIDTH - 30 - 24) / 4 ) * 3 + 16;
    }
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
