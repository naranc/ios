//
//  RecommentTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecommendModel;
@interface RecommentTableViewCell : UITableViewCell

- (void)configCellWithModel:(RecommendModel *)model indexPath:(NSIndexPath *)indexPath;

@end
