//
//  AdressListViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdressModel;
@protocol AdressListViewControllerDelegate <NSObject>

- (void)selectAdressModel:(AdressModel *)model;

@end

@interface AdressListViewController : NRBaseViewController

@property (nonatomic, assign) BOOL selectAdress;

@property (nonatomic, assign) id<AdressListViewControllerDelegate>delegate;

@end
