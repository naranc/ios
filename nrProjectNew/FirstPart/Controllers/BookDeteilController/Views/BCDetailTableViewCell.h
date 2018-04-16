//
//  BCDetailTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCDetailTableViewCell : UITableViewCell


@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * nameLabelabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) ImageTextButton * zanButton;

@property (nonatomic, strong) UIButton * deleteButton;
- (void)setCommentContent:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath;

@end
