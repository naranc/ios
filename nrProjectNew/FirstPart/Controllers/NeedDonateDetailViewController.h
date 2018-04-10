//
//  NeedDonateDetailViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/18.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NeedDonateDetailViewControllerDelegate <NSObject>


- (void)refreshDonateDetailView;

@end

@class DonateModel;

@interface NeedDonateDetailViewController : NRBaseViewController

@property (nonatomic, strong) NSDictionary * dicModel;

@property (nonatomic, strong) DonateModel * donateModel;

@property (nonatomic, strong) id<NeedDonateDetailViewControllerDelegate>delegate;

@end
