//
//  RecommendDetailViewController.m
//  nrProjectNew
//
//  Created by 那然 on 2018/1/29.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import "RecommendDetailViewController.h"
#import "CommentBottomView.h"
#import "UUKeyboardInputView.h"
#import "CommentModel.h"
#import "ExpandView.h"

@interface RecommendDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
{
    CGFloat size;
    BOOL isShowComment;
    BOOL isRise;
    BOOL isCollect;
    NSInteger zanCount;
    NSInteger collectCount;
    UIButton * shareButton;
    NSString * shareContent;
}
@property (strong, nonatomic) UITableView * recommendDetailTBView;

@property (strong, nonatomic) UIView * headView;

@property (strong, nonatomic) UIWebView * headWebView;

@property (strong, nonatomic) CommentBottomView * commentView;

@property (strong, nonatomic) NSMutableArray *commentArray;

@property (strong, nonatomic) UILabel * noCommentLabel;

@property (strong, nonatomic) ExpandView * expandView;

@end

@implementation RecommendDetailViewController
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
    
    
    if (SCREEN_WIDTH <= 375) {
        size = 40;
    }else{
        size = 50;
    }
    
    [self.customNavBar setTitle:@"每周推荐"];
    
    _webViewUrlStr = @"http://api.naranc.cn/rest/credentials/protocol";
    
    [self.view addSubview:self.recommendDetailTBView];
    
    _recommendDetailTBView.tableHeaderView = self.headView;
    
    [_headView addSubview:self.headWebView];
    
    [_headView addSubview:self.commentView];

//    [self loadCommentView];
//    [self getInfoStatus];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCommentData) name:@"NotificationNRInfoCommentSuccess" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCommentData) name:@"NotificationDeleteCommentSuccess" object:nil];
    
    [self.view addSubview:self.expandView];

}
- (UITableView *)recommendDetailTBView
{
    if (!_recommendDetailTBView) {
        CGFloat top = ([WRNavigationBar isIphoneX]) ? 88 : 64;
        CGRect frame = CGRectMake(0, top, SCREEN_WIDTH, SCREEN_HEIGHT - top);
        _recommendDetailTBView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _recommendDetailTBView.delegate = self;
        _recommendDetailTBView.dataSource = self;
        _recommendDetailTBView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _recommendDetailTBView.showsVerticalScrollIndicator = NO;
        _recommendDetailTBView.backgroundColor = kUIColorFromRGB(0xf5f5f5);
        _recommendDetailTBView.estimatedRowHeight = 0;
        _recommendDetailTBView.estimatedSectionHeaderHeight = 0;
        _recommendDetailTBView.estimatedSectionFooterHeight = 0;
    }
    return _recommendDetailTBView;
}
- (UIView *)headView
{
    if (!_headView) {
        _headView = [[UIView alloc] init];
        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
    }
    return _headView;
}
- (UIWebView *)headWebView
{
    if (!_headWebView) {
        _headWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _headWebView.delegate = self;
        _headWebView.scrollView.scrollEnabled = NO;
        [_headWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_webViewUrlStr] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20.0]];
        [_headWebView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
        [_headWebView sizeToFit];
    }
    return _headWebView;
}
- (CommentBottomView *)commentView
{
    if (!_commentView) {
        NSArray * imageArray = @[@"list_btn_fengxiang_org",@"list_btn_shoucang_gre",@"list_btn_pinglun_blu"];
        _commentView = [[CommentBottomView alloc] initWithFrame:CGRectMake(0, _headWebView.bottom, SCREEN_WIDTH, 40) ImageArray:imageArray];
        weakify(self);
        _commentView.onClickCommentButton = ^{
            [weakSelf showKeyboardWithOrder:@"" commentedId:nil nick:@""];
        };
    }
    return _commentView;
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
            [self showKeyboardWithOrder:@"" commentedId:nil nick:@""];
        };
    }
    return _expandView;
}
- (void)refreshCommentData
{
    [self reloadCommentData];
}
- (void)reloadCommentData
{
    [_commentArray removeAllObjects];
    [self loadCommentData];
    [self getInfoStatus];
}
- (void)loadCommentData
{
//    NSDictionary * dic = @{@"objectId":_infoDic[@"contentId"],@"type":@"CONT",@"page":@"1",@"row":@CommentRow};
//    [InfoModel attentionProducterWithUrlString:@"comment/list" paraments:dic success:^(NSDictionary *dic) {
//        NSLog(@"topicDic = %@",dic);
//        NSArray * array = dic[@"datapage"][@"list"];
//        if (array.count) {
//            infoTableView.tableFooterView = nil;
//        }else{
//            infoTableView.tableFooterView = self.noCommentLabel;
//        }
//        for (NSDictionary * dic in array) {
//            CommentModel * commentModel = [[CommentModel alloc] initWithDictionary:dic error:nil];
//            [self.commentArray addObject:commentModel];
//        }
//        if (_commentArray.count == 10) {
//            NSString * moreTitle = @"查看更多评论";
//            [_commentArray addObject:moreTitle];
//
//        }
//        _commentBottomView.centerCount = [dic[@"datapage"][@"total"] integerValue];
//
//        [infoTableView reloadData];
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"error = %@",error);
//    }];
    
}
- (UILabel *)noCommentLabel
{
    if (!_noCommentLabel) {
        _noCommentLabel = [[UILabel alloc] init];
        _noCommentLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
        _noCommentLabel.font = [UIFont systemFontOfSize:15];
        _noCommentLabel.textColor = kUIColorFromRGB(0x999999);
        _noCommentLabel.text = @"暂无评论";
        _noCommentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _noCommentLabel;
}
- (void)loadCommentView
{
//    NSArray * imageArray = @[@"rise_normal",@"comment_normal",@"collect_normal"];
//    _commentBottomView = [[CommentBottomView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - self.navigationController.tabBarController.tabBar.height, SCREEN_WIDTH, self.navigationController.tabBarController.tabBar.height) ImageArray:imageArray];
//    _commentBottomView.delegate = self;
//    [self.view addSubview:_commentBottomView];
    
}

- (void)commentViewOpertion:(NSInteger)opertion
{
//    if (![self checkLogin]) {
//        return;
//    }
//    if (opertion == 1001) {
//        //DZ
//        [self operationInfoWithType:@"DC"];
//    }
//    if (opertion == 1002) {
//        //PL
//        CommentViewController * commentVC = [[CommentViewController alloc] init];
//        commentVC.titleStr = @"发评论";
//        commentVC.isComment = YES;
//        commentVC.isNRInfo = YES;
//        commentVC.objectID = _infoDic[@"contentId"];
//        [self.navigationController pushViewController:commentVC animated:YES];
//    }
//    if (opertion == 1003) {
//        //SC
//        [self operationInfoWithType:@"SC"];
//    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * commentCell = @"commentCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:commentCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentCell];
    }
//    if (_commentArray.count) {
//        cell.textLabel.text = _commentArray[indexPath.row];
//    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = kUIColorFromRGB(0x999999);
    cell.backgroundColor = MainColor;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CommentModel * commentModel;
//    if (_commentArray.count) {
//        commentModel = _commentArray[indexPath.row];
//    }
//    if (indexPath.row == 10) {
//        return 44;
//    }else{
//        CommentModel * commentModel;
//        if (_commentArray.count) {
//            commentModel = _commentArray[indexPath.row];
//        }
//        CGRect rect = [[GlobalSingleton Singleton] getHeigthWithText:commentModel.commentBody width:CommentConentWight font:CommentContentFont];
//        return 83 - 20 + rect.size.height;
//    }
    return 200;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 10) {
        //更多评论
//        MoreCommentViewController * moreVC = [[MoreCommentViewController alloc] init];
//        moreVC.contentId = _infoDic[@"contentId"];
//        [self.navigationController pushViewController:moreVC animated:YES];
    }else{
//        CommentModel * commentModel = _commentArray[indexPath.row];
//        
//        deleteCommentModel = commentModel;
//        deleteIndexPath = indexPath;
//        if ([commentModel.author.userId isEqualToString:[UserModel getUser].userId]) {
//            UIAlertView * alertView;
//            if (!alertView) {
//                alertView = [[UIAlertView alloc] initWithTitle:@"是否删除本条评论" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            }
//            [alertView show];
//            return;
//        }
//        NSLog(@"%@",commentModel);
//        CommentViewController * commentVC = [[CommentViewController alloc] init];
//        commentVC.titleStr = @"回复评论";
//        commentVC.commentModel = commentModel;
//        commentVC.isNRInfo = YES;
//        commentVC.objectID = _infoDic[@"contentId"];
//        [self.navigationController pushViewController:commentVC animated:YES];
    }
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    shareContent = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [self loadCommentData];
    
}
- (void)getInfoStatus
{
//    NSString * urlStr = [NSString stringWithFormat:@"common/article/relation/%@",_infoDic[@"contentId"]];
//    [InfoModel attentionProducterWithUrlString:urlStr paraments:nil success:^(NSDictionary *dic) {
//        NSLog(@"zanDic = %@",dic);
//        NSDictionary * infoDic = dic[@"relation"];
//        zanCount = [infoDic[@"riseTimes"] integerValue];
//        collectCount = [infoDic[@"collectionTimes"] integerValue];
//        _commentBottomView.leftCount = zanCount;
//        _commentBottomView.rightCount = collectCount;
//        isRise = [infoDic[@"rise"] boolValue];
//        isCollect = [infoDic[@"collection"] boolValue];
//        if (isRise) {
//            _commentBottomView.leftImageStr = @"rise_height";
//        }
//        if (isCollect) {
//            _commentBottomView.rightImageStr = @"collect_height";
//        }
//        NSMutableDictionary * refreshDic = [NSMutableDictionary dictionaryWithCapacity:1];
//        [refreshDic setDictionary:_infoDic];
//        [refreshDic setValue:[NSNumber numberWithInteger:[infoDic[@"contentReviewTimes"] integerValue]] forKey:@"contentReviewTimes"];
//        [_delegate refreshCommentCount:_indexPath model:refreshDic];
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"error = %@",error);
//    }];
}
- (void)operationInfoWithType:(NSString *)type
{
//    NSString * str;
//    if ([type isEqualToString:@"DC"]) {
//        if (isRise) {
//            str = @"del";
//        }else{
//            str = @"add";
//        }
//    }else{
//        if (isCollect) {
//            str = @"del";
//        }else{
//            str = @"add";
//        }
//    }
//    NSDictionary * dic = @{@"objectId":_infoDic[@"contentId"],@"type":type};
//    NSString * urlStr = [NSString stringWithFormat:@"usercenter/article/concern/%@",str];
//    [InfoModel attentionProducterWithUrlString:urlStr paraments:dic success:^(NSDictionary *dic) {
//        NSLog(@"zanDic = %@",dic);
//        if ([type isEqualToString:@"DC"]) {
//            if (isRise) {
//                isRise = NO;
//                _commentBottomView.leftImageStr = @"rise_normal";
//
//                zanCount = zanCount - 1;
//            }else{
//                isRise = YES;
//                _commentBottomView.leftImageStr = @"rise_height";
//
//                zanCount = zanCount + 1;
//            }
//            _commentBottomView.leftCount = zanCount;
//
//            NSMutableDictionary * refreshDic = [NSMutableDictionary dictionaryWithCapacity:1];
//            [refreshDic setDictionary:_infoDic];
//            [refreshDic setValue:[NSNumber numberWithInteger:zanCount] forKey:@"contentRiseTimes"];
//            [_delegate refreshRiseCount:_indexPath model:refreshDic];
//
//        }else{
//            if (isCollect) {
//                isCollect = NO;
//                _commentBottomView.rightImageStr = @"collect_normal";
//                collectCount = collectCount - 1;
//            }else{
//                isCollect = YES;
//                _commentBottomView.rightImageStr = @"collect_height";
//                collectCount = collectCount + 1;
//            }
//            _commentBottomView.rightCount = collectCount;
//
//            NSMutableDictionary * refreshDic = [NSMutableDictionary dictionaryWithCapacity:1];
//            [refreshDic setDictionary:_infoDic];
//            [refreshDic setValue:[NSNumber numberWithInteger:collectCount] forKey:@"contentCollectionTimes"];
//            [_delegate refreshCollectionCount:_indexPath model:refreshDic];
//
//        }
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"error = %@",error);
//    }];
}
- (void)supportComment:(NSIndexPath*)indexPath;
{
//    CommentModel * model = _commentArray[indexPath.row];
//    NSLog(@"model.commentId = %@",model.commentId);
//    NSString * str;
//    if (model.currUserDC) {
//        str = @"del";
//    }else{
//        str = @"add";
//    }
//
//    NSDictionary * dic = @{@"commentId":model.commentId};
//    NSString * urlStr = [NSString stringWithFormat:@"comment/concern/%@",str];
//    [InfoModel attentionProducterWithUrlString:urlStr paraments:dic success:^(NSDictionary *dic) {
//        NSLog(@"CommentSupportDic = %@",dic);
//        CommentModel * commentModel = [[CommentModel alloc] init];
//        if ([str isEqualToString:@"del"]) {
//            commentModel.commentId = model.commentId;
//            commentModel.currUserDC = nil;
//            commentModel.commentRiseTimes = model.commentRiseTimes - 1;
//        }else{
//            commentModel.commentId = model.commentId;
//            commentModel.currUserDC = @{@"111":@"dddd"};
//            commentModel.commentRiseTimes = model.commentRiseTimes + 1;
//        }
//        commentModel.author = model.author;
//        commentModel.commentBody = model.commentBody;
//        commentModel.createTime = model.createTime;
//        commentModel.criticAuthorName = model.criticAuthorName;
//        commentModel.criticId = model.criticId;
//        [_commentArray replaceObjectAtIndex:indexPath.row withObject:commentModel];
//        [infoTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"error = %@",error);
//    }];
    
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
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentSize"]) {
        CGSize fitSize = [_headWebView sizeThatFits:CGSizeZero];
        _headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, fitSize.height + 40);
        _headWebView.frame = CGRectMake(0, 0, SCREEN_WIDTH, fitSize.height);
        _commentView.frame = CGRectMake(0, _headWebView.bottom, SCREEN_WIDTH, 40);
        [_recommendDetailTBView beginUpdates];
        [_recommendDetailTBView setTableHeaderView:_headView];
        [_recommendDetailTBView endUpdates];
    }
}
- (void)dealloc
{
    [_headWebView.scrollView removeObserver:self forKeyPath:@"contentSize" context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark ----- pinglun --------
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
//            dic = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_wishModel.orderId,@"commentContent":contentStr};
        }else{
//            dic = @{@"accessToken":[UserModel getUser].accessToken, @"orderId":_wishModel.orderId,@"commentContent":contentStr,@"commentedId":commentedId};
        }
        [self commentWithParament:dic];
        NSLog(@"评论");
    }];
}
- (void)commentWithParament:(NSDictionary *)parament
{
    return;
    [CommentModel commentOrderWithParament:parament success:^(NSDictionary *dic) {
        NSLog(@"commentDic = %@",dic);
        NSLog(@"评论11111 = %@",dic[@"msg"]);
    } withFailureBlock:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}


//分享
- (void)goShareAction
{
    //1、创建分享参数
    //    NSArray* imageArray = @[_infoDic[@"cover"][@"pictureUrl"]];
    //    if (imageArray) {
    //        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    //        [shareParams SSDKSetupShareParamsByText:shareContent
    //                                         images:imageArray
    //                                            url:[NSURL URLWithString:_webViewUrlStr]
    //                                          title:_titleStr
    //                                           type:SSDKContentTypeAuto];
    //        [shareParams SSDKEnableUseClientShare];
    //        //调用自定义分享
    //        [JZShareCustom shareWithContent:shareParams withFramID:@""];
    //    }
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
