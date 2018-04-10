//
//  RecommendDetailViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/29.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RecommendDetailViewControllerDelegate <NSObject>

- (void)refreshCommentCount:(NSIndexPath *)indexPath model:(NSDictionary*)model;

- (void)refreshRiseCount:(NSIndexPath *)indexPath model:(NSDictionary*)model;

- (void)refreshCollectionCount:(NSIndexPath *)indexPath model:(NSDictionary*)model;

@end

@interface RecommendDetailViewController : NRBaseViewController

@property (strong, nonatomic) NSString * webViewUrlStr;

@property (strong, nonatomic) NSString * titleStr;

@property (strong, nonatomic) NSDictionary * infoDic;

@property (strong, nonatomic) NSIndexPath * indexPath;

@property (assign, nonatomic) id<RecommendDetailViewControllerDelegate>delegate;


@end
