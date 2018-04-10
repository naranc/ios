//
//  HelpHerViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HelpHerViewControllerDelegate <NSObject>

-(void)HelpDoneRefeshWishDetailView;

@end


@interface HelpHerViewController : NRBaseViewController

@property (nonatomic, strong) NSString * orderID;

@property (nonatomic, strong) NSString * province;//省

@property (nonatomic, strong) NSString * city;//市

@property (nonatomic, assign)id<HelpHerViewControllerDelegate>delegate;

@end
