//
//  HotBorrowTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorrowView.h"

@class BorrowView;
@interface HotBorrowTableViewCell : UITableViewCell

@property (nonatomic, strong) BorrowView *lBorrowView;

@property (nonatomic, strong) BorrowView *cBorrowView;

@property (nonatomic, strong) BorrowView *rBorrowView;

@end
