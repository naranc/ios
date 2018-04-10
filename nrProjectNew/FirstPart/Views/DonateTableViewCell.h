//
//  DonateTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/21.
//  Copyright © 2017年 by Bo. All rights reserved.
//


#import <UIKit/UIKit.h>

@class DonateModel;

@interface DonateTableViewCell : UITableViewCell

- (void)configCellWithModel:(DonateModel *)model indexPath:(NSIndexPath *)indexPath;

- (void)wishDetailViewConfigCellWithModel:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, assign) CGFloat cellHeight;

@end
