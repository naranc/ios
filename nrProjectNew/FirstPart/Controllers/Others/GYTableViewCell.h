//
//  GYTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/26.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GYTableViewCell : UITableViewCell

- (void)configCellWithModel:(NSDictionary *)dic indexPath:(NSIndexPath *)indexPath;

@end
