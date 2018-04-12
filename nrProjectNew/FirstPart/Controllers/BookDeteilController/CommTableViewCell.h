//
//  CommentTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommentModel;

@interface CommTableViewCell : UITableViewCell<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray * subCommentArray;

@property (nonatomic, strong) UITableView * commentTableView;

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) UIView * footerView;

@property (nonatomic, strong) UILabel * topCommentLabel;

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * nameLabel;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) UIButton * moreCommentBtn;

@property (nonatomic, strong) ImageTextButton * zanBtn;

@property (nonatomic, strong) ImageTextButton * commentBtn;

@property (nonatomic, strong) CommentModel * commentModel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(CommentModel *)model;

- (void)setCommentContent:(CommentModel *)model indexPath:(NSIndexPath *)indexPath;

@end
