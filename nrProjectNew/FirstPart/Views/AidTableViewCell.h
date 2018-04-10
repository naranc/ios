//
//  AidTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AidModel;

@interface AidTableViewCell : UITableViewCell

- (void)configCellWithModel:(AidModel *)model indexPath:(NSIndexPath *)indexPath;

@end
