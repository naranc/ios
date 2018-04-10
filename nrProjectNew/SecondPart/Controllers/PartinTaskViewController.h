//
//  PartinTaskViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/24.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PartinTaskViewControllerDelegate <NSObject>

- (void)partInSuccessRefeshAidStatus;

@end

@interface PartinTaskViewController : NRBaseViewController

@property (nonatomic, strong) NSNumber * aidId;

@property (nonatomic, assign) id<PartinTaskViewControllerDelegate> delegate;

@end
