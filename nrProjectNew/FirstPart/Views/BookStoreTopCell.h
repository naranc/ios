//
//  BookStoreTopCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopSelectView.h"
#import "GYRollingNoticeView.h"
#import "SDCycleScrollView.h"


@protocol BookStoreTopCellDelegate <NSObject>

- (void)clickTopSlectType:(NSInteger)type;

@end


@class TopSelectView;
@interface BookStoreTopCell : UITableViewCell<GYRollingNoticeViewDataSource, GYRollingNoticeViewDelegate,SDCycleScrollViewDelegate,TopSelectViewDelegate>
{
    NSArray *_arr1;
}

@property (nonatomic, strong) UITableView * bookTableView;

@property (nonatomic, strong) UIView * topBgView;

@property (nonatomic, strong) TopSelectView * topSelectView;



@property (nonatomic, strong) UIView * noticeBgView;

@property (nonatomic, strong) UIImageView * noticeImageView;

@property (nonatomic, strong) GYRollingNoticeView *noticeView;

@property (nonatomic, strong) GYRollingNoticeView *temoNoticeView;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong)NSMutableArray *imageArray;

@property (nonatomic, assign) id<TopSelectViewDelegate>delegate;

@end
