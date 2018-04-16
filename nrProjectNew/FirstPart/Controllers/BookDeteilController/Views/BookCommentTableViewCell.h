//
//  BookCommentTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCommentTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * nameLabelabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UIImageView * lineImageView;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) ImageTextButton * commentButton;

@property (nonatomic, strong) ImageTextButton * zanButton;

- (void)setCommentContent:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath;

@end
