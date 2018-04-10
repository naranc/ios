//
//  AidDetailViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/30.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AidModel;

@interface AidDetailViewController : NRBaseViewController

@property (nonatomic, strong) NSNumber * aidId;

@property (nonatomic, strong) AidModel * aidModel;

@end
