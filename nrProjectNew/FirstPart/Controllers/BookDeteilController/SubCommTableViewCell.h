//
//  SubCommTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubComment;
@interface SubCommTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView * lineImageView;

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * nameLabel;

@property (nonatomic, strong) UILabel * commentLabel;

- (void)setCommentContent:(SubComment *)model indexPath:(NSIndexPath *)indexPath;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(SubComment *)model;

@end
