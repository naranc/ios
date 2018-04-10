//
//  WishListTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/28.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WishModel;
@interface WishListTableViewCell : UITableViewCell

- (void)configCellWithModel:(WishModel *)wishModel indexPath:(NSIndexPath *)indexPath;

@end
