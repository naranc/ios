//
//  WishDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "WishDetailViewController.h"
#import "WishModel.h"
#import "WishDetailHeadView.h"
#import "JGGView.h"
#import "ExpandView.h"
#import "CommentBottomView.h"
#import "HelpHerViewController.h"
#import "CommentModel.h"
#import "CommentTableViewCell.h"
#import "WishDetailApplyTableViewCell.h"
#import "DetailWishViewController.h"
#import "UUKeyboardInputView.h"
#import "SubCommentTableViewCell.h"

@interface WishDetailViewController ()<UITableViewDelegate, UITableViewDataSource , DetailWishViewControllerDelegate,HelpHerViewControllerDelegate>

{
    JGGView * jggView;
    
    CGFloat size;
    
    BOOL isShowComment;
    
    NSString * wishStatus;
    
}

@property (strong, nonatomic) NSMutableArray * dateArray;

@property (strong, nonatomic) UITableView * wishDetailTBView;

@property (strong, nonatomic) WishDetailHeadView * tbHeadView;

@property (strong, nonatomic) ExpandView * expandView;

@property (strong, nonatomic) CommentBottomView * commentView;


@property (nonatomic, strong) UIButton * statusButton;

@end

@implementation WishDetailViewController

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
    [self getApplyDetail];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.customNavBar setTitle:@"心愿详情"];
    [self.customNavBar wr_setRightButtonWithImage:[UIImage imageNamed:@""]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refeshDetailStatus) name:@"InputWayNumberSuccess" object:nil];
    
    if (SCREEN_WIDTH <= 375) {
        size = 40;
    }else{
        size = 50;
    }
    
    UIView * headView = [[UIView alloc] init];
    headView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
    
    [self.view addSubview:self.wishDetailTBView];
    
    CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:_wishModel.orderContent width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Light" size:15]];

    if (_wishModel.orderImgs) {
        //有图
        NSArray * imageArray;
        if ([_wishModel.orderImgs containsString:@","]) {
            imageArray = [_wishModel.orderImgs componentsSeparatedByString:@","];//以“,”切割
        }else{
            imageArray = @[_wishModel.orderImgs];
        }
        if (imageArray.count == 1) {
            //1张图
            _tbHeadView = [[WishDetailHeadView alloc] initWithFrame:CGRectMake(0, 12, SCREEN_WIDTH, 162 + rect.size.height + SCREEN_WIDTH - 30) HasOnePic:YES model:_wishModel];
            _tbHeadView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
            headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 162 + rect.size.height + SCREEN_WIDTH - 30 + 40);
            [headView addSubview:_tbHeadView];
            [headView addSubview:self.commentView];
            _wishDetailTBView.tableHeaderView = headView;
        }else{
            //2张图 或者更多图
            _tbHeadView = [[WishDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 162 + rect.size.height + (SCREEN_WIDTH - 40)/3) morePic:YES model:_wishModel];
            _tbHeadView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
            headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 162 + rect.size.height + (SCREEN_WIDTH - 40)/3 + 40);
            [headView addSubview:_tbHeadView];
            [headView addSubview:self.commentView];
            _wishDetailTBView.tableHeaderView = headView;
        }
    }else{
        //无图
        _tbHeadView = [[WishDetailHeadView alloc] initWithFrame:CGRectMake(0, 12, SCREEN_WIDTH, 165 + rect.size.height) model:_wishModel];
        _tbHeadView.backgroundColor = kUIColorFromRGB(0xFFFFFF);
        headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 165 + rect.size.height + 40);
        [headView addSubview:_tbHeadView];
        [headView addSubview:self.commentView];
        _wishDetailTBView.tableHeaderView = headView;
    }
    
    [self.view addSubview:self.expandView];
    [self.view addSubview:self.statusButton];
    [self getApplyDetail];
    [self getWishDetailWithOrderID:[NSString stringWithFormat:@"%@",_wishModel.orderId]];

}

- (UIButton *)statusButton
{
    if (!_statusButton) {
        _statusButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _statusButton.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
        [_statusButton setTitleColor:kUIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        _statusButton.hidden = YES;
        [_statusButton addAction:^(UIButton *btn) {
            //别人进来去帮他实现
            if ([wishStatus isEqualToString:@"INITIAL"]) {
                if (![[UserModel getUser].certificationType isEqualToString:@"SUCCESS"]) {
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES text:@"您未实名认证" duration:MBProgressHUDDuration];
                    return;
                }
                HelpHerViewController * helpVC = [[HelpHerViewController alloc] init];
                helpVC.orderID = [NSString stringWithFormat:@"%@",_wishModel.orderId];
                helpVC.province = _wishModel.province;
                helpVC.city = _wishModel.city;
                helpVC.delegate = self;
                [self.navigationController pushViewController:helpVC animated:YES];
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _statusButton;
}
- (void)HelpDoneRefeshWishDetailView
{
    [_dateArray removeAllObjects];
    [self getApplyDetail];
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
            [self showKeyboardWithOrder:_wishModel.orderId commentedId:nil nick:@""];
        };
    }
    return _expandView;
}
- (CommentBottomView *)commentView
{
    if (!_commentView) {
        NSArray * imageArray = @[@"list_btn_fengxiang_org",@"list_btn_shoucang_gre",@"list_btn_pinglun_blu"];
        _commentView = [[CommentBottomView alloc] initWithFrame:CGRectMake(0, _tbHeadView.bottom, SCREEN_WIDTH, 40) ImageArray:imageArray];
        _commentView.onClickCommentButton = ^{
            [self showKeyboardWithOrder:_wishModel.orderId commentedId:nil nick:@""];
        };
    }
    return _commentView;
}
- (UITableView *)wishDetailTBView
{
    if (!_wishDetailTBView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top - 49);
        _wishDetailTBView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _wishDetailTBView.delegate = self;
        _wishDetailTBView.dataSource = self;
        _wishDetailTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _wishDetailTBView.showsVerticalScrollIndicator = NO;
        _wishDetailTBView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _wishDetailTBView.estimatedRowHeight = 0;
        _wishDetailTBView.estimatedSectionHeaderHeight = 0;
        _wishDetailTBView.estimatedSectionFooterHeight = 0;
        _wishDetailTBView.autoresizesSubviews = YES;
    }
    return _wishDetailTBView;
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
            return 1;
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
            
            NSDictionary * model = _dateArray[indexPath.row];
            CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:model[@"applyContent"] width:SCREEN_WIDTH - 30 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
            return 16 + 40 + 12 + 20 + 8 + rect.size.height + 8 + (SCREEN_WIDTH - 40)/3 + 45 + 12;
            
        }else{
            CommentModel * model = _dateArray[indexPath.section];
            SubComment * sub = model.subComments[indexPath.row];
            CGRect rect = [[GlobalSingleton Singleton]getHeigthWithText:sub.commentContent width:SCREEN_WIDTH - 63 - 15 font:[UIFont fontWithName:@"PingFangSC-Regular" size:14]];
            return 12 + 30 + 8 + rect.size.height;
        }
    }else{
        CommentModel * model = _dateArray[indexPath.section];
        SubComment * sub = model.subComments[indexPath.row];
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
                namelabel.text = @"捐赠的人";
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
            UIView * singleTapView = [singleTap view];
            singleTapView.tag = section;

        }
        return headView;
    }
}
-(void)tapImageAction:(id)sender
{
    UITapGestureRecognizer *singleTap = (UITapGestureRecognizer *)sender;
//    NSLog(@"%@",[singleTap view].tag]);
    CommentModel * commentModel = _dateArray[[singleTap view].tag];
    
    [self showKeyboardWithOrder:nil commentedId:commentModel.commentId nick:commentModel.initiatorNike];
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0){
        id ID = _dateArray[indexPath.section];
        if ([ID isKindOfClass:[NSDictionary class]]) {
            NSDictionary * model = _dateArray[indexPath.row];
            static NSString *donateCell = @"donateCell";
            WishDetailApplyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:donateCell];
            if (!cell) {
                cell = [[WishDetailApplyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:donateCell];
            }
            cell.backgroundColor = kUIColorFromRGB(0xf5f5f5);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell wishDetailViewConfigCellWithModel:model indexPath:indexPath];
            return cell;
            
        }else{
            CommentModel * model;
            SubComment *subModel;
            if (_dateArray.count) {
                model = _dateArray[indexPath.section];
                subModel = model.subComments[indexPath.row];
            }
            static NSString *commentCell = @"commentCell";
            SubCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:commentCell];
            if (!cell) {
                cell = [[SubCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentCell];
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
            NSDictionary * dic = _dateArray[indexPath.section];
            DetailWishViewController * detailWishVC = [[DetailWishViewController alloc] init];
            detailWishVC.dicModel = dic;
            detailWishVC.wishModel = _wishModel;
            detailWishVC.delegate = self;
            //11
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
- (void)refreshWishDetailView
{
    
    [_dateArray removeAllObjects];
    [self getApplyDetail];
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
            dic = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_wishModel.orderId,@"commentContent":contentStr};
        }else{
            dic = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_wishModel.orderId,@"commentContent":contentStr,@"commentedId":commentedId};
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
    NSLog(@"contentOffset.y = %f",scrollView.contentOffset.y);
    //    NSLog(@"tableHeaderView.height = %f",_donateDetailTBView.tableHeaderView.height);
    NSLog(@"yyyyy = %f",_commentView.top);
    NSLog(@"zzzzzzzz = %f",_commentView.bottom);
    
    if (scrollView.contentOffset.y > _commentView.bottom) {
        [self showCommentView];
    }
    if (scrollView.contentOffset.y < _commentView.top) {
        [self hiddenCommentView];
    }
    
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
- (void)getWishDetailWithOrderID:(NSString *)orderID
{
    [WishModel getWishDetailWithParament:orderID success:^(NSDictionary *dic) {
        NSLog(@"wishDetailDic = %@",dic);
        WishModel * wishModel = [WishModel mj_objectWithKeyValues:dic[@"data"]];
        _wishModel = wishModel;
        self.statusButton.hidden = NO;
        
        
        [_commentView.leftButton setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        
        [_commentView.centerButton setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
        
        if (dic[@"data"][@"commentTimes"]) {
            [_commentView.rightButton setTitle:[NSString stringWithFormat:@"%@",dic[@"data"][@"collectionTimes"]] forState:UIControlStateNormal];
        }else{
            [_commentView.rightButton setTitle:@"0" forState:UIControlStateNormal];
            
        }
        
        
//        INITIAL    待匹配
//        GOING    匹配中
//        WAITING    等待中
//        SUCCESS    匹配成功
//        REVOKE    撤回
//        FAIL    匹配失败
        wishStatus = wishModel.orderStatus;
        if ([wishModel.orderStatus isEqualToString:@"INITIAL"]) {
            NSLog(@"订单待匹配");
            self.statusButton.backgroundColor = MainColor;
            [self.statusButton setTitle:@"帮TA实现" forState:UIControlStateNormal];
            self.statusButton.enabled = YES;
            
            if (_wishModel.initiatorId == [UserModel getUser].accountId) {
//                self.statusButton.hidden = YES;
                self.statusButton.backgroundColor = kUIColorFromRGB(0x999999);
                self.statusButton.enabled = NO;
//                CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
//                self.wishDetailTBView.frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
            }
            
        }else if ([wishModel.orderStatus isEqualToString:@"GOING"]){
            
            self.statusButton.backgroundColor = MainColor;
            [self.statusButton setTitle:@"匹配中" forState:UIControlStateNormal];
            self.statusButton.enabled = NO;
        }else if ([wishModel.orderStatus isEqualToString:@"WAITING"]){
            
            self.statusButton.backgroundColor = MainColor;
            [self.statusButton setTitle:@"等待中" forState:UIControlStateNormal];
            self.statusButton.enabled = NO;
        }else if ([wishModel.orderStatus isEqualToString:@"SUCCESS"]){
            NSLog(@"订单匹配成功");
            self.statusButton.backgroundColor = MainColor;
            [self.statusButton setTitle:@"匹配成功" forState:UIControlStateNormal];
            self.statusButton.enabled = NO;
        }else if ([wishModel.orderStatus isEqualToString:@"REVOKE"]){
            NSLog(@"订单撤回");
            self.statusButton.backgroundColor = kUIColorFromRGB(0x999999);
            [self.statusButton setTitle:@"已撤回" forState:UIControlStateNormal];
            self.statusButton.enabled = NO;
        }else{
            NSLog(@"订单匹配失败");
            self.statusButton.backgroundColor = kUIColorFromRGB(0x999999);
            [self.statusButton setTitle:@"匹配失败" forState:UIControlStateNormal];
            self.statusButton.enabled = NO;
        }
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}


- (void)getApplyDetail
{
    [WishModel getApplyWishDetailWithParament:@{@"orderId":_wishModel.orderId} success:^(NSDictionary *dic) {
        NSLog(@"applyDetailDic = %@",dic);
        NSDictionary * model = dic[@"data"];
        if (model.count) {
            [self.dateArray addObject:model];
        }
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
    NSDictionary * dic = @{@"accessToken":[UserModel getUser].accessToken,@"orderId":_wishModel.orderId,@"page":@1,@"pageSize":@10};
    [CommentModel getCommentListWithParament:dic success:^(NSDictionary *dic) {
        NSLog(@"commentDic = %@",dic);
        NSArray * commentArray = [CommentModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"comments"]];
        [self.dateArray addObjectsFromArray:commentArray];
        [_wishDetailTBView reloadData];
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
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
