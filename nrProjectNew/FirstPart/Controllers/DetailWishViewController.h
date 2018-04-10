//
//  DetailWishViewController.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/18.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailWishViewControllerDelegate <NSObject>


- (void)refreshWishDetailView;

@end

@class WishModel;
@interface DetailWishViewController : NRBaseViewController

@property (nonatomic, strong) NSDictionary * dicModel;

@property (nonatomic, strong) WishModel * wishModel;

@property (nonatomic, strong) id<DetailWishViewControllerDelegate>delegate;

@end
