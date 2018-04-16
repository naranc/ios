//
//  TopTbTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopTbTableViewCell : UITableViewCell


@property (nonatomic, strong) UILabel * nameLabel;

@property (nonatomic, strong) UILabel * contentLabel;

- (void)setCommentContent:(NSString *)model indexPath:(NSIndexPath *)indexPath;

@end
