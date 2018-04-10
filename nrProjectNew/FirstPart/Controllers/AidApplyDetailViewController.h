//
//  AidApplyDetailViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/31.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol AidApplyDetailViewControllerDelegate <NSObject>

- (void)refeshAidStatus;

@end


@class AidModel;

@interface AidApplyDetailViewController : NRBaseViewController

@property (nonatomic, strong) AidModel * aidModel;

@property (nonatomic, strong) NSDictionary * detailDic;

@property (nonatomic, strong) NSString * timeStr;

@property (nonatomic, strong) NSString * activityAddress;

@property (nonatomic, assign) id<AidApplyDetailViewControllerDelegate> delegate;

@end
