//
//  CycleTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/18.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewPagedFlowView.h"

@interface CycleTableViewCell : UITableViewCell

@property (nonatomic, strong) NewPagedFlowView *pageFlowView;

- (void)configDataWithArtray:(NSMutableArray *)array;

- (void)adjustCenterSubview;

@end
