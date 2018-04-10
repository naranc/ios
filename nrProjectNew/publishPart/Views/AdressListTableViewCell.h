//
//  AdressListTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdressModel;

@interface AdressListTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^onClickSelectAdressButton)(void);

@property (nonatomic, copy) void(^onClickEidtButton)(void);

@property (nonatomic, copy) void(^onClickDeleteButton)(void);

- (void)configCellWithModel:(AdressModel *)model indexPath:(NSIndexPath *)indexPath;

@end
